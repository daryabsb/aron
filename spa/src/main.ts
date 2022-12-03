import { createApp, markRaw } from "vue";
import router from "@/router";
import store from "@/store";
import { createPinia } from "pinia";
import VueCookies from "vue-cookies";
import moment from "moment";
// import UUID from "vue3-uuid";
// import myUpload from "vue-image-crop-upload";

import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
// import { library } from "@fortawesome/fontawesome-svg-core";

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
  dateToRandom(date: moment.MomentInput) {
    // return moment(date).format("dddd, MMMM Do YYYY");
    return moment(date).format("YY-MM-DD");
  },
  dateMoment(date: moment.MomentInput) {
    // return moment(date).format("dddd, MMMM Do YYYY");
    return moment(date).format("DD/MM/YYYY");
  },
  reverse(items: string[]) {
    return items.slice().reverse();
  },
};

const pinia = createPinia();
pinia.use(({ store }) => {
  store.router = markRaw(router);
});
app
  .component("Popper", Popper)
  // .component("myUpload", myUpload)
  .use(store)
  // .use(createPinia())
  .use(pinia)
  .use(router)
  .use(VueCookies)
  // .use(UUID)
  .component("font-awesome-icon", FontAwesomeIcon)
  .mount("#app");
