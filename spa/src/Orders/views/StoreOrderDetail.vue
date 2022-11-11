<template>
  <div class="flex flex-col inset-0">
    <div class="flex flex-grow divide-x-1 divide-aronium-500 inset-0 h-[60rem]">
      <div
        class="phone:w-1/2 md:w-1/3 p-3 overflow-auto scrollbar border-r border-aronium-500"
      >
        <store-order-list></store-order-list>
      </div>

      <div class="phone:w-1/2 md:w-2/3 py-3 overflow-auto scrollbar">
        <store-groups-list></store-groups-list>
      </div>
    </div>
  </div>
</template>
<script setup>
import { computed, defineProps, defineAsyncComponent } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
import StoreOrderList from "@/Orders/components/StoreOrderList.vue";
import StoreGroupsList from "@/Orders/components/StoreGroupsList.vue";
const StoreOrderTopButtons = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderTopButtons.vue")
);
const SearchInput = defineAsyncComponent(() =>
  import("@/components/shared/SearchInput.vue")
);
const props = defineProps({
  number: { type: String, required: true },
});
const store = useOrderStore();
// const activeOrder = computed(() => {
//   return store.cart.find((order) => order.number === props.number);
// });
</script>
