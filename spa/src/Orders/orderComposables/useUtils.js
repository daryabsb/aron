import { ref, computed } from "vue";
import { MONEYS } from "./constants";
import { moment } from "moment";
import { useOrder } from "@/Orders/orderComposables/orderProperties";

import { useOrderStore } from "../ordersStore";

export const useUtils = () => {
  const cash = ref(0);
  const change = ref(0);
  const receiptNo = ref(null);
  const receiptDate = ref(null);

  const store = useOrderStore();

  const submitable = () => change.value >= 0 && store.cart.length > 0;
  const useMoneys = () => MONEYS;

  const useCash = () => cash;
  const useChange = () => change;

  const updateChange = () => {
    change.value = cash.value - store.useActiveOrder.totalPrice;
  };
  const addCash = (amount) => {
    cash.value += amount || 0;

    updateChange();
    beep();
  };
  const clearCash = () => {
    cash.value = 0;
    change.value = 0;
    clearSound();
  };
  const updateCash = (value) => {
    cash.value = parseFloat(value.replace(/[^0-9]+/g, ""));
    updateChange();
  };
  const clear = () => {
    cash.value = 0;
    store.cart = [];
    receiptNo.value = null;
    receiptDate.value = null;
    updateChange();
    clearSound();
  };
  const playSound = (src) => {
    if (src) {
      const sound = new Audio(src);
      sound.play();
    }
  };
  const beep = () => {
    playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
  };
  const clearSound = () => {
    playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
  };
  const submit = () => {
    const time = new Date();
    store.isShowModalReceipt = true;
    receiptNo.value = `ARONPOS-KS-${Math.round(time.getTime() / 1000)}`;
    receiptDate.value = moment(time);
  };
  const priceFormat = (price, currencyStr = "IQD", locale = "en-IQ") => {
    const number = 123456.789;

    return new Intl.NumberFormat(locale, {
      style: "currency",
      currency: currencyStr,
    }).format(price);
    // expected output: "123.456,79 €"

    // // the Japanese yen doesn't use a minor unit
    // console.log(new Intl.NumberFormat('ja-JP', { style: 'currency', currency: 'JPY' }).format(number));
    // // expected output: "￥123,457"

    // // limit to three significant digits
    // console.log(new Intl.NumberFormat('en-IN', { maximumSignificantDigits: 3 }).format(number));
    // // expected output: "1,23,000"
  };

  return {
    cash,
    change,
    receiptNo,
    receiptDate,
    submitable,
    useCash,
    useChange,
    useMoneys,
    addCash,
    clearCash,
    updateCash,
    updateChange,
    clear,
    clearSound,
    beep,
    submit,
    priceFormat,
  };
};
