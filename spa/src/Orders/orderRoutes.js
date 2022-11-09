const routes = [
  {
    path: "/store",
    name: "store",
    redirect: "/store/order",
    // component: StoreFront,
    component: () =>
      import(
        /* webpackChunkName: "store" */ "@/Orders/layouts/StoreLayout.vue"
      ),
    children: [
      {
        path: "/store/order",
        name: "StoreProducts",
        component: () =>
          import(
            /* webpackChunkName: "store" */ "@/Orders/views/StoreProducts.vue"
          ),
        children: [
          {
            path: "/store/order/:number",
            name: "StoreOrder",
            component: () =>
              import(
                /* webpackChunkName: "store" */ "@/Orders/views/StoreOrder.vue"
              ),
            // props: (route) => ({ number: parseInt(route.params.number) }),
            props: true,
          },
        ],
      },
    ],
  },
];
export default routes;
