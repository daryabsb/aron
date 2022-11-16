import { computed } from "vue";
import { useModals } from "@/stores/modals";
import { useOrderStore } from "@/Orders/ordersStore";
import { useUser } from "@/Users/userStore";
import usersAPI from "@/services/usersAPI";
import ordersAPI from "@/services/ordersAPI";
import Order from "@/Orders/orderTemplates/Order";

const store = useModals();
const orders = useOrderStore();
const users = useUser();

export const useCart = computed(() => orders.cart);

export const loadUserData = async () => {
  let fetchedOrders = [];
  if (!users.user) {
    try {
      const userResponse = await usersAPI.getLoggedInUser();
      users.user = userResponse.data;
    } catch (error) {
      console.log(error);
    }
  }
  if (orders.cart.length === 0) {
    try {
      fetchedOrders = await orders.createCartFromAPI();
    } catch (error) {
      console.log(error);
    }
  }
  return [users.user, fetchedOrders];
};

export const numberFormat = (number) => {
  return number.toString();
  // .replace(/^0|\./g)
  // .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
};
export const priceFormat = (number) => {
  return computed(() => (number ? ` ${number} IQD` : ""));
};

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
    [Control]: () => (store.searchModal = !store.searchModal),
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
