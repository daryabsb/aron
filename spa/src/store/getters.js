import { GET_USER, GET_PRODUCTS } from "@/store/constants";

const getters = {
  [GET_USER](state) {
    return state.user;
  },
  [GET_PRODUCTS](state) {
    return state.products;
  },
};

export default getters;
