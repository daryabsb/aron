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
import {
  ref,
  watch,
  watchEffect,
  computed,
  onMounted,
  defineProps,
  defineAsyncComponent,
} from "vue";
import { useRoute, useRouter } from "vue-router";

import { useOrderStore } from "@/Orders/ordersStore";
import StoreOrderTopButtons from "@/Orders/components/StoreOrderTopButtons.vue";
import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

import { loadUserData } from "@/Orders/orderComposables";
const { cart } = useOrderStore();
// const props = defineProps({
//   number: String,
// });

const activeOrder = ref(null);

onMounted(async () => {
  // if (!props.number) createCart();
  // console.log("check cart length before: ", cart.length === 0);
  // console.log("check cart length before: ", cart.length);
  // console.log("check cart length after: ", cart.length === 0);
  // console.log("check cart length after: ", cart.length);
});
// watchEffect(
//   async () => {
//     if (cart.length === 0) await loadUserData();
//     console.log(cart);
//     activeOrder.value = await cart.find((o) => o.number == props.number);
//   },
//   {
//     flush: "post",
//   }
// );

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
