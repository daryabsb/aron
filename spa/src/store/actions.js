import getUser from "./api/getUser";
import getProducts from "./api/getProducts";
import getProductGroups from "./api/getProductGroups";
import createProductGroup from "./api/createProductGroup";
import getCustomers from "@/store/api/getCustomers";
import getPrinterList from "@/store/api/getPrinterList";

import { generateUID, useOrderItemIndex } from "@/store/composables";

import {
  FETCH_USER,
  COMMIT_USER,
  FETCH_PRODUCTS,
  FETCH_CUSTOMERS,
  COMMIT_CUSTOMERS,
  COMMIT_PRODUCTS,
  FETCH_PRODUCT_GROUPS,
  COMMIT_PRODUCT_GROUPS,
  CREATE_PRODUCT_GROUP,
  ADD_PRODUCT_GROUP,
  ADD_TO_CART,
  COMMIT_TO_CART,
  SUBMIT_ORDER,
  SUBMIT,
  UPDATE_KEYWORD,
  UPDATE_CASH,
  ADD_KEYWORD,
  ADD_CASH,
  FETCH_PRINTERS_LIST,
  COMMIT_PRINTERS_LIST,
  CREATE_CART,
  SUBMIT_CART,
  ADD_ACTIVE_ORDER_NUMBER,
  ADD_ACTIVE_ORDER,
  ADD_QUANTITY,
} from "@/store/constants";

const actions = {
  [FETCH_USER]: async (context) => {
    const user = await getUser();
    // console.log(user.value);
    context.commit(COMMIT_USER, user);
  },
  [FETCH_PRODUCTS]: async (context) => {
    const products = await getProducts();
    // console.log(user);
    context.commit(COMMIT_PRODUCTS, products);
  },
  [FETCH_CUSTOMERS]: async (context) => {
    const customers = await getCustomers();

    context.commit(COMMIT_CUSTOMERS, customers);
  },

  [FETCH_PRODUCT_GROUPS]: async (context) => {
    const productsGroup = await getProductGroups();

    await context.commit(COMMIT_PRODUCT_GROUPS, productsGroup);
  },

  [FETCH_PRINTERS_LIST]: async (context) => {
    const printerList = await getPrinterList();
    await context.commit(COMMIT_PRINTERS_LIST, printerList);
  },
  // [FETCH_ALL_PRODUCT_GROUPS]: async (context) => {
  //   const allProductsGroups = await getAllProductGroups();

  //   await context.commit(COMMIT_ALL_PRODUCT_GROUPS, allProductsGroups);
  // },
  [CREATE_PRODUCT_GROUP]: async (context, payload) => {
    const productGroup = await createProductGroup(payload);
    await context.commit(ADD_PRODUCT_GROUP, productGroup);
  },
  [CREATE_CART]: async (context) => {
    const order = {};
    // order.number = uuid.v4();
    order.number = generateUID();
    order.discount = 0;
    order.discountType = 0;
    order.items = [];
    order.tax = 0;
    order.total = 0;

    // console.log("ACTION ADD ACTIVE ORDER", order);
    await context.commit(ADD_ACTIVE_ORDER_NUMBER, order.number);
    await context.commit(ADD_ACTIVE_ORDER, order);
    await context.commit(SUBMIT_CART, order);
  },
  [ADD_TO_CART]: async (context, orderItem) => {
    const index = useOrderItemIndex(orderItem);

    if (index === -1) {
      await context.commit(COMMIT_TO_CART, orderItem);
    } else {
      await context.commit(ADD_QUANTITY, index);
    }
  },
  [ADD_KEYWORD](context, keyword) {
    context.commit(UPDATE_KEYWORD, keyword);
  },
  [UPDATE_CASH](context, amount) {
    // console.log("amount-actions", amount);

    context.commit(ADD_CASH, amount);
  },
  [SUBMIT_ORDER](context) {
    // console.log(payload);
    context.commit(SUBMIT);
  },
};
export default actions;
