// Decompiled with JetBrains decompiler
// Type: Aronium.ApiClient.Authorization
// Assembly: Aronium.ApiClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 37915297-540F-463D-8D27-13A5F94096A5
// Assembly location: E:\api\aron\aronium\Modules\Aronium.ApiClient\Aronium.ApiClient.dll

using Aronium.Pos.Common.Extensions;
using Aronium.Realm.Models;
using System;

namespace Aronium.ApiClient
{
  public class Authorization
  {
    public Authorization(AccessToken accessToken)
    {
      ClassExtension.ThrowIfNull<AccessToken>(accessToken, nameof (accessToken));
      this.Created = DateTime.Now;
      this.AccessToken = accessToken;
    }

    public DateTime Created { get; }

    public AccessToken AccessToken { get; }

    public bool IsValid => this.Created.AddSeconds((double) (this.AccessToken.ExpiresIn - 60L)) > DateTime.Now;

    public DateTime Expires => this.Created.AddSeconds((double) this.AccessToken.ExpiresIn);
  }
}
