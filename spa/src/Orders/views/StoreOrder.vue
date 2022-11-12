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
          <router-view></router-view>
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
import { ref, watchEffect, watch, onMounted, defineAsyncComponent } from "vue";
import { useRouter, useRoute } from "vue-router";
import { loadUserData } from "@/Orders/orderComposables";

import { useOrderStore } from "@/Orders/ordersStore";

import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

const { activeOrderNumber, cart, createCart } = useOrderStore();
// const router = useRouter();
const number = ref(activeOrderNumber);
onMounted(async () => {
  console.log(cart.length);
  if (cart.length === 0) await loadUserData();
  createCart();
});

// if (!activeNumber) createCart();
// onMounted(()=>{
// if(cart.length === 0)
// })

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
