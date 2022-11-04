import { createRouter, createWebHistory } from "vue-router";
import managementRoutes from "@/Management/managementRoutes";
import storeRoutes from "@/Pos/storeRoutes";

import Index from "@/views/Index.vue";

const allRoutes = [];

const mainRoutes = [
  {
    path: "/",
    name: "Home",
    component: Index,
    // component: () =>
    //   import(/* webpackChunkName: "index" */ "@/views/Index.vue"),
  },
];

const routes = allRoutes.concat(mainRoutes, storeRoutes, managementRoutes);

const router = createRouter({
  history: createWebHistory("/"),
  routes,
});

router.beforeEach((to, from, next) => {
  console.log(`Navigating to: ${to.name}`);
  next();
});

export default router;
