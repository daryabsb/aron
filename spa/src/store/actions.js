import getUser from "./api/getUser";
import getProducts from "./api/getProducts";

import {
  FETCH_USER,
  COMMIT_USER,
  FETCH_PRODUCTS,
  COMMIT_PRODUCTS,
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
};
export default actions;
