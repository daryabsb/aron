// import { routerKey } from "vue-router";
import Index from "@/views/Index.vue";

const routes = [
  {
    path: "/pos",
    redirect: "/pos/store",
    // component: PosLayout,
    component: () =>
      import(/* webpackChunkName: "pos" */ "@/layouts/PosLayout.vue"),
    children: [
      {
        path: "/pos/store",
        // component: Store,
        component: () =>
          import(/* webpackChunkName: "pos" */ "@/views/pos/Store.vue"),
      },
    ],
  },

  {
    path: "/store",
    name: "store",
    redirect: "/store/shop",
    // component: StoreFront,
    component: () =>
      import(/* webpackChunkName: "store" */ "@/layouts/StoreFront.vue"),
    children: [
      {
        path: "/store/shop",
        name: "StoreProducts",
        component: () =>
          import(
            /* webpackChunkName: "store" */ "@/views/store/StoreProducts.vue"
          ),
      },
    ],
  },
  {
    path: "/playground",
    name: "playground",
    component: () =>
      import(/* webpackChunkName: "playground" */ "@/layouts/Playground.vue"),
  },
  // {
  //   path: "/home",
  //   redirect: "/home/dashboard",
  //   component: HomeLayout,
  //   children: [
  //     {
  //       path: "/home/dashboard",
  //       component: HomeDashboard,
  //     },
  //     {
  //       path: "/home/custom",
  //       component: CustomFactoryPage,
  //     },
  //   ],
  // },
  // {
  //   path: "/aronium",
  //   name: "aronium",
  //   component: ManagementLayout,
  // },
  { path: "/:pathMatch(.*)*", redirect: "/" },
];
export default routes;
