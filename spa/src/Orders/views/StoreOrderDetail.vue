<template>
  <div
    class="phone:w-1/2 md:w-1/3 p-3 overflow-auto scrollbar border-r border-aronium-500"
  >
    <store-order-list></store-order-list>
  </div>
</template>
<script setup>
import { computed, onMounted, defineProps, defineAsyncComponent } from "vue";
import { useRouter, useRoute } from "vue-router";
import StoreOrderList from "@/Orders/components/StoreOrderList.vue";
import { useOrderStore } from "@/Orders/ordersStore";

const { cart, createCart } = useOrderStore();
const router = useRouter();
const route = useRoute();
const store = useOrderStore();

// import { useOrderStore } from "@/Orders/ordersStore";
// const
onMounted(() => {
  if (cart.length === 0 && !route.params.number) {
    createCart();
    console.log(cart);
  }
  store.activeNumber = cart.find(
    (order) => order.number === route.params.number
  );
  router.push(`/store/order/${store.activeNumber}`);
});

// const StoreOrderTopButtons = defineAsyncComponent(() =>
//   import("@/Orders/components/StoreOrderTopButtons.vue")
// );
// const SearchInput = defineAsyncComponent(() =>
//   import("@/components/shared/SearchInput.vue")
// );
// const props = defineProps({
//   number: { type: String, required: true },
// });
// const store = useOrderStore();
// const activeOrder = computed(() => {
//   return store.cart.find((order) => order.number === props.number);
// });
</script>
