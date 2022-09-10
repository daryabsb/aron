// Decompiled with JetBrains decompiler
// Type: Aronium.Pos.Reports.ReportsModule
// Assembly: Aronium.Pos.Reports, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0B7A1CAC-06DB-41AB-87B3-9E6085CB1155
// Assembly location: E:\api\aron\aronium\Modules\Aronium.Pos.Reports\Aronium.Pos.Reports.dll

using Aronium.Common.Logging;
using Aronium.Modularity;
using Aronium.Pos.Core;
using System.Reflection;

namespace Aronium.Pos.Reports
{
  [LocalizedAssemblyLocation("Modules\\Aronium.Pos.Reports\\Lang")]
  [Module(Name = "Aronium.Pos.Reports")]
  [ModuleDependency("Aronium.Pos.Management")]
  public class ReportsModule : LocalizedModule
  {
    private static ILogger logger = LoggerFactory.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

    public virtual void Initialize() => ReportsModule.logger.Debug("Initializing Aronium.Pos.Reports module");
  }
}
