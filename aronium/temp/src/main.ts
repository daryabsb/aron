import { createApp } from "vue";
import App from "./App.vue";
import "./assets/tailwind.css";
import router from "./router";
import { createPinia } from "pinia";
import Popper from "vue3-popper";
import moment from "moment";

const pinia = createPinia();

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

app.use(pinia).use(router).mount("#app");
