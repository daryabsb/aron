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
    <div class="bg-aronium-900 border-x border-aronium-500">
      <router-view :number="activeNumber"></router-view>
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
import { useRouter } from "vue-router";

import { useOrderStore } from "@/Orders/ordersStore";

import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

const { cart, createCart } = useOrderStore();
const router = useRouter();
const store = useOrderStore();
const activeNumber = computed(() => store.activeNumber);
onMounted(() => router.push(`/store/order/${activeNumber.value}`));
if (cart.length === 0) createCart();

const StoreSearch = defineAsyncComponent(() =>
  import("@/Orders/components/StoreSearch.vue")
);
const StoreTotalsCalculations = defineAsyncComponent(() =>
  import("@/Orders/components/StoreTotalsCalculations.vue")
);
</script>
