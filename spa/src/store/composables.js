/* eslint-disable no-delete-var */
// import { computed } from "vue";
import { useStore } from "vuex";

import {
  FETCH_USER,
  FETCH_PRODUCTS,
  ADD_TO_CART,
  FIND_CART_INDEX,
} from "@/store/constants";
// import store from ".";
const store = useStore();
/* ACTIONS */
export const useFetchUserDispatch = () => {
  const store = useStore();
  store.dispatch(FETCH_USER);
};

export const useFetchProductsDispatch = () => {
  const store = useStore();
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
    .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
};
export const priceFormat = (number) => {
  return number ? `Rp. ${numberFormat(number)}` : `Rp. 0`;
};
export const addCash = (amount) => store.commit.ADD_CASH(amount);
export const addToCart = (product) => {
  const store = useStore();
  store.dispatch.ADD_TO_CART(product);
};
export const clear = () => store.commit.CLEAR;
export const addQty = (quantity) => store.commit.ADD_QUANTITY(quantity);
export const updateChange = () => store.commit.UPDATE_CHANGE;
export const updateCash = (value) => store.commit.UPDATE_CASH(value);
export const findCartIndex = (product) => {
  const store = useStore();
  store.commit(FIND_CART_INDEX, product);
};
export const submitable = () => {
  const store = useStore();
  return store.getters.SUBMITABLE;
};

export const clearSound = () => {
  playSound("@/assets/sound/sound/button-21.mp3");
};
export const playSound = (src) => {
  const sound = new Audio();
  sound.src = src;
  sound.play();
  // sound.onended = () => delete sound;
};

export const getTotalPrice = () => store.commit.GET_TOTAL_PRICE;
export const beep = () => playSound("sound/beep-29.mp3");
