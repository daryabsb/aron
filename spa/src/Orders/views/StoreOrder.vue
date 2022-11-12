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
        <router-view></router-view>

        <div class="phone:w-1/2 md:w-2/3 py-3 overflow-auto scrollbar">
          <StoreGroupsList />
        </div>
      </div>
    </div>

    <div
      class="fixed bottom-0 w-full h-fit bg-aronium-900 px-2 flex justify-between items-center border border-aronium-500"
    >
      <StoreTotalsCalculations />
    </div>
  </div>
</template>
<script setup>
import { computed, onMounted, defineAsyncComponent } from "vue";
import { useRouter, useRoute } from "vue-router";

import { useOrderStore } from "@/Orders/ordersStore";

import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

const { cart, createCart } = useOrderStore();
console.log(cart);
const router = useRouter();
const route = useRoute();
const store = useOrderStore();

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
