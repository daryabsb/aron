import {
  beep,
  clearSound,
  getTotalPrice,
  updateChange,
  activeOrderNumber,
  activeOrderIndex,
  useOrderItemIndex,
  addQty,
} from "@/store/composables";
import moment from "moment";
import {
  COMMIT_USER,
  COMMIT_PRODUCTS,
  COMMIT_PRODUCT_GROUPS,
  COMMIT_CUSTOMERS,
  ADD_DISCOUNT,
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
  COMMIT_PRINTERS_LIST,
  SUBMIT_CART,
  ADD_ACTIVE_ORDER_NUMBER,
  ADD_ACTIVE_ORDER,
} from "@/store/constants";

const mutations = {
  [COMMIT_CUSTOMERS](state, payload) {
    state.customers = payload;
  },
  [COMMIT_USER](state, payload) {
    state.user = payload;
  },
  [COMMIT_PRODUCTS](state, payload) {
    state.products = payload;
  },
  [ADD_DISCOUNT](state, payload) {
    state.discount = payload.discount;
    state.discountType = payload.discountType;
  },

  [COMMIT_PRODUCT_GROUPS](state, payload) {
    state.productGroups = payload;
  },

  [COMMIT_PRODUCT_GROUPS](state, payload) {
    state.productGroups = payload;
  },
  [COMMIT_PRINTERS_LIST](state, payload) {
    state.printerList = payload;
  },
  [COMMIT_TAB_PRODUCTS](state, groupID) {
    if (groupID === 0) state.tabProducts = state.products;
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
  [SUBMIT_CART](state, order) {
    state.cart.push(order);
  },
  [ADD_ACTIVE_ORDER_NUMBER](state, payload) {
    state.activeOrderNumber = payload;
  },
  [ADD_ACTIVE_ORDER](state, order) {
    state.activeOrder = order;
  },
  [COMMIT_TO_CART](state, orderItem) {
    // console.log("state.cart", state.cart);

    const index = useOrderItemIndex(orderItem);

    console.log("WHAT IS MISSING", orderItem);

    console.log("active Order index", activeOrderIndex.value);
    console.log("orderItem index", index);
    if (index === -1) {
      state.cart[activeOrderIndex.value].items.push(orderItem);
      return;
    } else {
      // console.log("FOUND IN ORDER");
      state.cart[0].items[0].quantity += 1;
      console.log(
        "check if quantity added",
        state.cart[activeOrderIndex.value].items[index].quantity
      );
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
    const { item, quantity } = payload;
    console.log(payload);

    const activeOrderIndex = state.cart.findIndex(
      (order) => order.number === activeOrderNumber.value
    );

    const index = useOrderItemIndex(item);

    if (index === -1) {
      return;
    }

    state.cart[activeOrderIndex].items[index].quantity += quantity;

    beep();
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
