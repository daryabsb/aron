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
    moneys: [250, 500, 5000, 10000, 25000, 50000],
    keyword: "",
    cart: [],
    cash: 0,
    change: 0,
    isShowModalReceipt: false,
    receiptNo: null,
    receiptDate: null,

    // CUSTOMERS STATE
    customers: [],
  };
};

// console.log(typeof(state))

export default state;
