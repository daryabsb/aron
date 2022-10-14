const state = () => {
  return {
    user: null,
    image: "",
    products: [],
    tabProducts: [],
    productGroups: [],
    allProductGroups: [],

    // POS STATE
    db: null,
    time: null,
    firstTime: localStorage.getItem("first_time") === null,
    activeMenu: "pos",
    loadingSampleData: false,
    moneys: [250, 500, 1000, 5000, 10000, 25000, 50000, 100000],
    keyword: "",
    // cart: [],
    cart: [],
    cash: 0,
    discount: "",
    discountType: "%",
    change: 0,
    isShowModalReceipt: false,
    receiptNo: null,
    receiptDate: null,

    // CUSTOMERS STATE
    customers: [],

    // PRINTERS STATE
    printerList: [],
  };
};

// console.log(typeof(state))

export default state;
