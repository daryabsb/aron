const state = () => {
  return {
    user: null,
    image: "",
    products: [],

    // POS STATE
    db: null,
    time: null,
    firstTime: localStorage.getItem("first_time") === null,
    activeMenu: "pos",
    loadingSampleData: false,
    moneys: [2000, 5000, 10000, 20000, 50000, 100000],
    keyword: "",
    cart: [],
    cash: 0,
    change: 0,
    isShowModalReceipt: false,
    receiptNo: null,
    receiptDate: null,
  };
};

// console.log(typeof(state))

export default state;
