import {
  beep,
  clearSound,
  getTotalPrice,
  updateChange,
} from "@/store/composables";
import moment from "moment";
import {
  COMMIT_USER,
  COMMIT_PRODUCTS,
  COMMIT_PRODUCT_GROUPS,
  ADD_PRODUCT_GROUP,
  COMMIT_TAB_PRODUCTS,
  ADD_QUANTITY,
  ADD_CASH,
  UPDATE_CHANGE,
  GET_TOTAL_PRICE,
  UPDATE_CASH,
  CLEAR,
  SUBMIT,
  UPDATE_KEYWORD,
  COMMIT_TO_CART,
  CLOSE_MODAL_RECEIPT,
} from "@/store/constants";

const mutations = {
  [COMMIT_USER](state, payload) {
    state.user = payload;
  },
  [COMMIT_PRODUCTS](state, payload) {
    state.products = payload;
  },
  // [COMMIT_ALL_PRODUCT_GROUPS](state, payload) {
  //   payload.forEach((el) => {
  //     if (el.groups != null) {
  //       el.groups.forEach((node) => {
  //         let currentNodeIndex = payload.findIndex((g) => g.id === node.id);
  //         payload.splice(currentNodeIndex, 1);
  //       });
  //     }
  //   });
  //   state.allProductGroups = payload;
  // },
  [COMMIT_PRODUCT_GROUPS](state, payload) {
    state.productGroups = payload;
  },
  [ADD_PRODUCT_GROUP](state, payload) {
    state.productGroups.push(payload);
  },
  [COMMIT_TAB_PRODUCTS](state, groupID) {
    state.tabProducts = state.products.filter(
      (p) => p.product_group === groupID
    );
  },
  [UPDATE_KEYWORD](state, payload) {
    state.keyword = payload;
  },
  [GET_TOTAL_PRICE](state) {
    state.cart.reduce((total, item) => total + item.qty * item.price, 0);
  },
  // [FIND_CART_INDEX](state, product) {},
  [COMMIT_TO_CART](state, payload) {
    const { product, getters } = payload;
    const index = getters.GET_CART_INDEX(product);
    // console.log("index", index);
    if (index === -1) {
      state.cart.push({
        id: product.id,
        image: product.image,
        name: product.name,
        price: product.price,
        currency: product.currency,
        measurement: product.measurement_unit,
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
    // console.log("change called");

    state.change = state.cash - getTotalPrice().value;
    // console.log("change mutations", state.change);
  },
  [GET_TOTAL_PRICE](state) {
    state.cart.reduce((total, item) => total + item.qty * item.price, 0);
  },
  [ADD_QUANTITY](state, payload) {
    // console.log("ADD_QUANTITY", payload.item);
    const { item, quantity } = payload;
    // console.log(payload);
    const index = state.cart.findIndex((i) => i.id === item.id);
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
    // console.log("amount-mutations", amount);
    // console.log("cash before-mutations", state.cash);
    state.cash += amount || 0;
    // console.log("cash after-mutations", state.cash);

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
  [CLOSE_MODAL_RECEIPT](state) {
    state.isShowModalReceipt = false;
  },
  [SUBMIT](state) {
    const time = new Date();
    state.isShowModalReceipt = true;
    state.receiptNo = `ARONPOS-KS-${Math.round(time.getTime() / 1000)}`;
    state.receiptDate = moment(time);
  },
};
export default mutations;
