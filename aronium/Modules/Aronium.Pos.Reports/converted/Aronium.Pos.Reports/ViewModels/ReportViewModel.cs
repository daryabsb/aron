// Decompiled with JetBrains decompiler
// Type: Aronium.Pos.Reports.ViewModels.ReportViewModel
// Assembly: Aronium.Pos.Reports, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0B7A1CAC-06DB-41AB-87B3-9E6085CB1155
// Assembly location: E:\api\aron\aronium\Modules\Aronium.Pos.Reports\Aronium.Pos.Reports.dll

using Aronium.Pos.Core.Models;
using System.ComponentModel;

namespace Aronium.Pos.Reports.ViewModels
{
  public class ReportViewModel : INotifyPropertyChanged
  {
    private bool isFavorite;

    public event PropertyChangedEventHandler PropertyChanged;

    public ReportViewModel(Report report) => this.Report = report;

    public ReportViewModel(Report report, string reportGroup)
      : this(report)
    {
      this.Report.ReportGroup = reportGroup;
    }

    private void OnPropertyChanged(string propertyName)
    {
      PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
      if (propertyChanged == null)
        return;
      propertyChanged((object) this, new PropertyChangedEventArgs(propertyName));
    }

    public Report Report { get; }

    public bool IsFavorite
    {
      get => this.isFavorite;
      set
      {
        this.isFavorite = value;
        this.OnPropertyChanged(nameof (IsFavorite));
      }
    }

    public bool IsInFavoritesGroup { get; set; }

    public string Name
    {
      get => this.Report.Name;
      set => this.Report.Name = value;
    }

    public string ReportGroup => this.Report.ReportGroup;

    public string FileName => this.Report.FileName;

    public bool CanFilterProducts => this.Report.CanFilterProducts;

    public bool CanFilterCustomers => this.Report.CanFilterCustomers;

    public bool CanFilterCashRegisters => this.Report.CanFilterCashRegisters;

    public bool CanFilterPeriod => this.Report.CanFilterPeriod;

    public bool CanFilterUsers => this.Report.CanFilterUsers;

    public override string ToString() => this.Report.Name ?? base.ToString();
  }
}
