import { uuid } from "vue3-uuid";
import {
    beep,
    clearSound,
    getTotalPrice,
    updateChange,
    generateUID,
    getActiveOrder,
    findCartIndex,
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

    [COMMIT_PRODUCT_GROUPS](state, payload) {
        state.productGroups = payload;
    },
    [COMMIT_PRINTERS_LIST](state, payload) {
        state.printerList = payload;
    },
    [COMMIT_TAB_PRODUCTS](state, groupID) {
        console.log("groupID", groupID);
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
    [SUBMIT_CART](state) {
        const order = {};
        // order.number = uuid.v4();
        order.number = generateUID();
        order.discount = 0;
        order.discountType = 0;
        order.items = [];
        order.tax = 0;
        order.total = 0;

        state.activeOrderNumber = order.number;
        state.activeOrder = order;
        state.cart.push(order);
        console.log(state.cart);
    },
    [COMMIT_TO_CART](state, payload) {
        const { orderItem, getters } = payload;

        // if (orderItem) {
        // }
        // if (state.cart.length === -1) {
        //   cart.items = [];
        //   state.cart.push(cart);
        // }

        const index = findCartIndex(orderItem);
        console.log("index", index);

        if (index === -1) {
            console.log("Mutation", getActiveOrder().items);
            getActiveOrder().items.push(orderItem);
        } else {
            getActiveOrder().items[index].quantity += 1;
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