// Decompiled with JetBrains decompiler
// Type: Aronium.Pos.Reports.ViewModels.ReportsViewModel
// Assembly: Aronium.Pos.Reports, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0B7A1CAC-06DB-41AB-87B3-9E6085CB1155
// Assembly location: E:\api\aron\aronium\Modules\Aronium.Pos.Reports\Aronium.Pos.Reports.dll

using Aronium.Common.Logging;
using Aronium.Common.Text;
using Aronium.Modularity.Infrastructure;
using Aronium.Pos.Common;
using Aronium.Pos.Common.Extensions;
using Aronium.Pos.Common.Helpers;
using Aronium.Pos.Common.Views;
using Aronium.Pos.Core;
using Aronium.Pos.Core.Models;
using Aronium.Pos.Facade;
using Aronium.Pos.Facade.Services;
using Aronium.Pos.ViewModels;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;

namespace Aronium.Pos.Reports.ViewModels
{
  public class ReportsViewModel : ViewModelBase
  {
    private static readonly ILogger logger = LoggerFactory.GetLogger<ReportsViewModel>();
    private ReportViewModel _selectedItem;
    private DateTime _startDate;
    private DateTime _endDate;
    private IPeriodSelection _periodSelection;
    private List<Product> _products;
    private List<Customer> _customers;
    private List<CashRegister> _cashRegisters;
    private List<User> _users;
    private Customer _selectedCustomer;
    private User _selectedUser;
    private Product _selectedProduct;
    private CashRegister _selectedCashRegister;
    private static IReportingService _reportingService;
    private List<ItemPath> _productGroups;
    private ItemPath _selectedProductGroup;
    private string favoriteGroupName;

    public RelayCommand SelectPeriod { get; set; }

    public RelayCommand SaveExcel { get; set; }

    public RelayCommand SavePdf { get; set; }

    public RelayCommand ToggleFavorite { get; set; }

    public RelayCommand ClearFavorites { get; set; }

    private IEnumerable<Customer> CustomerCollection
    {
      get
      {
        yield return new Customer()
        {
          Name = TranslationService.GetTranslation("Reports.Filter.Customer.All")
        };
        foreach (Customer customer in Singleton<CustomerFacade>.Instance.GetCustomers())
          yield return customer;
      }
    }

    private IEnumerable<Product> ProductCollection
    {
      get
      {
        Product product1 = new Product();
        ((PosItem) product1).Name = TranslationService.GetTranslation("Reports.Filter.Product.All");
        yield return product1;
        foreach (Product product2 in (IEnumerable<Product>) Singleton<ProductFacade>.Instance.GetProducts().OrderBy<Product, string>((Func<Product, string>) (x => ((PosItem) x).Name)))
          yield return product2;
      }
    }

    private IEnumerable<User> UsersCollection
    {
      get
      {
        yield return new User()
        {
          FirstName = TranslationService.GetTranslation("Reports.Filter.User.All")
        };
        foreach (User user in Singleton<UserFacade>.Instance.GetUsers())
          yield return user;
      }
    }

    private IEnumerable<CashRegister> CashRegistersCollection
    {
      get
      {
        yield return new CashRegister()
        {
          Name = TranslationService.GetTranslation("Reports.Filter.CashRegister.All")
        };
        foreach (CashRegister casheRegister in Singleton<OrderFacade>.Instance.GetCasheRegisters())
          yield return casheRegister;
      }
    }

    private IReportingService ReportingService
    {
      get
      {
        if (ReportsViewModel._reportingService == null)
          ReportsViewModel._reportingService = AroniumContainer.Resolve<IReportingService>();
        return ReportsViewModel._reportingService;
      }
    }

    public ReportsViewModel()
    {
      if (ViewModelBase.IsInDesignMode)
        return;
      this.favoriteGroupName = TranslationService.GetTranslation("Reports.Favorites");
      string translation1 = TranslationService.GetTranslation("Reports.Sales");
      string translation2 = TranslationService.GetTranslation("Reports.Purchase");
      string translation3 = TranslationService.GetTranslation("Reports.LossAndDamage");
      ObservableCollection<ReportViewModel> observableCollection = new ObservableCollection<ReportViewModel>();
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesProducts", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Products")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesProductGroups", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.ProductGroups")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesCustomers", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Customers")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesTax", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.TaxRates")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesUsers", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Users")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesPaymentTypes", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.PaymentTypes"),
        CanFilterProducts = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesPaymentTypesUsers", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.PaymentTypesUsers"),
        CanFilterProducts = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesPaymentTypesCustomers", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.PaymentTypesCustomers"),
        CanFilterProducts = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesRefunds", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Refunds")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesInvoiceList", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.InvoiceList")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesDailyTotals", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Daily"),
        CanFilterProducts = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesHourly", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Hourly"),
        CanFilterProducts = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesHourlyByProductGroups", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.HourlyByProductGroup")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\ProfitMargin", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Profit")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\SalesUnpaid", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Unpaid"),
        CanFilterProducts = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\StartingCash", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.StartingCash"),
        CanFilterProducts = false,
        CanFilterCustomers = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName(ApplicationData.Instance.DiscountApplyRule == null ? "Reports\\SalesDiscounts" : "Reports\\SalesDiscountsBeforeTax", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.Discounts"),
        CanFilterProducts = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName(ApplicationData.Instance.DiscountApplyRule == null ? "Reports\\SalesItemDiscounts" : "Reports\\SalesItemDiscountsBeforeTax", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.ItemDiscounts")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation1,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\StockMovement", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Sales.StockMovement")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation2,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\PurchaseProducts", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Purchase.Products"),
        CanFilterCashRegisters = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation2,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\PurchaseSuppliers", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Purchase.Suppliers"),
        CanFilterCashRegisters = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation2,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\PurchaseUnpaid", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Purchase.Unpaid"),
        CanFilterProducts = false,
        CanFilterCashRegisters = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation2,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\PurchaseDiscounts", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Purchase.Discounts"),
        CanFilterProducts = false,
        CanFilterCashRegisters = false
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation2,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\PurchaseItemDiscounts", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Purchase.ItemDiscounts")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation2,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\PurchaseInvoiceList", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.Purchase.PurchaseInvoiceList")
      }));
      observableCollection.Add(new ReportViewModel(new Report()
      {
        ReportGroup = translation3,
        FileName = ReportFileHelper.GetLocalFileName("Reports\\LossAndDamageProducts", TranslationService.IsRightToLeft),
        Name = TranslationService.GetTranslation("Reports.LossAndDamage.Products"),
        CanFilterCustomers = false,
        CanFilterCashRegisters = false
      }));
      this.Reports = observableCollection;
      foreach (Report report in AroniumContainer.Resolve<ItemsLocator>().GetItems<IReportProvider>().SelectMany<IReportProvider, Report>((Func<IReportProvider, IEnumerable<Report>>) (x => x.GetReports())))
        this.Reports.Add(new ReportViewModel(report));
      foreach (string favorite1 in Configuration<Config>.Instance.Favorites)
      {
        string favorite = favorite1;
        ReportViewModel report = this.Reports.FirstOrDefault<ReportViewModel>((Func<ReportViewModel, bool>) (x => x.FileName.EndsWith(favorite) && !x.IsFavorite));
        if (File.Exists(report?.FileName))
          this.AddFavorite(report);
      }
      this.Start = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
      this.End = DateTime.Today;
      this.SelectPeriod = new RelayCommand((Action<object>) (x => this.OnSelectPeriod()));
      this.SaveExcel = new RelayCommand((Action<object>) (x => this.OnSave((ExportType) 1)), (Predicate<object>) (x => this.SelectedItem != null));
      this.SavePdf = new RelayCommand((Action<object>) (x => this.OnSave((ExportType) 0)), (Predicate<object>) (x => this.SelectedItem != null));
      this.ToggleFavorite = new RelayCommand((Action<object>) (x => this.OnToggleFavorite((ReportViewModel) x)));
      this.ClearFavorites = new RelayCommand((Action<object>) (x => this.OnClearFavorites()));
    }

    private void OnClearFavorites()
    {
      foreach (ReportViewModel reportViewModel in this.Reports.Where<ReportViewModel>((Func<ReportViewModel, bool>) (x => x.ReportGroup.Equals(this.favoriteGroupName))).ToList<ReportViewModel>())
        this.Reports.Remove(reportViewModel);
      foreach (ReportViewModel reportViewModel in this.Reports.Where<ReportViewModel>((Func<ReportViewModel, bool>) (x => x.IsFavorite)))
        reportViewModel.IsFavorite = false;
      Configuration<Config>.Instance.Favorites.Clear();
      Configuration<Config>.Instance.Save();
      this.OnPropertyChanged("HasFavorites");
    }

    private void OnToggleFavorite(ReportViewModel report)
    {
      try
      {
        string reportRelativePath = ReportsViewModel.GetReportRelativePath(report);
        if (!report.IsFavorite)
        {
          this.AddFavorite(report);
          Configuration<Config>.Instance.Favorites.Add(reportRelativePath);
        }
        else
        {
          this.RemoveFavorite(report);
          Configuration<Config>.Instance.Favorites.Remove(reportRelativePath);
        }
        Configuration<Config>.Instance.Save();
        this.OnPropertyChanged("HasFavorites");
      }
      catch (Exception ex)
      {
        ReportsViewModel.logger.Error(ex);
        this.ShowNotification(ex.Message, (NotificationMessageType) 4);
      }
    }

    private void AddFavorite(ReportViewModel report)
    {
      int index = this.Reports.Count<ReportViewModel>((Func<ReportViewModel, bool>) (x => x.ReportGroup.Equals(this.favoriteGroupName)));
      report.IsFavorite = true;
      this.Reports.Insert(index, new ReportViewModel(report.Report.Clone() as Report, this.favoriteGroupName)
      {
        IsFavorite = true,
        IsInFavoritesGroup = true,
        Name = report.ReportGroup + " / " + report.Name
      });
    }

    private void RemoveFavorite(ReportViewModel report)
    {
      this.Reports.Remove(this.Reports.First<ReportViewModel>((Func<ReportViewModel, bool>) (x => x.Report.FileName == report.Report.FileName && x.ReportGroup == this.favoriteGroupName)));
      this.Reports.First<ReportViewModel>((Func<ReportViewModel, bool>) (x => x.Report.FileName == report.Report.FileName)).IsFavorite = false;
    }

    private static string GetReportRelativePath(ReportViewModel report)
    {
      DirectoryInfo directoryInfo = new FileInfo(report.FileName).Directory;
      while (directoryInfo != null && !directoryInfo.Name.Equals("Reports", StringComparison.OrdinalIgnoreCase))
        directoryInfo = directoryInfo.Parent;
      return report.FileName.Replace(directoryInfo.FullName, string.Empty).TrimStart(Path.DirectorySeparatorChar);
    }

    private void OnSelectPeriod()
    {
      this.PeriodSelection.PeriodSelected += new EventHandler<SelectedPeriodEventArgs>(this.OnPeriodSelected);
      this.PeriodSelection.Start = this.Start;
      this.PeriodSelection.End = this.End;
      this.ShowDialog((IModalDialog) this.PeriodSelection);
      this.PeriodSelection.PeriodSelected -= new EventHandler<SelectedPeriodEventArgs>(this.OnPeriodSelected);
    }

    private void OnPeriodSelected(object sender, SelectedPeriodEventArgs e)
    {
      this.Start = e.Start;
      this.End = e.End;
    }

    private void OnSave(ExportType exportType)
    {
      SaveFileDialog saveFileDialog = new SaveFileDialog();
      saveFileDialog.DefaultExt = exportType == null ? "pdf" : "xlsx";
      saveFileDialog.FileName = (this.SelectedItem.ReportGroup + "-" + this.SelectedItem.Name + "-" + DateTime.Today.ToString("yyyy-MM-dd") + "." + saveFileDialog.DefaultExt).ToLower();
      saveFileDialog.Filter = exportType == null ? "PDF Files (*.pdf)|*.pdf|All files (*.*)|*.*" : "Excel Files (*.xlsx)|*.xlsx|All files (*.*)|*.*";
      bool? nullable = saveFileDialog.ShowDialog();
      bool flag = true;
      if (!(nullable.GetValueOrDefault() == flag & nullable.HasValue))
        return;
      PrintPayload payload = this.GetPayload();
      payload.ExportType = exportType;
      payload.ExportDataOnly = true;
      payload.Destination = saveFileDialog.FileName;
      AroniumContainer.Resolve<IPrintService>().Export(payload);
    }

    public IPeriodSelection PeriodSelection
    {
      get
      {
        if (this._periodSelection == null)
          this._periodSelection = AroniumContainer.GetInstance<IPeriodSelection>();
        return this._periodSelection;
      }
    }

    public DateTime Start
    {
      get => this._startDate;
      set
      {
        this._startDate = value;
        this.OnPropertyChanged(nameof (Start));
        this.OnPropertyChanged("Period");
      }
    }

    public DateTime End
    {
      get => this._endDate;
      set
      {
        this._endDate = value;
        this.OnPropertyChanged(nameof (End));
        this.OnPropertyChanged("Period");
      }
    }

    public string Period
    {
      get
      {
        DateTime dateTime = this.Start;
        string str1 = dateTime.ToString(StringFormatExtension.GetStringFormat((StringFormatType) 1));
        dateTime = this.End;
        string str2 = dateTime.ToString(StringFormatExtension.GetStringFormat((StringFormatType) 1));
        return string.Format("{0} - {1}", (object) str1, (object) str2);
      }
    }

    public ObservableCollection<ReportViewModel> Reports { get; set; }

    public ReportViewModel SelectedItem
    {
      get => this._selectedItem;
      set
      {
        this._selectedItem = value;
        this.OnPropertyChanged(nameof (SelectedItem));
      }
    }

    public List<Customer> Customers
    {
      get
      {
        if (this._customers == null)
        {
          this._customers = new List<Customer>(this.CustomerCollection);
          this.SelectedCustomer = ((IEnumerable<Customer>) this._customers).First<Customer>();
        }
        return this._customers;
      }
    }

    public List<Product> Products
    {
      get
      {
        if (this._products == null)
        {
          this._products = new List<Product>(this.ProductCollection);
          this.SelectedProduct = ((IEnumerable<Product>) this._products).First<Product>();
        }
        return this._products;
      }
    }

    public List<CashRegister> CashRegisters
    {
      get
      {
        if (this._cashRegisters == null)
        {
          this._cashRegisters = this.CashRegistersCollection.ToList<CashRegister>();
          this.SelectedCashRegister = ((IEnumerable<CashRegister>) this._cashRegisters).First<CashRegister>();
        }
        return this._cashRegisters;
      }
    }

    public List<User> Users
    {
      get
      {
        if (this._users == null)
        {
          this._users = new List<User>(this.UsersCollection);
          this.SelectedUser = ((IEnumerable<User>) this._users).First<User>();
        }
        return this._users;
      }
    }

    public User SelectedUser
    {
      get => this._selectedUser;
      set
      {
        this._selectedUser = value;
        this.OnPropertyChanged(nameof (SelectedUser));
      }
    }

    public CashRegister SelectedCashRegister
    {
      get => this._selectedCashRegister;
      set
      {
        this._selectedCashRegister = value;
        this.OnPropertyChanged(nameof (SelectedCashRegister));
      }
    }

    public Product SelectedProduct
    {
      get => this._selectedProduct;
      set
      {
        this._selectedProduct = value;
        this.OnPropertyChanged(nameof (SelectedProduct));
      }
    }

    public Customer SelectedCustomer
    {
      get => this._selectedCustomer;
      set
      {
        this._selectedCustomer = value;
        this.OnPropertyChanged(nameof (SelectedCustomer));
      }
    }

    public List<ItemPath> ProductGroups
    {
      get
      {
        if (this._productGroups == null)
        {
          string translation = TranslationService.GetTranslation("Products");
          this._productGroups = new List<ItemPath>((IEnumerable<ItemPath>) new ItemPath[1]
          {
            new ItemPath() { Path = translation }
          });
          foreach (ItemPath productGroupsPath in AroniumContainer.Resolve<IProductService>().GetProductGroupsPaths())
          {
            productGroupsPath.Path = translation + " / " + productGroupsPath.Path;
            this._productGroups.Add(productGroupsPath);
          }
          this.SelectedProductGroup = ((IEnumerable<ItemPath>) this._productGroups).First<ItemPath>();
        }
        return this._productGroups;
      }
    }

    public ItemPath SelectedProductGroup
    {
      get => this._selectedProductGroup;
      set
      {
        this._selectedProductGroup = value;
        this.OnPropertyChanged(nameof (SelectedProductGroup));
      }
    }

    public bool IncludeSubgroups { get; set; } = true;

    public bool HasFavorites => this.Reports.Any<ReportViewModel>((Func<ReportViewModel, bool>) (x => x.IsFavorite));

    public PrintPayload GetPayload() => new PrintPayload()
    {
      FileName = this.SelectedItem.FileName,
      ReportName = this.SelectedItem.Name,
      ConnectionString = this.ReportingService.GetConnectionString(),
      Parameters = new Dictionary<string, object>()
      {
        {
          "Start",
          (object) this.Start
        },
        {
          "End",
          (object) this.End
        },
        {
          "CustomerId",
          this.SelectedCustomer.Id ?? Convert.DBNull
        },
        {
          "UserId",
          this.SelectedUser.Id ?? Convert.DBNull
        },
        {
          "ProductId",
          ((PosItem) this.SelectedProduct).Id ?? Convert.DBNull
        },
        {
          "Customer",
          (object) this.SelectedCustomer.Name
        },
        {
          "User",
          (object) this.SelectedUser.FullName
        },
        {
          "Product",
          (object) ((PosItem) this.SelectedProduct).Name
        },
        {
          "CashRegisterId",
          this.SelectedCashRegister?.Id ?? Convert.DBNull
        },
        {
          "CashRegisterName",
          (object) this.SelectedCashRegister?.Name
        },
        {
          "ProductGroupId",
          this.SelectedProductGroup.Id ?? Convert.DBNull
        },
        {
          "IncludeSubgroups",
          (object) (this.IncludeSubgroups ? 1 : 0)
        }
      }
    };
  }
}
