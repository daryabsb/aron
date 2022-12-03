import { ref, computed } from "vue";
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

export const useOrderStore = defineStore("orders", () => {
  const { updateChange, beep, clearSound } = useUtils();

  // STATE
  const cart = ref([]);
  const activeNumber = ref("");
  const activeItem = ref({});
  const paymentTypes = ref([]);

  // GETTERS
  const useActiveOrder = computed(() => {
    const order = cart.value.find((item) => item.number === activeNumber.value);
    return new Order(order);
  });
  const useActiveItem = computed(() => {
    if (!useActiveOrder.value) return null;
    if (!useActiveItem.value) return null;
    return useActiveOrder.value.items.find(
      (item) => item.number == activeItem.value.number
    );
  });
  const usePaymentTypes = computed(() => paymentTypes.value);

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
  const submitOrder = async (data) => {
    // TASKS:
    // submit an order to the API
    // const order = cart.value.find(
    //   (cort) => cort.number === useActiveOrder.value.number
    // );

    const orderPayload = {
      number: useActiveOrder.value.number,
      discount: useActiveOrder.value.discount,
      discount_type: useActiveOrder.value.discount_type,
      status: true,
      total: useActiveOrder.value.totalPrice,
    };

    const ordersResponse = await ordersAPI.submitOrder(orderPayload);
    console.log("Order is done");
    useActiveOrder.value.items.forEach(async (item) => {
      const product = item.product.id;
      const price = useActiveOrder.value.itemTotal(item);
      const itemPayload = {
        number: item.number,
        round_number: 0,
        quantity: item.quantity,
        price: price,
        is_locked: false,
        discount: item.discount,
        discount_type: item.discount_type,
        is_featured: false,
        voided_by: 0,
        comment: "",
        bundle: "",
        user: 1,
        order: useActiveOrder.value.number,
        product: product,
      };
      console.log("itemPayload", itemPayload);

      const orderItemResponse = await ordersAPI.submitOrderItem(itemPayload);
    });

    console.log(ordersResponse);
  };
  const loadPaymentTypes = async () => {
    try {
      const ptResponse = await ordersAPI.getPaymentTypes();
      paymentTypes.value = await ptResponse.data;
    } catch (error) {
      console.log("loadPaymentTypes error", error);
    }
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

  const openDiscountModal = async () => {
    console.log("we are here", modals.openOrderDiscountModal);
    modals.openOrderDiscountModal = true;
    console.log("this is modals", modals.openOrderDiscountModal);
  };

  return {
    cart,
    activeNumber,
    activeItem,
    ...useUtils(),
    ...modals,
    paymentTypes,
    useActiveOrder,
    useActiveItem,
    usePaymentTypes,
    loadPaymentTypes,
    generateNumber,
    createCart,
    createCartFromAPI,
    submitOrder,
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
    openDiscountModal,
  };
});
