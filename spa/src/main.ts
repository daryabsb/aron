import { createApp } from "vue";
import router from "@/router";
import store from "@/store";
import VueCookies from "vue-cookies";

import Popper from "vue3-popper";
import "@fortawesome/fontawesome-free/css/all.min.css";
import "@/assets/styles/tailwind.css";
// import "@/assets/css/style.css";

import App from "@/App.vue";
// import './assets/tailwind.css'

createApp(App)
  .component("Popper", Popper)
  .use(store)
  .use(router)
  .use(VueCookies)
  .mount("#app");
