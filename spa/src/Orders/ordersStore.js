import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { moment } from "moment";

export const useOrderStore = defineStore("orders", {
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
      this.cart.push(order);
      this.changeActiveOrderNumber(number);
    },
    changeActiveOrderNumber(number) {
      this.activeNumber = number;
    },
    generateUID: () => {
      let firstPart = new Date();
      let secondPart = (Math.random() * (49999 - 101) + 101) | 0;
      firstPart = `${firstPart.getDate()}${firstPart.getMonth()}${firstPart.getFullYear()}`;
      secondPart = secondPart.toString();
      return firstPart + secondPart;
    },
    useOrderItemIndex(product) {
      return this.useActiveOrder.value.items.findIndex(
        (item) => item.id === product.id
      );
    },

    addToCart(orderItem) {
      const index = this.useOrderItemIndex(orderItem.value);

      if (index === -1) {
        this.useActiveOrder.value.items.push(orderItem.value);
      } else {
        this.addQty(orderItem.value, (orderItem.value.quantity = 1), index);
      }

      this.beep();
      this.updateChange();
    },
    addQty(orderItem, quantity, index) {
      if (!index) index = this.useOrderItemIndex(orderItem);
      const item = this.useActiveOrder.value.items[index];
      const afterAdd = item.quantity + quantity;
      if (afterAdd === 0) {
        this.useActiveOrder.value.items.splice(index, 1);
        this.clearSound();
      } else {
        item.quantity = afterAdd;
        this.beep();
      }
      this.updateChange();
    },
    getItemSubTotal(item) {
      item.price * item.quantity;
    },
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
      this.change = this.cash - this.totalPrice;
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

    clear() {
      this.cash = 0;
      this.cart = [];
      this.receiptNo = null;
      this.receiptDate = null;
      this.updateChange();
      this.clearSound();
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
    clearSound() {
      this.playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
    },
    calculateActiveOrderDiscount(total) {
      if (this.useActiveOrder.value.discountType === 0) {
        return (this.useActiveOrder.value.discount * total) / 100;
      } else {
        return this.useActiveOrder.value.discount;
      }
    },
  },
  getters: {
    activeOrderNumber: (state) => state.activeNumber,
    useMoneys(state) {
      return computed(() => state.moneys);
    },
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
      if (!this.isActiveNumber.value) return 0;
      if (!this.isActiveOrderItems) return 0;
      return this.useActiveOrder.value.items.reduce(
        (total, item) => total + item.itemTotalPrice,
        0
      );
    },
    subTotalBeforeDiscount() {
      if (!this.isActiveNumber.value) return 0;
      if (!this.isActiveOrderItems) return 0;
      return this.useActiveOrder.value.items.reduce(
        (total, item) => total + item.totalWithDsicount,
        0
      );
    },
    totalPrice() {
      if (!this.isActiveNumber.value) return 0;
      if (!this.isActiveOrderItems) return 0;

      const total = this.useActiveOrder.value.items.reduce(
        (total, item) => total + item.totalWithDsicount,
        0
      );

      this.useActiveOrder.value.total =
        total - this.calculateActiveOrderDiscount(total);
      return computed(() => this.useActiveOrder.value.total);
    },
    submitable(state) {
      return state.change >= 0 && state.cart.length > 0;
    },
    useCash(state) {
      return computed(() => state.cash);
    },
    useChange(state) {
      return computed(() => state.change);
    },
  },
});
