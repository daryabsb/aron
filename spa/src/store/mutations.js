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
  [FIND_CART_INDEX](state, product) {
    return state.cart.findIndex((p) => p.id === product.id);
  },
  [COMMIT_TO_CART](state, product) {
    const index = findCartIndex(product);
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
    beep();
    updateChange();
  },
  [UPDATE_CHANGE](state) {
    state.change = state.cash - getTotalPrice();
  },
  [ADD_QUANTITY](state, { item, qty }) {
    const index = state.cart.findIndex((i) => i.id === item.id);
    if (index === -1) {
      return;
    }
    const afterAdd = item.qty + qty;
    if (afterAdd === 0) {
      state.cart.splice(index, 1);
      clearSound();
    } else {
      state.cart[index].qty = afterAdd;
      beep();
    }
    getTotalPrice();
  },

  [ADD_CASH](state, amount) {
    state.cash = (state.cash || 0) + amount;

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
