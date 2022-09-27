import { createStore } from "vuex";
import createPersistedState from "vuex-persistedstate";
import axios from "axios";

import state from "@/store/state";
import actions from "@/store/actions";
import mutations from "@/store/mutations";
import getters from "@/store/getters";

axios.defaults.xsrfCookieName = "csrftoken";
axios.defaults.xsrfHeaderName = "X-CSRFToken";

export default createStore({
  state,
  mutations,
  actions,
  getters,
  modules: {},
  plugins: [createPersistedState()],
  strict: process.env.NODE_ENV !== "production",
});
