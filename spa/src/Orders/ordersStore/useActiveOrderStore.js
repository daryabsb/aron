import { computed } from "vue";
import { defineStore } from "pinia";
import { useOrderStore } from "@/Orders/ordersStore";
import { useOrder } from "@/Orders/orderComposables/orderProperties";
import taxesAPI from "@/services/taxesAPI";
const { cart, activeNumber } = useOrderStore();

export default defineStore("activeOrder", {
  actions: {
    getItemSubTotal(item) {
      item.price * item.quantity;
    },

    getItemTotalPrice(item) {
      return item.product.price * item.quantity;
    },
    async vatRate(total) {
      const rate = (amount) => amount / 100;
      const taxResponse = await taxesAPI.getVAT();
      const taxRate = rate(taxResponse.data);
      total += total * taxRate;
      return total;
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
    useActiveOrder() {
      const order = cart.find((item) => item.number === activeNumber);
      return computed(() => useOrder(order));
    },
    activeOrderNumber: () => activeNumber,

    isActiveNumber(state) {
      return activeNumber != "";
    },
    isActiveOrderItems() {
      if (!this.isActiveNumber) return false;
      if (!this.useActiveOrder) return false;

      return this.useActiveOrder.value.items.length !== 0;
    },

    subTotalBeforeTax() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;

      return this.useActiveOrder.value.items.reduce(
        (total, item) => total + this.getItemTotalPrice(item),
        0
      );
    },
    subTotalWithTax() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;

      return this.subTotalBeforeTax + this.vatRate(this.subTotalBeforeTax);
    },
    subTotalBeforeDiscount() {
      if (!this.isActiveNumber) return 0;
      if (!this.isActiveOrderItems) return 0;
      return this.useActiveOrder.value.items.reduce(
        (total, item) => total + this.getItemTotalPrice(item),
        0
      );
    },
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
  },
});
