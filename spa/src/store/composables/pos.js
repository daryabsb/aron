import { computed } from "vue";

import {
  ADD_KEYWORD,
  SUBMIT_ORDER,
  ADD_CASH,
  CLEAR,
  ADD_QUANTITY,
  UPDATE_CHANGE,
  CLOSE_MODAL_RECEIPT,
  ADD_TO_CART,
  ADD_DISCOUNT,
  CREATE_CART,
  GET_CART_BY_NUMBER,
} from "@/store/constants";
import store from "@/store";

export const usePos = () => {
  const priceFormat = (number) => {
    return computed(() => (number ? ` ${numberFormat(number)} IQD` : ` 0 IQD`));
  };

  const clearSound = () => {
    playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
  };
  const playSound = (src) => {
    if (src) {
      const sound = new Audio(src);
      sound.play();
    }
  };

  const beep = () => playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");

  // POS Composable
  const keyword = computed(() => store.getters.GET_KEYWORD);
  const products = computed(() => store.getters.GET_PRODUCTS);
  const filteredProducts = computed(() => {
    const rg = keyword.value ? new RegExp(keyword.value, "gi") : null;
    return tabProducts.value.filter((p) => !rg || p.name.match(rg));
  });

  const addCash = (amount) => {
    return store.commit(ADD_CASH, amount);
  };
  const updateKeyword = (keyword) => store.dispatch(ADD_KEYWORD, keyword);
  const useCash = computed(() => store.getters.GET_CASH);
  const useChange = computed(() => store.getters.GET_CHANGE);
  const useCart = computed(() => store.getters.GET_CART_BY_NUMBER);
  const useMoneys = computed(() => store.getters.GET_MONEYS);
  const receiptNo = computed(() => store.getters.GET_RECEIPT_NUMBER);
  const receiptDate = computed(() => store.getters.GET_RECEIPT_DATE);
  const tabProducts = computed(() => {
    if (store.getters.GET_TAB_PRODUCTS.length > 0) {
      return store.getters.GET_TAB_PRODUCTS;
    }
    return store.getters.GET_PRODUCTS;
  });
  const isShowModalReceipt = computed(
    () => store.getters.GET_IS_SHOW_MODAL_RECEIPT
  );

  const addToCart = (product) => store.dispatch(ADD_TO_CART, product);
  const findCartIndex = (product) => {
    return store.getters.GET_CART_INDEX(product);
  };
  const addDiscount = (payload) => {
    store.commit(ADD_DISCOUNT, payload);
  };

  // const getCartIndex = (item) =>
  //   computed(() => store.getters.GET_CART_INDEX(item));
  const getTotalPrice = () => {
    return computed(() => store.getters.GET_TOTAL_PRICE);
  };
  const getItemTotalPrice = (item) => {
    let discount;
    if (item.discountType === "%") {
      discount = item.price * item.qty * (item.discount / 100);
    } else {
      discount = item.discount;
    }
    return computed(() => item.price * item.qty - discount);
  };
  const numberFormat = (number) => {
    return (number || "")
      .toString()
      .replace(/^0|\./g, "")
      .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
  };

  const getItemsCount = () => {
    return computed(() => store.getters.GET_ITEMS_COUNT);
  };
  const clear = () => {
    return store.commit(CLEAR);
  };
  const closeModalReceipt = () => {
    store.commit(CLOSE_MODAL_RECEIPT);
  };

  const addQty = (item, quantity) => {
    const payload = {};
    const index = useCart.value.findIndex(
      (i) => i.productId === item.productId
    );

    if (index === -1) {
      return;
    }
    payload.item = item;
    payload.quantity = quantity;

    store.commit(ADD_QUANTITY, payload);
    updateChange();
  };
  const updateChange = () => {
    return store.commit(UPDATE_CHANGE);
  };
  const updateCash = (value) => store.commit.UPDATE_CASH(value);

  const submitable = () => {
    return store.getters.SUBMITABLE;
  };
  const submit = () => store.dispatch(SUBMIT_ORDER);

  return {
    priceFormat,
    usePos,
    clearSound,
    beep,
    filteredProducts,
    addCash,
    updateKeyword,
    useCash,
    useChange,
    useMoneys,
    receiptNo,
    receiptDate,
    addToCart,
    findCartIndex,
    addDiscount,
    getTotalPrice,
    getItemTotalPrice,
    getItemsCount,
    clear,
    isShowModalReceipt,
    closeModalReceipt,
    addQty,
    updateCash,
    submitable,
    submit,
  };
};
