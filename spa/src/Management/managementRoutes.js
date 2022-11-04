// import { routerKey } from "vue-router";

let routes = [
  {
    path: "/management",
    name: "management",
    redirect: "/management/dashboard",
    // component: ManagementLayout,
    component: () =>
      import(
        /* webpackChunkName: "management" */ "@/Management/layouts/ManagementLayout.vue"
      ),
    children: [
      {
        path: "/management/dashboard",
        name: "Dashboard",
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/Management/views/Dashboard.vue"
          ),
      },
      {
        path: "/management/documents",
        name: "Documents",
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/Management/views/Documents.vue"
          ),
      },
      {
        path: "/management/products",
        name: "Products",
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/Management/views/Products.vue"
          ),
      },
      {
        path: "/management/stocks",
        name: "Stocks",
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/Management/views/Stocks.vue"
          ),
      },
    ],
  },
];

export default routes;
