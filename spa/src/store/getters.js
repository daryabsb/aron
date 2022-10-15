import {
    GET_USER,
    GET_PRODUCTS,
    GET_PRODUCT_GROUPS,
    GET_CUSTOMERS,
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
    GET_PRINTERS_LIST,
    GET_MONEYS,
    GET_DISCOUNT,
    GET_CART_BY_NUMBER,
    GET_CART_LAST_ORDER,
    GET_ACTIVE_ORDER_NUMBER,
    GET_ACTIVE_ORDER,

} from "@/store/constants";

import { getItemTotalPrice, getActiveOrder } from "@/store/composables";

const getters = {
    [GET_USER](state) {
        return state.user;
    },
    [GET_PRODUCTS](state) {
        return state.products;
    },
    [GET_CUSTOMERS](state) {
        return state.customers;
    },
    [GET_PRODUCT_GROUPS](state) {
        return state.productGroups;
    },
    [GET_PRINTERS_LIST](state) {
        return state.printerList;
    },
    // [GET_ALL_PRODUCT_GROUPS](state) {
    //   return state.allProductGroups;
    // },
    [GET_TAB_PRODUCTS](state) {
        return state.tabProducts;
    },
    [GET_CART_BY_NUMBER](state) {
        if (!state.cart.length) return;
        return state.cart[state.cart.length - 1];
    },
    [GET_CART](state) {
        return state.cart;
    },
    [GET_CART_LAST_ORDER](state) {
        return state.cart.length ? state.cart[state.cart.length - 1] : [];
    },
    [GET_ITEMS_COUNT](state) {
        if (!state.cart.items) return 0;
        return state.cart.items.reduce((count, item) => count + item.quantity, 0);
    },
    [GET_DISCOUNT](state) {
        return state.discount + state.discountType;
    },
    [GET_TOTAL_PRICE](state) {
        // return state.cart.reduce((total, item) => total + item.qty * item.price, 0);
        if (!state.cart.items) return 0;
        return state.cart.items.reduce(
            (total, item) => total + getItemTotalPrice(item).value,
            0
        );
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
    [GET_MONEYS](state) {
        return state.moneys;
    },
    [GET_ACTIVE_ORDER_NUMBER](state) {
        return state.activeOrderNumber;
    },
    [GET_ACTIVE_ORDER](state) {
        return state.activeOrder;
    },
    // [GET_CART_INDEX]: (state) => (product) => {
    //   if (!getActiveOrder.value && !product) return -1;
    //   console.log(getActiveOrder.value);
    //   return getActiveOrder.items.findIndex((p) => p.id === product.id);
    // },
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