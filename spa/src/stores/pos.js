import { computed, ref } from "vue";
import { defineStore } from "pinia";
import {
  generateUID,
  beep,
  updateChange,
  useOrderItemIndex,
  getItemTotalPrice,
} from "@/store/composables";

export const usePos = defineStore("pos", {
  state: () => {
    return {
      cart: [],
      activeNumber: ref(""),
      moneys: [250, 500, 1000, 5000, 10000, 25000, 50000, 100000],
    };
  },
  actions: {
    createCart() {
      const number = generateUID();
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

    addToCart(orderItem) {
      const index = useOrderItemIndex(orderItem);
      if (index === -1) {
        this.useActiveOrder.value.items.push(orderItem);
      } else {
        this.useActiveOrder.value.items[index].quantity += 1;
      }
      beep();
      updateChange();
    },
    addQty(orderItem, quantity) {
      const index = useOrderItemIndex(orderItem);
      const item = this.useActiveOrder.value.items[index];
      item.quantity += quantity;
      //   item.total = item.price * item.quantity;

      beep();
      updateChange();
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
    totalPrice: (state) => {
      if (!state.activeNumber) return 0;
      const activeOrder = state.cart.find(
        (order) => order.number === state.activeNumber
      );
      if (activeOrder.items.length === 0) return 0;
      activeOrder.total = activeOrder.items.reduce(
        (total, item) => total + item.price * item.quantity
      );

      console.log("activeOrder.total", activeOrder.total);
      return computed(() => activeOrder.total);
    },
  },
});
