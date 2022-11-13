<template>
  <div
    class="relative w-full h-screen flex flex-col justify-start text-aronium-white bg-aronium-900 z-10"
  >
    <div
      class="h-20 py-1 w-full px-2 flex items-center border border-aronium-500 bg-transparent"
    >
      <store-header></store-header>
    </div>

    <div class="relative w-full inset-0">
      <StoreSearch />
    </div>
    <div class="flex flex-col inset-0">
      <div
        class="flex flex-grow divide-x-1 divide-aronium-500 inset-0 h-[60rem]"
      >
        <div class="phone:w-1/2 md:w-1/3 p-2 border-r border-aronium-500">
          <div class="">
            <store-order-top-buttons></store-order-top-buttons>
            <div v-if="activeOrder" class="overflow-hidden scrollbar w-full">
              <!-- v-if="activeOrder.status" -->

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
            </div>
          </div>
        </div>

        <div class="phone:w-1/2 md:w-2/3 py-3 overflow-auto scrollbar">
          <StoreGroupsList />
        </div>
      </div>
    </div>

    <div
      class="fixed bottom-0 w-full h-fit bg-aronium-900 px-2 flex justify-between items-center border border-aronium-500"
    >
      <!-- <StoreTotalsCalculations /> -->
    </div>
  </div>
</template>

<script setup>
import {
  ref,
  watchEffect,
  computed,
  onMounted,
  defineProps,
  defineAsyncComponent,
} from "vue";
import { useRoute, useRouter } from "vue-router";

import { useOrderStore } from "@/Orders/ordersStore";
import StoreOrderTopButtons from "@/Orders/components/StoreOrderTopButtons.vue";
import OrderItem from "@/Orders/components/OrderItem.vue";
import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

import { loadUserData } from "@/Orders/orderComposables";
const { cart } = useOrderStore();
const props = defineProps({
  number: String,
});

const activeOrder = ref(null);

onMounted(async () => {
  // if (!props.number) createCart();
  console.log("check cart length before: ", cart.length === 0);
  console.log("check cart length before: ", cart.length);
  if (cart.length === 0) await loadUserData();
  console.log("check cart length after: ", cart.length === 0);
  console.log("check cart length after: ", cart.length);
  activeOrder.value = computed(() =>
    cart.find((o) => o.number == props.number)
  );
});

watchEffect(async () => {}, {
  flush: "post",
});

console.log(activeOrder.value);
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
