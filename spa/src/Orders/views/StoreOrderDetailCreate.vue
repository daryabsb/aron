<template>
  <div class="">
    <store-order-top-buttons></store-order-top-buttons>
    Create is called
    <!-- <div v-if="activeOrder" class="overflow-hidden scrollbar w-full">
      <div v-if="activeOrder.items">
        <template v-for="item in activeOrder.items" :key="item.id">
          <order-item
            v-if="activeOrder.items"
            :item="item"
            @click="selectItem(item)"
          ></order-item>
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
    </div> -->
  </div>
</template>

<script setup>
import {
  // ref,
  watch,
  watchEffect,
  computed,
  nextTick,
  onMounted,
  defineProps,
  defineAsyncComponent,
} from "vue";
import { useRoute, useRouter } from "vue-router";

import { useOrderStore } from "@/Orders/ordersStore";
import StoreOrderTopButtons from "@/Orders/components/StoreOrderTopButtons.vue";
// import OrderItem from "@/Orders/components/OrderItem.vue";
// import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

// import { loadUserData } from "@/Orders/orderComposables";
const { activeOrderNumber, createCart } = useOrderStore();
const props = defineProps({
  create: Boolean,
});

const activeNumber = computed(() => activeOrderNumber);
const router = useRouter();
onMounted(() => {
  createCart();

  // console.log("check cart length before: ", cart.length === 0);
  // console.log("check cart length before: ", cart.length);
  // console.log("check cart length after: ", cart.length === 0);
  // console.log("check cart length after: ", cart.length);
});
watchEffect(async () => {
  await nextTick();
  if (activeNumber.value) {
    await router.push(`/store/order/${activeNumber.value}`);
  }
});

// console.log(activeOrder.value);
const selectItem = (itm) => {
  // for (let item of activeOrder.value.items) {
  //   // if (!item.isActive) continue;
  //   // if(item.id==itm.id) continue;
  //   item.isActive = false;
  // }
  itm.isActive = !itm.isActive;
};
const StoreSearch = defineAsyncComponent(() =>
  import("@/Orders/components/StoreSearch.vue")
);
const StoreTotalsCalculations = defineAsyncComponent(() =>
  import("@/Orders/components/StoreTotalsCalculations.vue")
);
// import StoreGroupsList from "@/Orders/components/StoreGroupsList.vue";
const StoreGroupsList = defineAsyncComponent(() =>
  import("@/Orders/components/StoreGroupsList.vue")
);
</script>
