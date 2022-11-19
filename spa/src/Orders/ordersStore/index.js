import { defineStore } from "pinia";
import ordersAPI from "@/services/ordersAPI";
import Order from "@/Orders/orderTemplates/Order";
import OrderItem from "@/Orders/orderTemplates/OrderItem";

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
    };
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

        const arr1 = [1, 2, 3, 4, 5];
        const arr2 = [4, 5, 6, 7, 8];

        const arr3 = [...arr1, ...arr2].unique();

        console.log("arr3", arr3);

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
      this.updateLocalStorage();
      this.updateChange();
    },
    updateLocalStorage() {
      const storageCart = JSON.parse(localStorage.getItem("cart"));
      const activeOrderIndex = storageCart.findIndex(
        (order) => order.number === this.useActiveOrder.value.number
      );

      storageCart[activeOrderIndex].items = this.useActiveOrder.value.items;
      localStorage.setItem("cart", JSON.stringify(storageCart));
    },
  },
  getters: {
    // useActiveOrder: (state) => {
    //   const order = state.cart.find(
    //     (item) => item.number === state.activeNumber
    //   );
    //   return computed(() => useOrder(order));
    // },
  },
});
