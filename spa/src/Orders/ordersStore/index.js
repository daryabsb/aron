import { ref, reactive, computed } from "vue";
import { defineStore } from "pinia";
import ordersAPI from "@/services/ordersAPI";
import { useUtils } from "@/Orders/orderComposables/useUtils";
import { modals } from "@/Orders/orderComposables/useModals";
import Order from "@/Orders/orderTemplates/Order";
import { useOrder } from "@/Orders/orderComposables/orderProperties";

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

export const useOrderStore = defineStore("orders", () => {
  const { updateChange, beep, clearSound } = useUtils();

  // STATE
  const cart = ref([]);
  const activeNumber = ref("");
  const activeItem = ref({});

  // GETTERS
  const useActiveOrder = computed(() => {
    const order = cart.value.find((item) => item.number === activeNumber.value);
    return new Order(order);
  });
  const useActiveItem = computed(() => {
    if (!useActiveOrder.value) return;
    return useActiveOrder.value.items.find(
      (item) => item.number == activeItem.value.number
    );
  });

  // ACTIONS
  const generateNumber = async (target) => {
    try {
      const response = await ordersAPI.getNumber(target);

      return response.data;
    } catch (error) {
      console.log(error);
    }
  };
  const createCart = async (number) => {
    const order = new Order({ number: number });
    cart.value = [order, ...cart.value].unique();
    localStorage.setItem("cart", JSON.stringify(cart.value));
    updateChange();
    return order;
  };
  const createCartFromAPI = async () => {
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
          order.items.map((item) => (item = useOrderItem(new OrderItem(item))));
        }
      });

      if (storageCart && storageCart.length > 0) {
        cart.value = [...newOrders, ...storageCart].unique();
      } else cart.value = [...newOrders];
      localStorage.setItem("cart", JSON.stringify(cart.value));

      // store.activeNumber = store.cart[0].number;
    } catch (error) {
      console.log(error);
    }
    updateChange();
    // return newOrders;
  };

  const changeActiveOrderNumber = (number) => {
    activeNumber.value = number;
  };
  const setActiveItem = (item) => {
    activeItem.value = item;
  };
  const orderItems = (order) => {
    console.log(order);
    return order.items.map((item) => (item = new OrderItem(item)));
  };
  const generateUID = () => {
    let firstPart = new Date();
    let secondPart = (Math.random() * (49999 - 101) + 101) | 0;
    firstPart = `${firstPart.getDate()}${firstPart.getMonth()}${firstPart.getFullYear()}`;
    secondPart = secondPart.toString();
    return firstPart + secondPart;
  };
  const useOrderItemIndex = (orderItem) => {
    return useActiveOrder.value.items.findIndex(
      (item) => item.product.id === orderItem.product.id
    );
  };

  const addToCart = (orderItem) => {
    const index = useOrderItemIndex(orderItem.value);
    if (index === -1) {
      const newItem = new OrderItem(orderItem.value);
      // PROBLEM PROBLEM PROBLEM
      useActiveOrder.value.items.push(orderItem.value);
    } else {
      addQty(orderItem.value, (orderItem.value.quantity = 1), index);
    }

    updateLocalStorage();
    beep();
    updateChange();
  };
  const addQty = (orderItem, quantity, index) => {
    if (!index) index = useOrderItemIndex(orderItem);
    const item = useActiveOrder.value.items[index];
    const afterAdd = item.quantity + quantity;
    if (afterAdd === 0) {
      useActiveOrder.value.items.splice(index, 1);
      clearSound();
    } else {
      item.quantity = afterAdd;
      beep();
    }
    updateLocalStorage();
    updateChange();
  };
  const appllyItemDiscount = (discountType, discount) => {
    // const cartOrderItem = useActiveOrder.value.items.find(
    //   (item) => item.number === orderItem.number
    // );
    try {
      activeItem.value.discount = discount;
      activeItem.value.discount_type = discountType;
      updateLocalStorage();
      updateChange();
    } catch (error) {
      console.log(error);
    }
  };
  const appllyCartDiscount = (discountType, discount) => {
    const cartItem = cart.value.find(
      (item) => item.number === useActiveOrder.value.number
    );
    try {
      cartItem.discount = discount;
      cartItem.discount_type = discountType;

      updateLocalStorage();
      updateChange();
    } catch (error) {
      console.log(error);
    }
  };
  const applyRound = (price, round) => {
    const remainder = price % round;
    return remainder < round / 2
      ? price - remainder
      : price - remainder + round;
  };
  const updateLocalStorage = () => {
    const storageCart = JSON.parse(localStorage.getItem("cart"));
    const activeOrderIndex = storageCart.findIndex(
      (order) => order.number === useActiveOrder.value.number
    );

    storageCart[activeOrderIndex] = useActiveOrder.value;
    localStorage.setItem("cart", JSON.stringify(storageCart));
  };
  const getItemSubTotal = (item) => {
    item.price * item.quantity;
  };

  const getItemTotalPrice = (item) => {
    return item.product.price * item.quantity;
  };

  const calculateActiveOrderDiscount = (total) => {
    if (useActiveOrder.value.discountType === 0) {
      return (useActiveOrder.value.discount * total) / 100;
    } else {
      return useActiveOrder.value.discount;
    }
  };

  return {
    cart,
    activeNumber,
    activeItem,
    ...useUtils(),
    ...modals,
    useActiveOrder,
    useActiveItem,
    generateNumber,
    createCart,
    createCartFromAPI,
    changeActiveOrderNumber,
    setActiveItem,
    orderItems,
    generateUID,
    useOrderItemIndex,
    addToCart,
    addQty,
    appllyItemDiscount,
    appllyCartDiscount,
    applyRound,
    getItemSubTotal,
    getItemTotalPrice,
    calculateActiveOrderDiscount,
  };
});
