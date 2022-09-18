import { createRouter, createWebHistory } from "vue-router";

// import Admin from "@/layouts/Admin.vue";
// import Auth from "@/layouts/Auth.vue";

// views for Admin layout
import Dashboard from "@/views/pos/Dashboard.vue";
// import Settings from "@/views/admin/Settings.vue";
// import Tables from "@/views/admin/Tables.vue";
// import Maps from "@/views/admin/Maps.vue";

// views for Auth layout

// import Login from "@/views/auth/Login.vue";
// import Register from "@/views/auth/Register.vue";

// views without layouts

// import Landing from "@/views/Landing.vue";
// import Profile from "@/views/Profile.vue";
import HomeLayout from "@/layouts/HomeLayout.vue";
import PosLayout from "@/layouts/PosLayout.vue";

const routes = [
  {
    path: "/",
    redirect: "/home/dashboard",
    component: HomeLayout,
    children: [
      {
        path: "/home/dashboard",
        component: Dashboard,
      },
      //     {
      //       path: "/dash/settings",
      //       component: Settings,
      //     },
      //     {
      //       path: "/dash/tables",
      //       component: Tables,
      //     },
      //     {
      //       path: "/dash/maps",
      //       component: Maps,
      //     },
    ],
  },
  // {
  //   path: "/auth",
  //   redirect: "/auth/login",
  //   component: Auth,
  //   children: [
  //     {
  //       path: "/auth/login",
  //       component: Login,
  //     },
  //     {
  //       path: "/auth/register",
  //       component: Register,
  //     },
  //   ],
  // },
  // {
  //   path: "/landing",
  //   component: Landing,
  // },
  // {
  //   path: "/profile",
  //   component: Profile,
  // },
  {
    path: "/pos",
    component: PosLayout,
  },
  {
    path: "/pos",
    redirect: "/pos/dashboard",
    component: PosLayout,
    children: [
      {
        path: "/home/dashboard",
        component: Dashboard,
      },
    ],
  },
  { path: "/:pathMatch(.*)*", redirect: "/" },
];

const router = createRouter({
  history: createWebHistory("/"),
  routes,
});

export default router;
