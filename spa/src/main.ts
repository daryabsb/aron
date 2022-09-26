import { createApp } from "vue";
import router from "@/router";
import store from "@/store";
import VueCookies from "vue-cookies";
import moment from "moment";
import Tree from "vue3-tree";
import "vue3-tree/dist/style.css";

import Popper from "vue3-popper";
import "@fortawesome/fontawesome-free/css/all.min.css";
// import "@/assets/styles/tailwind.css";
import "@/assets/tailwind.css";
// import "@/assets/css/style.css";

import App from "@/App.vue";
// import './assets/tailwind.css'

// createApp(App)
//   .component("Popper", Popper)
//   .use(store)
//   .use(router)
//   .use(VueCookies)
//   .use(require("vue-moment"))
//   .mount("#app");

const app = createApp(App);

/**
 * @params {date} date to be converted to timeago
 * @returns returns timeAgo
 */

app.config.globalProperties.$filters = {
  timeAgo(date: moment.MomentInput) {
    return moment(date).fromNow();
  },
  dateMoment(date: moment.MomentInput) {
    // return moment(date).format("dddd, MMMM Do YYYY");
    return moment(date).format("DD/MM/YYYY");
  },
};
app
  .component("Popper", Popper)
  .component("tree", Tree)
  .use(store)
  .use(router)
  .use(VueCookies)
  .mount("#app");
