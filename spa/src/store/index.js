import { createStore } from "vuex";
import createPersistedState from "vuex-persistedstate";
import axios from "axios";

import getUser from "./api/getUser";
import getProducts from "./api/getProducts";

import { FETCH_USER, GET_USER, COMMIT_USER, FETCH_PRODUCTS, COMMIT_PRODUCTS,GET_PRODUCTS } from "@/store/constants";

axios.defaults.xsrfCookieName = "csrftoken";
axios.defaults.xsrfHeaderName = "X-CSRFToken";

export default createStore({
  state: {
    user: null,
    image: "",
    products: [],
  },

  mutations: {
    [COMMIT_USER](state, payload) {
      state.user = payload;
    },
    [COMMIT_PRODUCTS](state, payload) {
      state.products = payload;
    },
  },
  actions: {
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
  },
  getters: {
    [GET_USER](state) {
      return state.user;
    },
    [GET_PRODUCTS](state) {
      return state.products;
    },
  },
  modules: {},
  plugins: [createPersistedState],
});
