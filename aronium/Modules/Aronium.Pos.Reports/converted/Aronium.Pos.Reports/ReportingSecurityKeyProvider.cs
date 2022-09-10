// Decompiled with JetBrains decompiler
// Type: Aronium.Pos.Reports.ReportingSecurityKeyProvider
// Assembly: Aronium.Pos.Reports, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0B7A1CAC-06DB-41AB-87B3-9E6085CB1155
// Assembly location: E:\api\aron\aronium\Modules\Aronium.Pos.Reports\Aronium.Pos.Reports.dll

using Aronium.Common.Text;
using Aronium.Modularity;
using Aronium.Pos.Core;
using Aronium.Pos.Core.Models;
using System.Collections.Generic;

namespace Aronium.Pos.Reports
{
  public class ReportingSecurityKeyProvider : ISecurityKeyProvider, IPlugin, IPluggable
  {
    public IEnumerable<SecurityKey> Keys
    {
      get
      {
        OrderedSecurityKey[] keys = new OrderedSecurityKey[1];
        OrderedSecurityKey orderedSecurityKey = new OrderedSecurityKey("Management.Reporting", 400);
        ((SecurityKey) orderedSecurityKey).DisplayName = TranslationService.GetTranslation("Reports");
        ((SecurityKey) orderedSecurityKey).SecurityGroup = TranslationService.GetTranslation("Management");
        keys[0] = orderedSecurityKey;
        return (IEnumerable<SecurityKey>) keys;
      }
    }

    public void Initialize()
    {
    }
  }
}
