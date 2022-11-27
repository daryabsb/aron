import { computed } from "vue";
import { defineStore } from "pinia";
import ordersAPI from "@/services/ordersAPI";
import { useUtils } from "@/Orders/orderComposables/useUtils";
import { modals } from "@/Orders/orderComposables/useModals";
import Order from "@/Orders/orderTemplates/Order";
import OrderItem from "@/Orders/orderTemplates/OrderItem";
import { useOrderItem } from "@/Orders/orderComposables/orderItemProperties";

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
      activeItem: Object,
      ...useUtils(),
      ...modals,
    };
  },
  getters: {
    useActiveOrder(state) {
      const order = state.cart.find(
        (item) => item.number === state.activeNumber
      );
      return order;
    },
    useActiveItem(state) {
      if (state.useActiveOrder) {
        return state.useActiveOrder.items.find(
          (item) => item.number == this.activeItem.number
        );
      }
    },
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
      this.cart = [order, ...this.cart].unique();
      localStorage.setItem("cart", JSON.stringify(this.cart));
      this.updateChange();
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
            order.items.map(
              (item) => (item = useOrderItem(new OrderItem(item)))
            );
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
      this.updateChange();
      // return newOrders;
    },
    changeActiveOrderNumber(number) {
      this.activeNumber = number;
    },
    setActiveItem(item) {
      this.activeItem = item;
    },
    orderItems(order) {
      console.log(order);
      return order.items.map((item) => (item = new OrderItem(item)));
    },
    generateUID: () => {
      let firstPart = new Date();
      let secondPart = (Math.random() * (49999 - 101) + 101) | 0;
      firstPart = `${firstPart.getDate()}${firstPart.getMonth()}${firstPart.getFullYear()}`;
      secondPart = secondPart.toString();
      return firstPart + secondPart;
    },
    useOrderItemIndex(orderItem) {
      return this.useActiveOrder.items.findIndex(
        (item) => item.product.id === orderItem.product.id
      );
    },

    addToCart(orderItem) {
      const index = this.useOrderItemIndex(orderItem.value);
      if (index === -1) {
        const newItem = new OrderItem(orderItem.value);
        // PROBLEM PROBLEM PROBLEM
        this.useActiveOrder.items.push(orderItem.value);
      } else {
        this.addQty(orderItem.value, (orderItem.value.quantity = 1), index);
      }

      this.updateLocalStorage();
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
      this.updateLocalStorage();
      this.updateChange();
    },
    appllyItemDiscount(orderItem, discountType, discount) {
      const cartOrderItem = this.useActiveOrder.items.find(
        (item) => item.number === orderItem.number
      );
      try {
        cartOrderItem.discount = discount;
        cartOrderItem.discount_type = discountType;
        this.updateLocalStorage();
        this.updateChange();
      } catch (error) {
        console.log(error);
      }
    },
    appllyCartDiscount(order, discountType, discount) {
      const cartItem = this.cart.find((item) => item.number === order.number);
      console.log(cartItem);
      try {
        cartItem.discount = discount;
        cartItem.discountType = discountType;
        this.updateLocalStorage();
        this.updateChange();
      } catch (error) {
        console.log(error);
      }
    },
    applyRound(price, round) {
      const remainder = price % round;
      return remainder < round / 2
        ? price - remainder
        : price - remainder + round;
    },
    updateLocalStorage() {
      const storageCart = JSON.parse(localStorage.getItem("cart"));
      const activeOrderIndex = storageCart.findIndex(
        (order) => order.number === this.useActiveOrder.number
      );

      storageCart[activeOrderIndex].items = this.useActiveOrder.items;
      localStorage.setItem("cart", JSON.stringify(storageCart));
    },
    getItemSubTotal(item) {
      item.price * item.quantity;
    },

    getItemTotalPrice(item) {
      return item.product.price * item.quantity;
    },

    calculateActiveOrderDiscount(total) {
      if (this.useActiveOrder.discountType === 0) {
        return (this.useActiveOrder.discount * total) / 100;
      } else {
        return this.useActiveOrder.discount;
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
