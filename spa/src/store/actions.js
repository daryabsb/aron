import getUser from "./api/getUser";
import getProducts from "./api/getProducts";
import getProductGroups from "./api/getProductGroups";
import getAllProductGroups from "./api/getAllProductGroups";
import createProductGroup from "./api/createProductGroup";

import {
  FETCH_USER,
  COMMIT_USER,
  FETCH_PRODUCTS,
  COMMIT_PRODUCTS,
  FETCH_PRODUCT_GROUPS,
  FETCH_ALL_PRODUCT_GROUPS,
  COMMIT_PRODUCT_GROUPS,
  COMMIT_ALL_PRODUCT_GROUPS,
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

  [FETCH_PRODUCT_GROUPS]: async (context) => {
    const productsGroup = await getProductGroups();

    await context.commit(COMMIT_PRODUCT_GROUPS, productsGroup);
  },
  // [FETCH_ALL_PRODUCT_GROUPS]: async (context) => {
  //   const allProductsGroups = await getAllProductGroups();

  //   await context.commit(COMMIT_ALL_PRODUCT_GROUPS, allProductsGroups);
  // },
  [CREATE_PRODUCT_GROUP]: async (context, payload) => {
    const productGroup = await createProductGroup(payload);
    await context.commit(ADD_PRODUCT_GROUP, productGroup);
  },
  [ADD_TO_CART](context, payload) {
    const payloadToCommit = {
      getters: context.getters,
      product: payload,
    };
    context.commit(COMMIT_TO_CART, payloadToCommit);
  },
  [ADD_KEYWORD](context, keyword) {
    context.commit(UPDATE_KEYWORD, keyword);
  },
  [UPDATE_CASH](context, amount) {
    // console.log("amount-actions", amount);

    context.commit(ADD_CASH, amount);
  },
  [SUBMIT_ORDER](context, payload) {
    // console.log(payload);
    context.commit(SUBMIT);
  },
};
export default actions;
