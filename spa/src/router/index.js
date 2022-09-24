import { createRouter, createWebHistory } from "vue-router";

import AdminLayout from "@/layouts/AdminLayout.vue";
import PosLayout from "@/layouts/PosLayout.vue";
// import Auth from "@/layouts/Auth.vue";

// views for Admin layout
import Store from "@/views/pos/Store.vue";
import AdminDashboard from "@/views/admin/AdminDashboard.vue";
// import Settings from "@/views/admin/Settings.vue";
// import Tables from "@/views/admin/Tables.vue";
// import Maps from "@/views/admin/Maps.vue";

// views for Auth layout

// import Login from "@/views/auth/Login.vue";
// import Register from "@/views/auth/Register.vue";

// views without layouts

import Index from "@/views/Index.vue";
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
    path: "/",
    component: Index,
  },
  { path: "/:pathMatch(.*)*", redirect: "/" },
];

const router = createRouter({
  history: createWebHistory("/"),
  routes,
});

export default router;
