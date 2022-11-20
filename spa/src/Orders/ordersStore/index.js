import { computed } from "vue";
import { defineStore } from "pinia";
import ordersAPI from "@/services/ordersAPI";
import { moment } from "moment";
import { useUtils } from "@/Orders/orderComposables/useUtils";
import Order from "@/Orders/orderTemplates/Order";
import OrderItem from "@/Orders/orderTemplates/OrderItem";
import { useOrder } from "@/Orders/orderComposables/orderProperties";

Array.prototype.unique = function () {
  var a = this.concat();
  for (var i = 0; i < a.length; ++i) {
    for (var j = i + 1; j < a.length; ++j) {
      if (a[i].number === a[j].number) a.splice(j--, 1);
    }
  }

  return a;
};

export const useOrderStore = defineStore("orders", {
  state: () => {
    return {
      cart: [],
      activeNumber: "",
      utils: useUtils(),
      // cash: 0,
      // change: 0,
      // moneys: [250, 500, 1000, 5000, 10000, 25000, 50000, 100000],

      // receiptNo: null,
      // receiptDate: null,

      isShowModalReceipt: false,
    };
  },

  getters: {
    useActiveOrder(state) {
      const order = state.cart.find(
        (item) => item.number === state.activeNumber
      );
      return computed(() => useOrder(order));
    },
    activeOrderNumber: (state) => state.activeNumber,

    isActiveNumber(state) {
      return state.activeNumber != "";
    },
    isActiveOrderItems() {
      if (!this.isActiveNumber) return false;
      if (!this.useActiveOrder) return false;

      return this.useActiveOrder.value.items.length !== 0;
    },

    totalTax() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;
      const taxes = this.useActiveOrder.value.items.map(
        (item) => item.product.tax.total
      );
      const taxTotal = taxes.reduce((total, item) => (total += item), 0);
      console.log("totalTax()", taxTotal);
      return taxTotal;
    },

    // subTotalBeforeTax() {
    //   if (!this.isActiveNumber) return 0;
    //   if (!this.isActiveOrderItems) return 0;

    //   return this.useActiveOrder.value.items.reduce(
    //     (total, item) => total + this.getItemTotalPrice(item),
    //     0
    //   );
    // },
    // subTotalWithTax() {
    //   if (!this.isActiveNumber) return 0;
    //   if (!this.isActiveOrderItems) return 0;

    //   return this.subTotalBeforeTax + this.vatRate(this.subTotalBeforeTax);
    // },
    // subTotalBeforeDiscount() {
    //   if (!this.isActiveNumber) return 0;
    //   if (!this.isActiveOrderItems) return 0;
    //   return this.useActiveOrder.value.items.reduce(
    //     (total, item) => total + this.getItemTotalPrice(item),
    //     0
    //   );
    // },
    totalPrice() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;

      const total = this.useActiveOrder.value.items.reduce(
        (total, item) => total + this.getItemTotalPrice(item),
        0
      );

      this.useActiveOrder.total =
        total - this.calculateActiveOrderDiscount(total);
      return this.useActiveOrder.total;
    },
    // useMoneys(state) {
    //   return state.moneys;
    // },
    // submitable(state) {
    //   return state.change >= 0 && state.cart.length > 0;
    // },
    // useCash(state) {
    //   return state.cash;
    // },
    // useChange(state) {
    //   return state.change;
    // },
  },
  actions: {
    async generateNumber(target) {
      try {
        const response = await ordersAPI.getNumber(target);

        return response.data;
      } catch (error) {
        console.log(error);
      }
    },
    async createCart(number) {
      const order = new Order({ number: number });
      console.log("from create cart: ", order);
      this.cart = [order, ...this.cart].unique();
      localStorage.setItem("cart", JSON.stringify(this.cart));
      // this.activeNumber = order.number;
      return order;
    },
    async createCartFromAPI() {
      const storageCart = JSON.parse(localStorage.getItem("cart"));
      let newOrders = [];
      try {
        const ordersResponse = await ordersAPI.getOrders();
        newOrders = ordersResponse.data.map(
          (order) => (order = new Order(order))
        );

        // All Items shoulld be converted to local  items
        newOrders.forEach((order) => {
          if (order.items.length > 0) {
            order.items.map((item) => {
              // NEED TO BE CHECKED
              new OrderItem(item);
            });
          }
        });

        if (storageCart && storageCart.length > 0) {
          this.cart = [...newOrders, ...storageCart].unique();
        } else this.cart = [...newOrders];
        localStorage.setItem("cart", JSON.stringify(this.cart));

        // store.activeNumber = store.cart[0].number;
      } catch (error) {
        console.log(error);
      }

      // return newOrders;
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
    useOrderItemIndex(orderItem) {
      return this.useActiveOrder.value.items.findIndex(
        (item) => item.product.id === orderItem.product.id
      );
    },

    addToCart(orderItem) {
      const index = this.useOrderItemIndex(orderItem.value);
      if (index === -1) {
        this.useActiveOrder.value.items.push(orderItem.value);
      } else {
        this.addQty(orderItem.value, (orderItem.value.quantity = 1), index);
      }

      this.updateLocalStorage();
      this.utils.beep();
      this.utils.updateChange();
    },
    addQty(orderItem, quantity, index) {
      if (!index) index = this.useOrderItemIndex(orderItem);
      const item = this.useActiveOrder.value.items[index];
      const afterAdd = item.quantity + quantity;
      if (afterAdd === 0) {
        this.useActiveOrder.value.items.splice(index, 1);
        this.utils.clearSound();
      } else {
        item.quantity = afterAdd;
        this.utils.beep();
      }
      this.updateLocalStorage();
      this.utils.updateChange();
    },
    updateLocalStorage() {
      const storageCart = JSON.parse(localStorage.getItem("cart"));
      const activeOrderIndex = storageCart.findIndex(
        (order) => order.number === this.useActiveOrder.value.number
      );

      storageCart[activeOrderIndex].items = this.useActiveOrder.value.items;
      localStorage.setItem("cart", JSON.stringify(storageCart));
    },
    getItemSubTotal(item) {
      item.price * item.quantity;
    },

    getItemTotalPrice(item) {
      return item.product.price * item.quantity;
    },

    calculateActiveOrderDiscount(total) {
      if (this.useActiveOrder.value.discountType === 0) {
        return (this.useActiveOrder.value.discount * total) / 100;
      } else {
        return this.useActiveOrder.value.discount;
      }
    },
    // addCash(amount) {
    //   this.cash += amount || 0;

    //   this.updateChange();
    //   this.beep();
    // },
    // clearCash() {
    //   this.cash = 0;
    //   this.change = 0;
    //   this.clearSound();
    // },
    // updateCash(value) {
    //   this.cash = parseFloat(value.replace(/[^0-9]+/g, ""));
    //   this.updateChange();
    // },
    // updateChange() {
    //   this.change = this.cash - this.totalPrice;
    // },
    // clear() {
    //   this.cash = 0;
    //   this.cart = [];
    //   this.receiptNo = null;
    //   this.receiptDate = null;
    //   this.updateChange();
    //   this.clearSound();
    // },
    // playSound(src) {
    //   if (src) {
    //     const sound = new Audio(src);
    //     sound.play();
    //   }
    // },
    // beep() {
    //   this.playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
    // },
    // clearSound() {
    //   this.playSound("http://127.0.0.1:8000/media/sound/beep-29.mp3");
    // },
    // submit: (state) => {
    //   const time = new Date();
    //   state.isShowModalReceipt = true;
    //   state.receiptNo = `ARONPOS-KS-${Math.round(time.getTime() / 1000)}`;
    //   state.receiptDate = moment(time);
    // },
  },
});
