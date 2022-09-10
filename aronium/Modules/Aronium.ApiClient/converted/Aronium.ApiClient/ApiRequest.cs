// Decompiled with JetBrains decompiler
// Type: Aronium.ApiClient.ApiRequest
// Assembly: Aronium.ApiClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 37915297-540F-463D-8D27-13A5F94096A5
// Assembly location: E:\api\aron\aronium\Modules\Aronium.ApiClient\Aronium.ApiClient.dll

using Aronium.Common.Logging;
using Aronium.Pos.Common.Helpers;
using Aronium.Pos.Core;
using Aronium.Realm.Client.Utils;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;
using System.Reflection;
using System.Text;

namespace Aronium.ApiClient
{
  public class ApiRequest : IDisposable
  {
    private static ILogger logger = LoggerFactory.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
    private static readonly JsonSerializerSettings jsonSerializerSettings = new JsonSerializerSettings()
    {
      NullValueHandling = NullValueHandling.Ignore
    };
    private const string ARONIUM_ACTIVATION_KEY_HEADER_NAME = "Aronium-Activation-Key";
    private static string _activationKey;

    public ApiRequest()
    {
    }

    public ApiRequest(string url) => this.Url = url;

    public ApiRequest(string url, object data)
      : this(url)
    {
      this.Data = JsonConvert.SerializeObject(data, ApiRequest.jsonSerializerSettings);
    }

    private string ActivationKeyHeader
    {
      get
      {
        if (string.IsNullOrEmpty(ApiRequest._activationKey))
          ApiRequest._activationKey = Convert.ToBase64String(EncryptionUtil.Encrypt(SystemHelper.GetMachineFingerprint()));
        return ApiRequest._activationKey;
      }
    }

    public string Method { get; set; } = "GET";

    public string Data { get; set; }

    public string Url { get; set; }

    private string GetResponse()
    {
      ApiRequest.logger.Debug("Executing remote server request...");
      HttpWebRequest httpWebRequest = WebRequest.Create(this.Url) as HttpWebRequest;
      httpWebRequest.ContentType = "application/json";
      httpWebRequest.Method = this.Method.ToString();
      Authorization authorization;
      if (Session.Contains<Authorization>("Api.Authorization", ref authorization))
        httpWebRequest.Headers.Add("Authorization", "Bearer " + authorization.AccessToken.Token);
      try
      {
        httpWebRequest.Headers.Add("Aronium-Activation-Key", this.ActivationKeyHeader);
      }
      catch (Exception ex)
      {
        ApiRequest.logger.Error(ex);
      }
      if (this.Data == null && (this.Method == "PUT" || this.Method == "POST"))
        httpWebRequest.ContentLength = 0L;
      if (!string.IsNullOrEmpty(this.Data))
      {
        using (StreamWriter streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
          streamWriter.Write(this.Data);
      }
      string response1 = string.Empty;
      try
      {
        using (HttpWebResponse response2 = httpWebRequest.GetResponse() as HttpWebResponse)
        {
          ApiRequest.logger.Debug(string.Format("Response status code: {0}", (object) response2.StatusCode));
          if (response2.StatusCode != HttpStatusCode.OK)
          {
            if (response2.StatusCode != HttpStatusCode.Created)
              goto label_41;
          }
          if (response2.StatusCode == HttpStatusCode.Created)
          {
            response1 = response2.Headers["Location"];
          }
          else
          {
            using (StreamReader streamReader = new StreamReader(response2.GetResponseStream(), Encoding.UTF8))
              response1 = streamReader.ReadToEnd();
          }
        }
      }
      catch (WebException ex)
      {
        ApiRequest.logger.Warning(ex.Message);
        if (!(ex.Response is HttpWebResponse))
          throw new Exception("Error occured while executing web request.", (Exception) ex);
        if (((HttpWebResponse) ex.Response).StatusCode == HttpStatusCode.Forbidden)
          throw new Exception("Unauthorized access. Please check your credentials and try again.", (Exception) ex);
        using (Stream responseStream = ex.Response.GetResponseStream())
        {
          using (StreamReader streamReader = new StreamReader(responseStream))
          {
            string end = streamReader.ReadToEnd();
            throw new Exception(string.IsNullOrEmpty(end) ? ex.Message : end, (Exception) ex);
          }
        }
      }
      catch
      {
        throw;
      }
label_41:
      return response1;
    }

    public T Get<T>() => JsonConvert.DeserializeObject<T>(this.GetResponse());

    public T Post<T>()
    {
      this.Method = "POST";
      return this.Get<T>();
    }

    public void Post()
    {
      this.Method = "POST";
      this.GetResponse();
    }

    public void Delete()
    {
      this.Method = "DELETE";
      this.GetResponse();
    }

    public void Dispose() => GC.SuppressFinalize((object) this);
  }
}
