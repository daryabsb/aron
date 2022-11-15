<template>
  <div>
    <store-order-top-buttons></store-order-top-buttons>
    <div
      v-if="store.useActiveOrder.items"
      class="overflow-auto scrollbar w-full"
    >
      <template v-for="item in store.useActiveOrder.items" :key="item.id">
        <Suspense>
          <order-item :item="item" @click="selectItem(item)"></order-item>
          <template #fallback>
            <order-item-skeleton></order-item-skeleton>
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
  </div>
</template>

<script setup>
import {
  ref,
  computed,
  onMounted,
  defineProps,
  // defineAsyncComponent,
} from "vue";

import { useOrderStore } from "@/Orders/ordersStore";
import OrderItem from "@/Orders/components/OrderItem.vue";
import StoreOrderTopButtons from "@/Orders/components/StoreOrderTopButtons.vue";
import OrderItemSkeleton from "../components/OrderItemSkeleton.vue";

import { loadUserData } from "@/Orders/orderComposables";
const store = useOrderStore();
const props = defineProps({
  number: { type: String, required: true },
});

onMounted(async () => {
  if (store.cart.length === 0) await loadUserData();
  store.activeNumber = props.number;
});

// console.log(activeOrder.value);
const selectItem = (itm) => {
  itm.isActive = !itm.isActive;
};
// const OrderItem = defineAsyncComponent(() => {
//   import("@/Orders/components/OrderItem.vue");
// });
</script>
