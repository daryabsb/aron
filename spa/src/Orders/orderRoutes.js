// import { useCart } from "@/Orders/orderComposables";
const routes = [
  {
    path: "/store",
    name: "store",
    // redirect: "/store/order",
    // component: StoreFront,
    component: () =>
      import(
        /* webpackChunkName: "store" */
        "@/Orders/layouts/StoreLayout.vue"
      ),
    children: [],
  },
  {
    path: "/store/order",
    name: "StoreProducts",
    redirect: { name: "StoreOrderExist" },
    component: () =>
      import(
        /* webpackChunkName: "store" */
        "@/Orders/views/StoreOrder.vue"
      ),
    children: [
      {
        path: "/store/order/:number",
        name: "StoreOrderExist",
        component: () =>
          import(
            /* webpackChunkName: "store" */
            "@/Orders/views/StoreOrderDetailExist.vue"
          ),

        beforeEnter: (to, from, next) => {
          // console.log(to.params);
          next();
        },
        // props: (route) => ({ number: parseInt(route.params.number) }),
        props: true,
      },
    ],
  },
];

export default routes;
