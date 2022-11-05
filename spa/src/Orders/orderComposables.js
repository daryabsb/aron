import { computed } from "vue";

export const orderItemTotalPrice = (orderItem) => {
  let total;
  if (!orderItem.discount && !orderItem.tax)
    total = orderItem.price * orderItem.quantity;

  if (!orderItem) return computed(() => total);
};

export const calculateTax = (item) => {
  const taxRate = item.total * (item.tax / 100);
  return item.total + taxRate;
};

const multiply = (a, b) => a * b;
const divide = (a, b) => a / b;
const subtract = (a, b) => a - b;

export const calculateItemDiscount = (item) => {};
