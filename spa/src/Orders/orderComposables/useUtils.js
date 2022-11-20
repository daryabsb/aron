import { ref } from "vue";
import { MONEYS } from "./constants";
import { moment } from "moment";

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
  const updateChange = () => {
    change.value = cash.value - store.totalPrice;
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
    beep,
    submit,
  };
};
