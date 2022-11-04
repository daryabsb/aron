// import { routerKey } from "vue-router";

const routes = [
  {
    path: "/pos",
    redirect: "/pos/store",
    // component: PosLayout,
    component: () =>
      import(/* webpackChunkName: "pos" */ "@/Pos/layouts/PosLayout.vue"),
    children: [
      {
        path: "/pos/store",
        // component: Store,
        component: () =>
          import(/* webpackChunkName: "pos" */ "@/Pos/views/Store.vue"),
      },
    ],
  },
];
export default routes;
