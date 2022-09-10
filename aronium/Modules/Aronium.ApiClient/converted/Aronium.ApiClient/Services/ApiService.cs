// Decompiled with JetBrains decompiler
// Type: Aronium.ApiClient.Services.ApiService
// Assembly: Aronium.ApiClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 37915297-540F-463D-8D27-13A5F94096A5
// Assembly location: E:\api\aron\aronium\Modules\Aronium.ApiClient\Aronium.ApiClient.dll

using Aronium.Common.Logging;
using Aronium.Modularity;
using Aronium.Modularity.Infrastructure;
using Aronium.Pos.Common.Helpers;
using Aronium.Pos.Core;
using Aronium.Pos.Core.Models;
using Aronium.Pos.Facade.Services;
using Aronium.Realm;
using Aronium.Realm.Client;
using Aronium.Realm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Aronium.ApiClient.Services
{
  public class ApiService : IApiService
  {
    private static readonly ILogger logger = LoggerFactory.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
    private static string refreshToken;
    private static string _baseUrl;
    private static string machineFingerprint;
    private static bool hardwareIdGenerated;
    private const string API_VERSION = "2";
    private const string CHECK_IN_ENDPOINT = "/device";
    private const string USERDATA_ENDPOINT = "/userdata";
    private const string FEEDBACK_ENDPOINT = "/feedback";
    private const string LICENSE_ENDPOINT = "/license";
    private const string RESET_PASSWORD_ENDPOINT = "/password/reset";
    private const string LOGIN_ENDPOINT = "/login";
    private const string ACCOUNT_ENDPOINT = "/account";
    private const string STORES_ENDPOINT = "/account/{0}/store";
    private const string STORE_LICENSE_ENDPOINT = "/store/{0}/license";
    private const string LICENSED_PRODUCT_ENDPOINT = "/license/{0}/product";

    private static IApplicationService ApplicationService => AroniumContainer.Resolve<IApplicationService>();

    private string BaseUrl
    {
      get
      {
        if (string.IsNullOrEmpty(ApiService._baseUrl))
          ApiService._baseUrl = ApiService.ApplicationService.GetProperty("Application.Api.BaseUrl", "https://api.aronium.com/api").Value + "/v2";
        return ApiService._baseUrl;
      }
    }

    private static string RefreshToken
    {
      get
      {
        if (ApiService.refreshToken == null)
          ApiService.refreshToken = ApiService.ApplicationService.GetProperty("Account.RefreshToken")?.Value;
        return ApiService.refreshToken;
      }
    }

    private Authorization Authorization
    {
      get => Session.Get<Authorization>("Api.Authorization");
      set => Session.Set("Api.Authorization", (object) value);
    }

    private T WithAuthorization<T>(Func<T> action)
    {
      this.Authorize();
      return action();
    }

    private void WithAuthorization(Action action)
    {
      this.Authorize();
      action();
    }

    private void Authorize()
    {
      Authorization authorization = this.Authorization;
      if ((authorization != null ? (authorization.IsValid ? 1 : 0) : 0) != 0 || ApiService.RefreshToken == null)
        return;
      this.RequestAccessToken(new AccessTokenRequest()
      {
        GrantType = (GrantType) 1,
        RefreshToken = ApiService.RefreshToken
      });
    }

    private AccessToken RequestAccessToken(AccessTokenRequest accessTokenRequest)
    {
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) "/login"), (object) accessTokenRequest))
      {
        AccessToken accessToken = apiRequest.Post<AccessToken>();
        if (accessToken == null)
          return (AccessToken) null;
        this.Authorization = new Authorization(accessToken);
        if (!string.IsNullOrEmpty(accessToken.RefreshToken))
        {
          ApiService.ApplicationService.AddProperty(new ApplicationProperty("Account.RefreshToken", accessToken.RefreshToken));
          ApiService.refreshToken = accessToken.RefreshToken;
        }
        return accessToken;
      }
    }

    public Update CheckIn()
    {
      ApiService.logger.Debug("Checking in...");
      string str = ApiService.ApplicationService.GetProperty("Application.User.Email")?.Value;
      Guid applicationId = ApiService.ApplicationService.GetApplicationId();
      string osFriendlyName = SystemHelper.GetOSFriendlyName();
      Version version1 = Assembly.GetEntryAssembly().GetName().Version;
      Version version2 = SystemHelper.NetFrameworkUtil.GetVersion();
      ApiService.logger.Debug(string.Format(".NET Framework {0} on {1}", (object) version2, (object) osFriendlyName));
      Guid? nullable = new Guid?();
      if (LicenseManager.LicenseExists)
      {
        try
        {
          nullable = (Guid?) LicenseManager.License?.Data?.Id;
        }
        catch (Exception ex)
        {
          ApiService.logger.Error("Error reading license from file for check in.", ex);
        }
      }
      if (!ApiService.hardwareIdGenerated && string.IsNullOrEmpty(ApiService.machineFingerprint))
      {
        ApiService.hardwareIdGenerated = true;
        try
        {
          ApiService.machineFingerprint = SystemHelper.GetMachineFingerprint();
        }
        catch (Exception ex)
        {
          ApiService.logger.Error("Error loading hardware id.", ex);
        }
      }
      Device data = new Device()
      {
        Id = applicationId,
        Version = version1.ToString(),
        Email = str,
        OSVersion = osFriendlyName + " (" + SystemHelper.GetSystemOSName() + ")",
        TimeZoneOffset = (int) TimeZone.CurrentTimeZone.GetUtcOffset(DateTime.Now).TotalMinutes,
        NetFrameworkVersion = version2.ToString(),
        LicenseId = nullable,
        HardwareId = ApiService.machineFingerprint
      };
      data.Modules = string.Join(", ", ((IEnumerable<CatalogItem>) AroniumContainer.Resolve<IModuleManager>().Catalog.Items).Where<CatalogItem>((Func<CatalogItem, bool>) (x => x.IsModule)).Select<CatalogItem, string>((Func<CatalogItem, string>) (x => x.Name)));
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) "/device"), (object) data))
        return apiRequest.Post<Update>();
    }

    public void SendUserData(UserData userData)
    {
      ApiService.logger.Debug("Sending user data");
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) "/userdata"), (object) userData))
        apiRequest.Post<Update>();
    }

    public void SendFeedback(UserFeedback feedback)
    {
      ApiService.logger.Debug("Sending feedback");
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) "/feedback"), (object) feedback))
        apiRequest.Post();
    }

    public ResponseMessage SendResetPasswordRequest(User user)
    {
      string url = string.Format("{0}{1}", (object) this.BaseUrl, (object) "/password/reset");
      ResetPasswordRequest data = new ResetPasswordRequest()
      {
        ApplicationId = ApiService.ApplicationService.GetApplicationId(),
        Email = user.Email,
        UserId = user.Id
      };
      using (ApiRequest apiRequest = new ApiRequest(url, (object) data))
        return apiRequest.Post<ResponseMessage>();
    }

    public AccessToken Login(string email, string password) => this.RequestAccessToken(new AccessTokenRequest()
    {
      GrantType = (GrantType) 0,
      Email = email,
      Password = password
    });

    public Account GetAccount() => this.WithAuthorization<Account>((Func<Account>) (() =>
    {
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) "/account")))
        return apiRequest.Get<Account>();
    }));

    public IEnumerable<Store> GetStores(Guid accountId) => this.WithAuthorization<IEnumerable<Store>>((Func<IEnumerable<Store>>) (() =>
    {
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) string.Format("/account/{0}/store", (object) accountId))))
        return apiRequest.Get<IEnumerable<Store>>();
    }));

    public License GetLicense(Guid storeId) => this.WithAuthorization<License>((Func<License>) (() =>
    {
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) string.Format("/store/{0}/license", (object) storeId))))
        return apiRequest.Get<License>();
    }));

    public Account CreateAccount(Account account)
    {
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) "/account"), (object) account))
        return apiRequest.Post<Account>();
    }

    public Store CreateStore(Store store) => this.WithAuthorization<Store>((Func<Store>) (() =>
    {
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) string.Format("/account/{0}/store", (object) store.AccountId)), (object) store))
        return apiRequest.Post<Store>();
    }));

    public License CreateLicense(Guid storeId) => this.WithAuthorization<License>((Func<License>) (() =>
    {
      License data = new License(new LicenseData()
      {
        StoreId = storeId
      });
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) "/license"), (object) data))
        return apiRequest.Post<License>();
    }));

    public void StartTrial(Guid licenseId, Guid productId) => this.WithAuthorization((Action) (() =>
    {
      Product data = new Product()
      {
        Id = new Guid?(productId)
      };
      using (ApiRequest apiRequest = new ApiRequest(string.Format("{0}{1}", (object) this.BaseUrl, (object) string.Format("/license/{0}/product", (object) licenseId)), (object) data))
        apiRequest.Post();
    }));
  }
}
