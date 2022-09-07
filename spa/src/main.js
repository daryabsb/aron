import { createApp } from "vue";
import router from "@/router";
import store from "@/store";
import "@fortawesome/fontawesome-free/css/all.min.css";
import "@/assets/tailwind.css";

import App from "@/App.vue";

createApp(App).use(store).use(router).mount("#app");
