import {
  GET_USER,
  GET_PRODUCTS,
  GET_CART,
  GET_CHANGE,
  GET_CASH,
  SUBMITABLE,
  GET_CART_INDEX,
  GET_KEYWORD,
} from "@/store/constants";

const getters = {
  [GET_USER](state) {
    return state.user;
  },
  [GET_PRODUCTS](state) {
    return state.products;
  },
  [GET_CART](state) {
    return state.cart;
  },
  getItemsCount() {
    return this.cart.reduce((count, item) => count + item.qty, 0);
  },
  getTotalPrice() {
    return this.cart.reduce((total, item) => total + item.qty * item.price, 0);
  },
  [SUBMITABLE](state) {
    return state.change >= 0 && state.cart.length > 0;
  },
  [GET_CHANGE](state) {
    return state.change;
  },
  [GET_CASH](state) {
    return state.GET_CASH;
  },
  [GET_CART_INDEX]: (state) => (product) =>
    state.cart.findIndex((p) => p.id === product.id),
  [GET_KEYWORD](state) {
    return state.keyword;
  },
};

export default getters;
