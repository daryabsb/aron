import { defineStore } from "pinia";
import { useOrderStore } from "@/Orders/ordersStore";
import { totalPrice } from "@/Orders/ordersStore/useActiveOrderStore";
const { cart } = useOrderStore();

export default defineStore("orders", {
  state: () => {
    return {
      cash: 0,
      change: 0,
      moneys: [250, 500, 1000, 5000, 10000, 25000, 50000, 100000],

      receiptNo: null,
      receiptDate: null,

      isShowModalReceipt: false,
    };
  },
  actions: {
    addCash(amount) {
      this.cash += amount || 0;

      this.updateChange();
      this.beep();
    },
    clearCash() {
      this.cash = 0;
      this.change = 0;
      this.clearSound();
    },
    updateCash(value) {
      this.cash = parseFloat(value.replace(/[^0-9]+/g, ""));
      this.updateChange();
    },
    updateChange() {
      this.change = this.cash - totalPrice;
    },
    clear() {
      this.cash = 0;
      this.cart = [];
      this.receiptNo = null;
      this.receiptDate = null;
      this.updateChange();
      this.clearSound();
    },
    playSound(src) {
      if (src) {
        const sound = new Audio(src);
        sound.play();
      }
    },
    beep() {
      this.playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
    },
    clearSound() {
      this.playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
    },
    submit: (state) => {
      const time = new Date();
      state.isShowModalReceipt = true;
      state.receiptNo = `ARONPOS-KS-${Math.round(time.getTime() / 1000)}`;
      state.receiptDate = moment(time);
    },
  },
  getters: {
    useMoneys(state) {
      return state.moneys;
    },
    submitable(state) {
      return state.change >= 0 && cart.length > 0;
    },
    useCash(state) {
      return state.cash;
    },
    useChange(state) {
      return state.change;
    },
  },
});
