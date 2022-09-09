import { createStore } from "vuex";
import createPersistedState from "vuex-persistedstate";
import axios from "axios";

export const FETCH_USER = "FETCH_USER";
export const GET_USER = "GET_USER";

axios.defaults.xsrfCookieName = "csrftoken";
axios.defaults.xsrfHeaderName = "X-CSRFToken";

export default createStore({
  state: {
    user: {},
    image: "",
    products: [],
  },

  mutations: {
    [FETCH_USER](state, payload) {
      state.user = payload;
      state.image = payload.image;
    },
  },
  actions: {
    fetchUser: async (context) => {
      const user = await axios.get("http://127.0.0.1:8000/api/user/me/");
      context.commit(FETCH_USER, user.data);

      const productsResponse = await axios.get(
        "http://127.0.0.1:8000/api/products/"
      );
      console.log(productsResponse.data);

      // const response = await axios({
      //   method: 'post',
      //   url: 'http://127.0.0.1:8000/api/user/token/',
      //   data: {
      //     email: "root@root.com",
      //     password: "root"
      //   },
      //   headers: {
      //     'Content-Type': 'application/json',
      //   }
      // })

      // console.log(response.data);
    },
  },
  getters: {
    [GET_USER](state) {
      console.log(state.user.image);
      return state.user;
    },
  },
  modules: {},
  plugins: [createPersistedState],
});
