// Decompiled with JetBrains decompiler
// Type: Aronium.Pos.Reports.Views.Default
// Assembly: Aronium.Pos.Reports, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0B7A1CAC-06DB-41AB-87B3-9E6085CB1155
// Assembly location: E:\api\aron\aronium\Modules\Aronium.Pos.Reports\Aronium.Pos.Reports.dll

using Aronium.Common.Logging;
using Aronium.Common.Text;
using Aronium.Modularity;
using Aronium.Modularity.Infrastructure;
using Aronium.Pos.Core;
using Aronium.Pos.Facade.Services;
using Aronium.Pos.Management.Core;
using Aronium.Pos.Print.Views;
using Aronium.Pos.Reports.ViewModels;
using Aronium.Wpf.Toolkit.Controls;
using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;

namespace Aronium.Pos.Reports.Views
{
  [AccessKey("Management.Reporting")]
  public partial class Default : 
    UserControl,
    IManagementPlugin,
    IVisualPlugin,
    IPlugin,
    IPluggable,
    IComponentConnector,
    IStyleConnector
  {
    private static readonly ILogger logger = LoggerFactory.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
    private static Geometry icon = Geometry.Parse("m 12,48 0,-36 36,0 36,0 0,36 0,36 -36,0 -36,0 0,-36 z m 24,6 0,-14 -4,0 -4,0 0,14 0,14 4,0 4,0 0,-14 z m 16,-6 0,-20 -4,0 -4,0 0,20 0,20 4,0 4,0 0,-20 z m 16,12 0,-8 -4,0 -4,0 0,8 0,8 4,0 4,0 0,-8 z");
    private string _name;
    internal ClosableTabControl tabControlReports;
    internal TextBlock tbHeader;
    internal ListBox lbReports;
    private bool _contentLoaded;

    private ReportsViewModel ViewModel => this.DataContext as ReportsViewModel;

    static Default() => Default.icon.Freeze();

    public Default()
    {
      this.InitializeComponent();
      if (this.lbReports.ItemsSource != null)
        ((CollectionView) CollectionViewSource.GetDefaultView((object) this.lbReports.ItemsSource)).GroupDescriptions.Add((GroupDescription) new PropertyGroupDescription("ReportGroup"));
      this.CommandBindings.Add(new CommandBinding((ICommand) ApplicationCommands.Print, new ExecutedRoutedEventHandler(this.OnPrint), new CanExecuteRoutedEventHandler(this.CanPrint)));
      this.CommandBindings.Add(new CommandBinding((ICommand) ApplicationCommands.PrintPreview, new ExecutedRoutedEventHandler(this.OnPrintPreview), new CanExecuteRoutedEventHandler(this.CanPrint)));
      this._name = TranslationService.GetTranslation("Reports");
    }

    private void OnPrintPreview(object sender, ExecutedRoutedEventArgs e) => this.ShowSelectedReport();

    private void OnPrint(object sender, ExecutedRoutedEventArgs e) => AroniumContainer.Resolve<IPrintService>().Print(this.ViewModel.GetPayload());

    private void CanPrint(object sender, CanExecuteRoutedEventArgs e) => e.CanExecute = this.ViewModel.SelectedItem != null;

    private void OnListBoxItemMouseDoubleClick(object sender, MouseButtonEventArgs e) => this.ShowSelectedReport();

    public int DisplayIndex => 40;

    public string DisplayName => this._name;

    public object Icon => (object) Default.icon;

    public void Close()
    {
    }

    public void Initialize()
    {
    }

    private void OnShowReport(object sender, RoutedEventArgs e) => this.ShowSelectedReport();

    private void ShowSelectedReport()
    {
      try
      {
        if (!File.Exists(this.ViewModel.SelectedItem.FileName))
        {
          this.ViewModel.ShowNotification(TranslationService.GetTranslation("Reports.Report.NotFound"), (NotificationMessageType) 4);
        }
        else
        {
          this.Cursor = Cursors.Wait;
          ClosableTabItem closableTabItem = new ClosableTabItem();
          ((HeaderedContentControl) closableTabItem).Header = (object) this.ViewModel.SelectedItem.Name;
          ((ContentControl) closableTabItem).Content = (object) new PrintPreview(this.ViewModel.GetPayload());
          ClosableTabItem newItem = closableTabItem;
          ((ItemsControl) this.tabControlReports).Items.Add((object) newItem);
          ((Selector) this.tabControlReports).SelectedItem = (object) newItem;
        }
      }
      catch (Exception ex)
      {
        Default.logger.Error(ex);
        this.ViewModel.ShowNotification(ex.Message, (NotificationMessageType) 4);
      }
      finally
      {
        this.Cursor = Cursors.Arrow;
      }
    }

    [DebuggerNonUserCode]
    [GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
    public void InitializeComponent()
    {
      if (this._contentLoaded)
        return;
      this._contentLoaded = true;
      Application.LoadComponent((object) this, new Uri("/Aronium.Pos.Reports;component/views/default.xaml", UriKind.Relative));
    }

    [DebuggerNonUserCode]
    [GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
    [EditorBrowsable(EditorBrowsableState.Never)]
    void IComponentConnector.Connect(int connectionId, object target)
    {
      switch (connectionId)
      {
        case 1:
          this.tabControlReports = (ClosableTabControl) target;
          break;
        case 2:
          this.tbHeader = (TextBlock) target;
          break;
        case 3:
          this.lbReports = (ListBox) target;
          break;
        default:
          this._contentLoaded = true;
          break;
      }
    }

    [DebuggerNonUserCode]
    [GeneratedCode("PresentationBuildTasks", "4.0.0.0")]
    [EditorBrowsable(EditorBrowsableState.Never)]
    void IStyleConnector.Connect(int connectionId, object target)
    {
      if (connectionId != 4)
        return;
      ((Style) target).Setters.Add((SetterBase) new EventSetter()
      {
        Event = Control.MouseDoubleClickEvent,
        Handler = (Delegate) new MouseButtonEventHandler(this.OnListBoxItemMouseDoubleClick)
      });
    }
  }
}
