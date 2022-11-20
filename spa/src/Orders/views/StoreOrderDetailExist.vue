<template>
  <div class="overflow-auto scrollbar">
    <store-order-top-buttons></store-order-top-buttons>
    <div v-if="activeOrder" class="overflow-auto scrollbar w-full">
      <template v-for="item in useActiveOrder.items" :key="item.number">
        <Suspense>
          <OrdersItem :orderitem="item" @click="selectItem(item)"></OrdersItem>
          <template #fallback>
            <OrderItemSkeleton></OrderItemSkeleton>
          </template>
        </Suspense>
      </template>
    </div>

    <div
      v-else
      class="flex-1 w-full select-none flex flex-col flex-wrap content-center justify-center"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-16 inline-block"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"
        />
      </svg>
      <p>
        CART EMPTY
      </p>
    </div>
    <pre>{{ store.totalTax }}</pre>
  </div>
</template>

<script setup>
import {
  ref,
  computed,
  watch,
  onMounted,
  defineProps,
  defineAsyncComponent,
} from "vue";

import { useOrderStore } from "@/Orders/ordersStore";
import useActiveOrderStore from "@/Orders/ordersStore/useActiveOrderStore";
import OrdersItem from "@/Orders/components/OrdersItem.vue";
import OrderItem from "@/Orders/orderTemplates/OrderItem";
import StoreOrderTopButtons from "@/Orders/components/StoreOrderTopButtons.vue";
import OrderItemSkeleton from "../components/OrderItemSkeleton.vue";
import { useOrder } from "@/Orders/orderComposables/orderProperties";

import { loadUserData } from "@/Orders/orderComposables";
import Order from "../orderTemplates/Order";

const store = useOrderStore();
const props = defineProps({
  number: { type: String, required: true },
});
const useActiveOrder = store.useActiveOrder;
const convertItemToOrder = (item) => {
  const { product, number, order, user } = item;
  return new OrderItem(product, number, order, user);
};
const activeOrder = computed(() => useActiveOrder);
onMounted(async () => {
  store.activeNumber = props.number;
  if (store.cart.length === 0) {
    store.cart = JSON.parse(localStorage.getItem("cart"));
  }
});

const selectItem = (itm) => {
  itm.isActive = !itm.isActive;
};
</script>
