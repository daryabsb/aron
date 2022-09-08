import { createStore } from "vuex";
import createPersistedState from "vuex-persistedstate";
import axios from "axios"

export const FETCH_USER = 'FETCH_USER';

export default createStore({
  state: {
    user: {}
  },
  getters: {},
  mutations: {
    [FETCH_USER](state, payload) {
      state.user = payload;
    },
  },
  actions: {
    async fetchUser(context) {
      console.log("indexNavbar");
      const response = await axios.get('http://127.0.0.1:8000/user/me/')
      console.log(response.data);
      this.user = response.data
      context.commit([FETCH_USER])
    },
  },
  modules: {},
  plugins: [createPersistedState]
});
