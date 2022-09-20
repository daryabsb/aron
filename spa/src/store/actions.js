import getUser from "./api/getUser";
import getProducts from "./api/getProducts";

import {
  FETCH_USER,
  COMMIT_USER,
  FETCH_PRODUCTS,
  COMMIT_PRODUCTS,
  ADD_TO_CART,
  COMMIT_TO_CART,
  FIND_CART_INDEX,
  COMMIT_FIND_INDEX,
  UPDATE_KEYWORD,
  ADD_KEYWORD,
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
};
export default actions;
