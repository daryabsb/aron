// import { computed } from "vue";
import { useStore } from "vuex";

import { FETCH_USER } from "@/store/constants";

/* ACTIONS */
export const useFetchUserDispatch = () => {
  const store = useStore();
  store.dispatch(FETCH_USER);
};

export const products = [
  {
    id: 1,
    name: "Eggplant",
    code: "622179",
    description: "Build fun stuff in the cloud. It's a lot of fun, we promise!",
    plu: 2,
    measurement_unit: "Kg",
    price: 500.0,
    is_tax_inclusive_price: false,
    is_price_change_allowed: false,
    is_service: false,
    is_using_default_quantity: false,
    cost: 450.0,
    margin: "0.000",
    image:
      "http://127.0.0.1:8000/media/uploads/product/3e19d676-cc04-44b4-8c5b-4de1bcd2f118.jpg",
    color: "Transparent",
    is_enabled: true,
    age_restriction: null,
    last_purchase_price: 0.0,
    rank: 0,
    created: "2022-09-13T19:48:25.049029Z",
    updated: "2022-09-13T19:48:25.049029Z",
    user: 1,
    product_group: 2,
    currency: 1,
  },
  {
    id: 2,
    name: "Cucumber",
    code: "635788gy9l",
    description:
      "Author act increase worry yeah. Positive medical shake include serious check state.",
    plu: 1,
    measurement_unit: "Kg",
    price: 1250.0,
    is_tax_inclusive_price: false,
    is_price_change_allowed: false,
    is_service: false,
    is_using_default_quantity: true,
    cost: 0.0,
    margin: "0.000",
    image:
      "http://127.0.0.1:8000/media/uploads/product/b7d96ae0-fede-46f9-ac1c-0d7f931a657c.jpg",
    color: "Transparent",
    is_enabled: true,
    age_restriction: null,
    last_purchase_price: 0.0,
    rank: 0,
    created: "2022-09-13T20:05:49.517724Z",
    updated: "2022-09-13T20:05:49.517724Z",
    user: 1,
    product_group: 2,
    currency: 1,
  },
];
