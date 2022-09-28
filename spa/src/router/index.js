import { createRouter, createWebHistory } from "vue-router";

import AdminLayout from "@/layouts/AdminLayout.vue";
import HomeLayout from "@/layouts/HomeLayout.vue";
import PosLayout from "@/layouts/PosLayout.vue";
import ProductsAdminLayout from "@/layouts/ProductsAdminLayout.vue";
import ProductsManagementLayout from "@/layouts/ProductsManagementLayout.vue";
// import Auth from "@/layouts/Auth.vue";

// views for Admin layout
import Store from "@/views/pos/Store.vue";
import AdminDashboard from "@/views/admin/AdminDashboard.vue";
import Settings from "@/views/admin/Settings.vue";
import Products from "@/views/admin/Products.vue";
import Stocks from "@/views/admin/Stocks.vue";
// import Maps from "@/views/admin/Maps.vue";

// views for Products layout
import ProductsControlPanel from "@/views/products/ProductsControlPanel.vue";

// views for Auth layout

// import Login from "@/views/auth/Login.vue";
// import Register from "@/views/auth/Register.vue";

// views without layouts

import Index from "@/views/Index.vue";
import HomeDashboard from "@/views/home/HomeDashboard.vue";
import CustomFactoryPage from "@/views/home/CustomFactoryPage.vue";
// import Landing from "@/views/Landing.vue";
// import Profile from "@/views/Profile.vue";

const routes = [
  {
    path: "/management",
    redirect: "/management/dashboard",
    component: AdminLayout,
    children: [
      {
        path: "/management/dashboard",
        component: AdminDashboard,
      },
      {
        path: "/management/settings",
        component: Settings,
      },
      {
        path: "/management/products",
        component: Products,
      },
      {
        path: "/management/stocks",
        component: Stocks,
      },
    ],
  },
  {
    path: "/pos",
    redirect: "/pos/store",
    component: PosLayout,
    children: [
      {
        path: "/pos/store",
        component: Store,
      },
    ],
  },
  {
    path: "/products",
    redirect: "/products/control-panel",
    component: ProductsAdminLayout,
    children: [
      {
        path: "/products/control-panel",
        name: "manage-products",
        component: ProductsControlPanel,
      },
    ],
  },
  {
    path: "/",
    component: Index,
  },
  {
    path: "/home",
    redirect: "/home/dashboard",
    component: HomeLayout,
    children: [
      {
        path: "/home/dashboard",
        component: HomeDashboard,
      },
      {
        path: "/home/custom",
        component: CustomFactoryPage,
      },
    ],
  },
  {
    path: "/aronium",
    name: "aronium",
    component: ProductsManagementLayout,
  },
  { path: "/:pathMatch(.*)*", redirect: "/" },
];

const router = createRouter({
  history: createWebHistory("/"),
  routes,
});

export default router;
