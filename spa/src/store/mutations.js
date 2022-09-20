import {
  beep,
  clearSound,
  getTotalPrice,
  updateChange,
  findCartIndex,
} from "@/store/composables";

import {
  COMMIT_USER,
  COMMIT_PRODUCTS,
  FIND_CART_INDEX,
  ADD_QUANTITY,
  ADD_CASH,
  UPDATE_CHANGE,
  GET_TOTAL_PRICE,
  UPDATE_CASH,
  CLEAR,
  SUBMIT,
  UPDATE_KEYWORD,
  COMMIT_TO_CART,
  GET_CART_INDEX,
} from "@/store/constants";

const mutations = {
  [COMMIT_USER](state, payload) {
    state.user = payload;
  },
  [COMMIT_PRODUCTS](state, payload) {
    state.products = payload;
  },
  [UPDATE_KEYWORD](state, payload) {
    state.keyword = payload;
  },
  [GET_TOTAL_PRICE](state) {
    state.cart.reduce((total, item) => total + item.qty * item.price, 0);
  },
  [FIND_CART_INDEX](state, product) {},
  [COMMIT_TO_CART](state, payload) {
    const { product, getters } = payload;
    const index = getters.GET_CART_INDEX(product);
    console.log("index", index);
    if (index === -1) {
      state.cart.push({
        id: product.id,
        image: product.image,
        name: product.name,
        price: product.price,
        option: product.option,
        qty: 1,
      });
    } else {
      state.cart[index].qty += 1;
    }
    // beep();
    // updateChange();
  },
  [UPDATE_CHANGE](state) {
    console.log("change called");

    state.change = state.cash - getTotalPrice().value;
    console.log("change mutations", state.change);
  },
  [GET_TOTAL_PRICE](state) {
    state.cart.reduce((total, item) => total + item.qty * item.price, 0);
  },
  [ADD_QUANTITY](state, payload) {
    console.log("ADD_QUANTITY", payload.item);
    const { index, quantity } = payload;
    console.log(payload);
    // const index = state.cart.findIndex((i) => i.id === payload.item.id);
    if (index === -1) {
      return;
    }
    const afterAddItem = state.cart[index].qty + quantity;
    if (afterAddItem === 0) {
      state.cart.splice(index, 1);
      clearSound();
    } else {
      state.cart[index].qty = afterAddItem;
      beep();
    }
    getTotalPrice();
  },

  [ADD_CASH](state, amount) {
    console.log("amount-mutations", amount);
    console.log("cash before-mutations", state.cash);
    state.cash += amount || 0;
    console.log("cash after-mutations", state.cash);

    updateChange();
    beep();
  },

  [UPDATE_CASH](state, value) {
    state.cash = parseFloat(value.replace(/[^0-9]+/g, ""));
    updateChange();
  },
  [CLEAR](state) {
    state.cash = 0;
    state.cart = [];
    state.receiptNo = null;
    state.receiptDate = null;
    updateChange();
    clearSound();
  },
  [SUBMIT]() {
    const time = new Date();
    this.isShowModalReceipt = true;
    this.receiptNo = `TWPOS-KS-${Math.round(time.getTime() / 1000)}`;
    this.receiptDate = this.dateFormat(time);
  },
};
export default mutations;
