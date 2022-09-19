import {
  GET_USER,
  GET_PRODUCTS,
  GET_CHANGE,
  GET_CASH,
  SUBMITABLE,
} from "@/store/constants";

const getters = {
  [GET_USER](state) {
    return state.user;
  },
  [GET_PRODUCTS](state) {
    return state.products;
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
};

export default getters;
