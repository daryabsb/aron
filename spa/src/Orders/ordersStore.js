import { defineStore } from "pinia";
import { moment } from "moment";
import ordersAPI from "@/services/ordersAPI";
import Order from "@/Orders/orderTemplates/Order";

export const useOrderStore = defineStore("orders", {
  state: () => {
    return {
      cart: [],
      activeNumber: "",
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
      const order = new Order();
      this.cart = [order, ...this.cart];
      // this.activeNumber = order.number;
      return order;
    },
    async createCartFromAPI() {
      let newOrders = [];
      try {
        const ordersResponse = await ordersAPI.getOrders();
        newOrders = ordersResponse.data.map(
          (order) => (order = new Order(order))
        );
        this.cart = [...newOrders, ...this.cart];
        // store.activeNumber = store.cart[0].number;
      } catch (error) {
        console.log(error);
      }

      return newOrders;
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
      return this.useActiveOrder.items.findIndex(
        (item) => item.id === product.id
      );
    },

    addToCart(orderItem) {
      const index = this.useOrderItemIndex(orderItem.value);

      if (index === -1) {
        this.useActiveOrder.items.push(orderItem.value);
      } else {
        this.addQty(orderItem.value, (orderItem.value.quantity = 1), index);
      }

      this.beep();
      this.updateChange();
    },
    addQty(orderItem, quantity, index) {
      if (!index) index = this.useOrderItemIndex(orderItem);
      const item = this.useActiveOrder.items[index];
      const afterAdd = item.quantity + quantity;
      if (afterAdd === 0) {
        this.useActiveOrder.items.splice(index, 1);
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
      return item.price * item.quantity;
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
      if (this.useActiveOrder.discountType === 0) {
        return (this.useActiveOrder.discount * total) / 100;
      } else {
        return this.useActiveOrder.discount;
      }
    },
  },
  getters: {
    activeOrderNumber: (state) => state.activeNumber,
    useMoneys(state) {
      return state.moneys;
    },
    useActiveOrder: (state) => {
      return state.cart.find((item) => item.number === state.activeNumber);
    },

    isActiveNumber(state) {
      return state.activeNumber !== "";
    },
    isActiveOrderItems() {
      if (!this.isActiveNumber) return false;

      return this.useActiveOrder.items.length !== 0;
    },

    subTotalBeforeTax() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;
      return this.useActiveOrder.items.reduce(
        (total, item) => total + item.itemTotalPrice,
        0
      );
    },
    subTotalBeforeDiscount() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;
      return this.useActiveOrder.items.reduce(
        (total, item) => total + item.totalWithDsicount,
        0
      );
    },
    totalPrice() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;

      const total = this.useActiveOrder.items.reduce(
        (total, item) => total + item.totalWithDsicount,
        0
      );

      this.useActiveOrder.total =
        total - this.calculateActiveOrderDiscount(total);
      return this.useActiveOrder.total;
    },
    submitable(state) {
      return state.change >= 0 && state.cart.length > 0;
    },
    useCash(state) {
      return state.cash;
    },
    useChange(state) {
      return state.change;
    },
  },
});
