import { computed } from "vue";
import { useModals } from "@/stores/modals";
const store = useModals();

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

export const getEvt = (key) => {
  const F8 = "F8";
  const F9 = "F9";
  const F4 = "F4";
  const Control = "Control";
  const Escape = "Escape";
  const defaultKey = "default";

  const myKeys = {
    [F8]: () => (store.openPaymentModal = true),
    [F9]: () => (store.openCashModal = true),
    [F4]: () => (store.openOrderDiscountModal = true),
    [Control]: () => (store.searchModal = true),
    [Escape]: () => {
      store.openCashModal = false;
      store.openPaymentModal = false;
      store.searchModal = false;
      store.openOrderDiscountModal = false;
    },
    [defaultKey]: () => {
      "none";
    },
  };
  return myKeys[key] || myKeys[defaultKey];
};
