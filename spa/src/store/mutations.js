import { COMMIT_USER, COMMIT_PRODUCTS } from "@/store/constants";

const mutations = {
  [COMMIT_USER](state, payload) {
    state.user = payload;
  },
  [COMMIT_PRODUCTS](state, payload) {
    state.products = payload;
  },
};
export default mutations;
