import { createRouter, createWebHistory } from "vue-router";
import managementRoutes from "@/Management/managementRoutes";
import posRoutes from "@/Pos/posRoutes";
import orderRoutes from "@/Orders/orderRoutes";

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
  {
    path: "/playground",
    name: "playground",
    component: () =>
      import(/* webpackChunkName: "playground" */ "@/layouts/Playground.vue"),
  },
];

const routes = allRoutes.concat(
  mainRoutes,
  posRoutes,
  orderRoutes,
  managementRoutes
);

const router = createRouter({
  history: createWebHistory("/"),
  routes,
});

router.beforeEach((to, from, next) => {
  console.log(`Navigating to: ${to.name}`);
  next();
});

export default router;
