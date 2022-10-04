/* eslint-disable no-delete-var */
import { computed } from "vue";
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
export const addCash = (amount) => {
  return store.commit(ADD_CASH, amount);
};
export const updateKeyword = (keyword) => store.dispatch(ADD_KEYWORD, keyword);
export const useCash = computed(() => store.getters.GET_CASH);
export const useChange = computed(() => store.getters.GET_CHANGE);
export const useCart = computed(() => store.getters.GET_CART);
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

export const addToCart = (product) => store.dispatch(ADD_TO_CART, product);
export const findCartIndex = (product) => {
  return store.getters.GET_CART_INDEX(product);
};
export const addToCarts = (product) => {
  store.dispatch.ADD_TO_CART(product);
};
export const getTotalPrice = () => {
  return computed(() => store.getters.GET_TOTAL_PRICE);
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
