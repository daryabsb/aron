/* eslint-disable no-delete-var */
import { ref, computed } from "vue";
import axios from "axios";
// import { store } from "vuex";

import {
  FETCH_USER,
  FETCH_PRODUCTS,
  FETCH_CUSTOMERS,
  FETCH_PRODUCT_GROUPS,
  CREATE_PRODUCT_GROUP,
  ADD_KEYWORD,
  SUBMIT_ORDER,
  ADD_CASH,
  CLEAR,
  ADD_QUANTITY,
  UPDATE_CHANGE,
  CLOSE_MODAL_RECEIPT,
  ADD_TO_CART,
  COMMIT_TAB_PRODUCTS,
  FETCH_PRINTERS_LIST,
  ADD_DISCOUNT,
  CREATE_CART,
} from "@/store/constants";
import store from "@/store";

/* ACTIONS */

// USERS COMPOSABLES
export const useFetchUserDispatch = () => {
  store.dispatch(FETCH_USER);
};

// PRODUCTS COMPOSABLES
export const useFetchProductsDispatch = () => {
  store.dispatch(FETCH_PRODUCTS);
};

export const useFetchProductGroupsDispatch = () => {
  store.dispatch(FETCH_PRODUCT_GROUPS);
};

export const addNewProductGroup = (group) => {
  if (group.parent_group === 0) group.parent_group = null;
  store.dispatch(CREATE_PRODUCT_GROUP, group);
};

export const token = async (email, password) => {
  const response = await axios.post("/api/user/token/", { email, password });
  return response.data;
};

export const useFetchPrinterListDispatch = () => {
  store.dispatch(FETCH_PRINTERS_LIST);
};
export const usePrinterList = computed(() => store.getters.GET_PRINTERS_LIST);

export const useFetchAllProductGroupsDispatch = () => {
  store.dispatch(FETCH_PRODUCT_GROUPS);
};

// CUSTOMERS COMPOSABLES
export const useFetchCustomersDispatch = () => {
  store.dispatch(FETCH_CUSTOMERS);
};
export const useCustomers = computed(() => store.getters.GET_CUSTOMERS);

// CASH COMPOSABLES
export const openCashModal = ref(false);

// PAYMENT COMPOSABLES
export const openPaymentModal = ref(false);

// ORDERS COMPOSABLES
export const filteredTabProductsByGroupId = (groupID) => {
  store.commit(COMMIT_TAB_PRODUCTS, groupID);
};

// UTILITIES COMPOSABLES
export const dateFormat = (date) => {
  const formatter = new Intl.DateTimeFormat("id", {
    dateStyle: "short",
    timeStyle: "short",
  });
  return formatter.format(date);
};
export const numberFormat = (number) => {
  return (number || "")
    .toString()
    .replace(/^0|\./g, "")
    .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
};
export const priceFormat = (number) => {
  return computed(() => (number ? ` ${numberFormat(number)} IQD` : ` 0 IQD`));
};

export const clearSound = () => {
  playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
};
export const playSound = (src) => {
  if (src) {
    const sound = new Audio(src);
    sound.play();
  }
};

export const beep = () =>
  playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");

// POS Composable
export const keyword = computed(() => store.getters.GET_KEYWORD);
export const products = computed(() => store.getters.GET_PRODUCTS);
export const filteredProducts = computed(() => {
  // const store = useStore();

  const rg = keyword.value ? new RegExp(keyword.value, "gi") : null;

  console.log(products.value.filter((p) => !rg || p.name.match(rg)));
  return tabProducts.value.filter((p) => !rg || p.name.match(rg));
});

export const addCash = (amount) => {
  return store.commit(ADD_CASH, amount);
};
export const updateKeyword = (keyword) => store.dispatch(ADD_KEYWORD, keyword);
export const useCash = computed(() => store.getters.GET_CASH);
export const useChange = computed(() => store.getters.GET_CHANGE);
// export const useCart = computed(() => store.getters.GET_CART);
export const useCart = computed(() => store.getters.GET_CART_LAST_ORDER);
export const useMoneys = computed(() => store.getters.GET_MONEYS);
export const receiptNo = computed(() => store.getters.GET_RECEIPT_NUMBER);
export const receiptDate = computed(() => store.getters.GET_RECEIPT_DATE);
export const tabProducts = computed(() => {
  if (store.getters.GET_TAB_PRODUCTS.length > 0) {
    return store.getters.GET_TAB_PRODUCTS;
  }
  return store.getters.GET_PRODUCTS;
});
export const isShowModalReceipt = computed(
  () => store.getters.GET_IS_SHOW_MODAL_RECEIPT
);

export const createCart = () => store.dispatch(CREATE_CART);

export const addToCart = (product) => store.dispatch(ADD_TO_CART, product);
export const findCartIndex = (product) => {
  return store.getters.GET_CART_INDEX(product);
};
export const addDiscount = (payload) => {
  console.log(payload.discount);
  store.commit(ADD_DISCOUNT, payload);
};
export const addToCarts = (product) => {
  store.dispatch.ADD_TO_CART(product);
};
// // ADD QUANTITY COMPOSABLES
// const isUsingCalculator = ref(false)
// export const calculatorValue = ref(0);
// export const openCalculator = () => {
//     isUsingCalculator.value = true;
//     return value
// };
export const getCartIndex = (item) =>
  computed(() => store.getters.GET_CART_INDEX(item));
export const getTotalPrice = () => {
  return computed(() => store.getters.GET_TOTAL_PRICE);
};
export const getItemTotalPrice = (item) => {
  let discount;
  if (item.discountType === "%") {
    discount = item.price * item.qty * (item.discount / 100);
  } else {
    discount = item.discount;
  }
  return computed(() => item.price * item.qty - discount);
};
export const getItemsCount = () => {
  return computed(() => store.getters.GET_ITEMS_COUNT);
};
export const clear = () => {
  return store.commit(CLEAR);
};
export const closeModalReceipt = () => {
  store.commit(CLOSE_MODAL_RECEIPT);
};

export const addQty = (item, quantity) => {
  const payload = {};
  const index = useCart.value.findIndex((i) => i.productId === item.productId);

  if (index === -1) {
    return;
  }
  payload.item = item;
  payload.quantity = quantity;

  store.commit(ADD_QUANTITY, payload);
  updateChange();
};
export const updateChange = () => {
  return store.commit(UPDATE_CHANGE);
};
export const updateCash = (value) => store.commit.UPDATE_CASH(value);

export const submitable = () => {
  return store.getters.SUBMITABLE;
};
export const submit = () => store.dispatch(SUBMIT_ORDER);

// TEMPORARY FUNCTIONS

export const anyWindowFunction = (evt) => {
  // F keys event listener
  console.log(evt);
  window.onkeydown = (evt) => {
    const getEvt = (key) => {
      key = key.toString();

      const myKeys = new Map();

      // myKeys.set("119", (openPaymentModal.value = !openPaymentModal.value));
      // myKeys.set("120", (openCashModal.value = !openCashModal.value));
      console.log(myKeys.get(key) || "None");
    };

    getEvt(evt.keyCode);
    // console.log(typeof evt.keyCode);
    return "119" || "Did not reach";
    // openModal(evt);
    // switch (evt.keyCode) {
    //   //ESC
    //   case 27:
    //     evt.preventDefault();
    //     console.log("esc");
    //     break;
    //   //F1
    //   case 112:
    //     evt.preventDefault();
    //     console.log("f1");
    //     break;
    //   default:
    //     return;
    // }
  };

  // END of F keys
};
