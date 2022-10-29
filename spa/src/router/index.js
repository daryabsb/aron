import { createRouter, createWebHistory } from "vue-router";

// import HomeLayout from "@/layouts/HomeLayout.vue";
// import PosLayout from "@/layouts/PosLayout.vue";
// import Playground from "@/layouts/Playground.vue";
// import ProductsAdminLayout from "@/components/temporary/ProductsAdminLayout.vue";
// import ManagementLayout from "@/layouts/ManagementLayout.vue";
// import Auth from "@/layouts/Auth.vue";
// import StoreFront from "@/layouts/StoreFront.vue";

// views for Admin layout
// import Store from "@/views/pos/Store.vue";
// import Dashboard from "@/views/management/Dashboard.vue";
// import Documents from "@/views/management/Documents.vue";
// import Products from "@/views/management/Products.vue";
// import Stocks from "@/views/management/Stocks.vue";
// import Maps from "@/views/admin/Maps.vue";

// views for Products layout
// import ProductsControlPanel from "@/views/products/ProductsControlPanel.vue";

// views for StoreFront layout
// import StoreProducts from "@/views/store/StoreProducts.vue";

// import Login from "@/views/auth/Login.vue";
// import Register from "@/views/auth/Register.vue";

// views without layouts

import Index from "@/views/Index.vue";
// import HomeDashboard from "@/views/home/HomeDashboard.vue";
// import CustomFactoryPage from "@/views/home/CustomFactoryPage.vue";
// import Landing from "@/views/Landing.vue";
// import Profile from "@/views/Profile.vue";

const routes = [
  {
    path: "/management",
    redirect: "/management/dashboard",
    // component: ManagementLayout,
    component: () =>
      import(
        /* webpackChunkName: "management" */ "@/layouts/ManagementLayout.vue"
      ),
    children: [
      {
        path: "/management/dashboard",
        // component: Dashboard,
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/views/management/Dashboard.vue"
          ),
      },
      {
        path: "/management/documents",
        // component: Documents,
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/views/management/Documents.vue"
          ),
      },
      {
        path: "/management/products",
        // component: Products,
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/views/management/Products.vue"
          ),
      },
      {
        path: "/management/stocks",
        // component: Stocks,
        component: () =>
          import(
            /* webpackChunkName: "management" */ "@/views/management/Stocks.vue"
          ),
      },
    ],
  },
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
  // {
  //   path: "/products",
  //   redirect: "/products/control-panel",
  //   component: ProductsAdminLayout,
  //   children: [
  //     {
  //       path: "/products/control-panel",
  //       name: "manage-products",
  //       component: ProductsControlPanel,
  //     },
  //   ],
  // },
  {
    path: "/",
    component: Index,
    // component: () =>
    //   import(/* webpackChunkName: "index" */ "@/views/Index.vue"),
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
        // component: StoreProducts,
        component: () =>
          import(
            /* webpackChunkName: "store" */ "@/views/store/StoreProducts.vue"
          ),
      },
    ],
  },
  {
    path: "/playground",
    // component: Playground,
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

const router = createRouter({
  history: createWebHistory("/"),
  routes,
});

export default router;
