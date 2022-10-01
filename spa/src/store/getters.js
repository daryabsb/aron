import {
  GET_USER,
  GET_PRODUCTS,
  GET_PRODUCT_GROUPS,
  GET_ALL_PRODUCT_GROUPS,
  GET_CART,
  GET_CHANGE,
  GET_CASH,
  SUBMITABLE,
  GET_CART_INDEX,
  GET_KEYWORD,
  GET_TOTAL_PRICE,
  GET_ITEMS_COUNT,
  GET_IS_SHOW_MODAL_RECEIPT,
  GET_RECEIPT_NUMBER,
  GET_RECEIPT_DATE,
  GET_TAB_PRODUCTS,
} from "@/store/constants";

const getters = {
  [GET_USER](state) {
    return state.user;
  },
  [GET_PRODUCTS](state) {
    return state.products;
  },
  [GET_PRODUCT_GROUPS](state) {
    return state.productGroups;
  },
  // [GET_ALL_PRODUCT_GROUPS](state) {
  //   return state.allProductGroups;
  // },
  [GET_TAB_PRODUCTS](state) {
    return state.tabProducts;
  },
  [GET_CART](state) {
    return state.cart;
  },
  [GET_ITEMS_COUNT](state) {
    return state.cart.reduce((count, item) => count + item.qty, 0);
  },
  [GET_TOTAL_PRICE](state) {
    return state.cart.reduce((total, item) => total + item.qty * item.price, 0);
  },
  [SUBMITABLE](state) {
    return state.change >= 0 && state.cart.length > 0;
  },
  [GET_CHANGE](state) {
    return state.change;
  },
  [GET_CASH](state) {
    return state.cash;
  },
  [GET_CART_INDEX]: (state) => (product) =>
    state.cart.findIndex((p) => p.id === product.id),
  [GET_KEYWORD](state) {
    return state.keyword;
  },
  [GET_IS_SHOW_MODAL_RECEIPT](state) {
    return state.isShowModalReceipt;
  },
  [GET_RECEIPT_NUMBER](state) {
    return state.receiptNo;
  },
  [GET_RECEIPT_DATE](state) {
    return state.receiptDate;
  },
};

export default getters;
