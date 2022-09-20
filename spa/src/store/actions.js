import getUser from "./api/getUser";
import getProducts from "./api/getProducts";

import {
  FETCH_USER,
  COMMIT_USER,
  FETCH_PRODUCTS,
  COMMIT_PRODUCTS,
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
    // console.log(user);
    context.commit(COMMIT_USER, user);
  },
  [FETCH_PRODUCTS]: async (context) => {
    const products = await getProducts();
    // console.log(user);
    context.commit(COMMIT_PRODUCTS, products);
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
    console.log("amount-actions", amount);

    context.commit(ADD_CASH, amount);
  },
  [SUBMIT_ORDER](context, payload) {
    console.log(payload);
    context.commit(SUBMIT);
  },
};
export default actions;
