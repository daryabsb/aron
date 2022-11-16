<template>
  <div>
    <store-order-top-buttons></store-order-top-buttons>
    <div class="overflow-hidden scrollbar w-full">
      <div
        v-if="activeOrder.items.length === 0"
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
      <!-- <span class="text-sm text-aronium-green"
        >" {{ useActiveOrder.number }} "</span
      > -->
      <template v-for="item in activeOrder.items" :key="item.number">
        <order-item
          v-if="item"
          :item="item"
          @click="selectItem(item)"
        ></order-item>
      </template>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, defineAsyncComponent } from "vue";
import { useRoute } from "vue-router";

import { useOrderStore } from "@/Orders/ordersStore";
import StoreOrderTopButtons from "@/Orders/components/StoreOrderTopButtons.vue";
import OrderItem from "@/Orders/components/OrderItem.vue";

const id = ref(null);

// const OrderItem = defineAsyncComponent(() =>
//   import("@/components/store/orders/OrderItem.vue")
// );
const store = useOrderStore();
const route = useRoute();
const activeNumber = computed(() => store.activeNumber);

// const activeOrder = computed(() => store.useActiveOrder);
const activeOrder = computed(() => store.useActiveOrder.value);
const selectItem = (itm) => {
  // for (let item of activeOrder.value.items) {
  //   // if (!item.isActive) continue;
  //   // if(item.id==itm.id) continue;
  //   item.isActive = false;
  // }
  itm.isActive = !itm.isActive;
};
</script>
