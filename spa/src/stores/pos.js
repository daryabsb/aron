import { computed, ref } from "vue";
import { defineStore } from "pinia";
import moment from "moment";
import {
  generateUID,
  beep,
  updateChange,
  useOrderItemIndex,
  clearSound,
} from "@/store/composables";

export const usePos = defineStore("pos", {
  state: () => {
    return {
      cart: [],
      activeNumber: ref(""),
      cash: 0,
      change: 0,
      moneys: [250, 500, 1000, 5000, 10000, 25000, 50000, 100000],

      receiptNo: null,
      receiptDate: null,

      isShowModalReceipt: false,
    };
  },
  actions: {
    createCart() {
      const number = this.generateUID();
      const order = {
        number: number,
        discount: 0,
        discountType: 0,
        items: [],
        tax: 0,
        total: 0,
      };
      // order.number = uuid.v4();
      this.cart.push(order);
      console.log(this.cart);
      this.activeNumber = number;
    },
    generateUID: () => {
      let firstPart = new Date();
      let secondPart = (Math.random() * (49999 - 101) + 101) | 0;
      firstPart = `${firstPart.getDate()}${firstPart.getMonth()}${firstPart.getFullYear()}`;
      secondPart = secondPart.toString();
      return firstPart + secondPart;
    },

    addToCart(product, quantity = 1, price = 0, tax = 0) {
      const orderItem = {
        id: product.id,
        product,
        quantity,
        tax,
        price,
      };
      const index = useOrderItemIndex(orderItem);

      if (index === -1) {
        this.useActiveOrder.value.items.push(orderItem);
      } else {
        this.addQty(orderItem, (orderItem.quantity = 1), index);
        // this.useActiveOrder.value.items[index].quantity += orderItem.quantity;
      }

      beep();
      updateChange();
    },
    addQty(orderItem, quantity, index) {
      if (!index) index = useOrderItemIndex(orderItem);
      const item = this.useActiveOrder.value.items[index];
      const afterAdd = item.quantity + quantity;
      if (afterAdd === 0) {
        this.useActiveOrder.value.items.splice(index, 1);
        clearSound();
      } else {
        item.quantity = afterAdd;
        beep();
      }
      updateChange();
    },
    getItemSubTotal(item) {
      item.price * item.quantity;
    },
    // addCash: (state, amount) => (state.cash += amount || 0),
    addCash(amount) {
      this.cash += amount || 0;
      // console.log("cash after-mutations", state.cash);

      this.updateChange();
      this.beep();
      console.log(this.cash, amount);
    },
    updateCash(value) {
      this.cash = parseFloat(value.replace(/[^0-9]+/g, ""));
      this.updateChange();
    },
    updateChange() {
      this.change = this.cash - this.totalPrice.value;
    },
    getItemTotalPrice(item) {
      return computed(() => item.price * item.quantity);
    },
    numberFormat: (number) => {
      return (number || "")
        .toString()
        .replace(/^0|\./g, "")
        .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
    },
    priceFormat(number) {
      return computed(() =>
        number ? ` ${this.numberFormat(number)} IQD` : ` 0 IQD`
      );
    },

    clear: (state) => {
      state.cash = 0;
      state.cart = [];
      state.receiptNo = null;
      state.receiptDate = null;
      updateChange();
      clearSound();
    },
    submit: (state) => {
      const time = new Date();
      state.isShowModalReceipt = true;
      state.receiptNo = `ARONPOS-KS-${Math.round(time.getTime() / 1000)}`;
      state.receiptDate = moment(time);
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
  },
  getters: {
    activeOrderNumber: (state) => state.activeNumber,
    useMoneys: (state) => state.moneys,
    useActiveOrder: (state) => {
      return computed(() =>
        state.cart.find((item) => item.number === state.activeNumber)
      );
    },

    isActiveNumber(state) {
      return computed(() => state.activeNumber !== "");
    },
    isActiveOrderItems() {
      if (!this.isActiveNumber.value) return false;

      return computed(() => this.useActiveOrder.value.items.length !== 0);
    },
    subTotalBeforeTax() {
      // console.log("!this.isActiveNumber.value", !this.isActiveNumber.value);
      if (!this.isActiveNumber.value) return 0;
      // console.log("!this.isActiveOrderItems", !this.isActiveOrderItems);
      if (!this.isActiveOrderItems) return 0;
      const totalBeforeTax = this.useActiveOrder.value.items.reduce(
        (total, item) => total + item.price * item.quantity,
        0
      );
      return computed(() => totalBeforeTax);
    },
    totalPrice() {
      if (!this.isActiveNumber.value) return 0;
      if (!this.isActiveOrderItems) return 0;
      console.log("from totalPriceBeforeTax", this.subTotalBeforeTax.value);

      const total =
        this.subTotalBeforeTax.value + this.useActiveOrder.value.tax;
      this.useActiveOrder.value.total = total;
      return computed(() => total);
    },
    submitable: () => {
      return computed(() => this.change >= 0 && this.cart.length > 0);
    },
  },
});
