<template>
  <div class="flex flex-col space-y-2 flex-1 max-h-[90rem] mt-3">
    <Suspense>
      <template #default>
        <template v-for="item in useActiveOrder.items" :key="item.number">
          <order-item :item="item"></order-item>
        </template>
      </template>
      <template #fallback>
        <div
          class="flex-1 w-full p-4 select-none flex flex-col flex-wrap content-center justify-center"
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
      </template>
    </Suspense>
  </div>
</template>

<script setup>
import { useOrderStore } from "@/Orders/ordersStore";

import OrderItem from "@/components/pos/orders/OrderItem.vue";
// import { products } from "./PlaceHolder";

const store = useOrderStore();
const activeOrderNumber = store.activeNumber;
const useActiveOrder = store.useActiveOrder;
</script>
