/* eslint-disable no-delete-var */
import { computed } from "vue";
// import { store } from "vuex";

import {
  FETCH_USER,
  FETCH_PRODUCTS,
  GET_CART_INDEX,
  ADD_CASH,
  CLEAR,
  ADD_QUANTITY,
  UPDATE_CHANGE,
  UPDATE_CASH,
} from "@/store/constants";
import store from "@/store";

/* ACTIONS */
export const useFetchUserDispatch = () => {
  // const store = useStore();
  store.dispatch(FETCH_USER);
};

export const useFetchProductsDispatch = () => {
  // const store = useStore();
  store.dispatch(FETCH_PRODUCTS);
};

// POS Composable
export const dateFormat = (date) => {
  const formatter = new Intl.DateTimeFormat("id", {
    dateStyle: "short",
    timeStyle: "short",
  });
  return formatter.format(date);
};
export const numberFormat = (number) => {
  return (number || "")
    .toString()
    .replace(/^0|\./g, "")
    .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
};
export const priceFormat = (number) => {
  return computed(() => (number ? ` ${numberFormat(number)} IQD` : ` 0 IQD`));
};
export const addCash = (amount) => {
  // const store = useStore();
  console.log("amount-composables", amount);

  return store.commit(ADD_CASH, amount);
};
export const useCash = computed(() => store.getters.GET_CASH);
export const useChange = computed(() => store.getters.GET_CHANGE);
export const useCart = computed(() => store.getters.GET_CART);
export const findCartIndex = (product) => {
  // const store = useStore();
  return store.getters.GET_CART_INDEX(product);
};
export const addToCart = (product) => {
  // const store = useStore();
  store.dispatch.ADD_TO_CART(product);
};
export const getTotalPrice = () => {
  // const store = useStore();
  return computed(() => store.getters.GET_TOTAL_PRICE);
};
export const getItemsCount = () => {
  return computed(() => store.getters.GET_ITEMS_COUNT);
};
export const clear = () => {
  // const store = useStore();
  return store.commit(CLEAR);
};
export const addQty = (item, quantity) => {
  // const store = useStore();
  const payload = {};
  const index = useCart.value.findIndex((i) => i.productId === item.productId);

  if (index === -1) {
    return;
  }
  payload.index = index;
  payload.quantity = quantity;

  console.log(payload);

  store.commit(ADD_QUANTITY, payload);
  updateChange();

  // console.log("useCart.value[index]", useCart.value[index]);

  // const afterAdd = item.qty + quantity;
  // if (useCart.value[index] === 0) {
  //   ("==================================");
  //   useCart.value.splice(index, 1);
  //   clearSound();
  // } else {
  //   useCart.value[index].qty = afterAdd;
  //   beep();
  // }
  // updateChange();
};
export const updateChange = () => {
  // const store = useStore();
  return store.commit(UPDATE_CHANGE);
};
export const updateCash = (value) => store.commit.UPDATE_CASH(value);

export const submitable = () => {
  // const store = useStore();
  return store.getters.SUBMITABLE;
};

export const clearSound = () => {
  playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
};
export const playSound = (src) => {
  if (src) {
    const sound = new Audio(src);
    console.log(sound);
    sound.play();
  }
  // sound.src = src;
  // sound.onended = () => delete sound;
};

export const beep = () =>
  playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
