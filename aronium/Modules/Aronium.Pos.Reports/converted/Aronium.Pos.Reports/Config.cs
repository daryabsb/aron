// Decompiled with JetBrains decompiler
// Type: Aronium.Pos.Reports.Config
// Assembly: Aronium.Pos.Reports, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0B7A1CAC-06DB-41AB-87B3-9E6085CB1155
// Assembly location: E:\api\aron\aronium\Modules\Aronium.Pos.Reports\Aronium.Pos.Reports.dll

using Aronium.Pos.Core;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace Aronium.Pos.Reports
{
  [Configuration("Config.xml")]
  public class Config : Configuration<Config>
  {
    [XmlArrayItem(ElementName = "Report")]
    public List<string> Favorites { get; set; } = new List<string>();
  }
}
