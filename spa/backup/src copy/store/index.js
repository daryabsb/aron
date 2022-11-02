import { createStore } from "vuex";
import createPersistedState from "vuex-persistedstate";
import axios from "axios";

import getUser from "./api/getUser";

import { FETCH_USER, GET_USER, COMMIT_USER } from "@/store/constants";

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
  },
  actions: {
    [FETCH_USER]: async (context) => {
      const user = await getUser();
      context.commit(COMMIT_USER, user);
    },
  },
  getters: {
    [GET_USER](state) {
      return state.user;
    },
  },
  modules: {},
  plugins: [createPersistedState],
});
