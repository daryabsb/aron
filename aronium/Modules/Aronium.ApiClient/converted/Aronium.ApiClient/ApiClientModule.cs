// Decompiled with JetBrains decompiler
// Type: Aronium.ApiClient.ApiClientModule
// Assembly: Aronium.ApiClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 37915297-540F-463D-8D27-13A5F94096A5
// Assembly location: E:\api\aron\aronium\Modules\Aronium.ApiClient\Aronium.ApiClient.dll

using Aronium.ApiClient.Services;
using Aronium.Common.Logging;
using Aronium.Modularity;
using Aronium.Modularity.Infrastructure;
using Aronium.Pos.Facade.Services;
using System.Reflection;

namespace Aronium.ApiClient
{
  [Module(Name = "Aronium.ApiClient")]
  public class ApiClientModule : IModule, IPluggable
  {
    private static readonly ILogger logger = LoggerFactory.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

    public void Initialize()
    {
      ApiClientModule.logger.Debug("Initializing Aronium.ApiClient module");
      AroniumContainer.Register<IApiService>((IApiService) new ApiService());
    }
  }
}
