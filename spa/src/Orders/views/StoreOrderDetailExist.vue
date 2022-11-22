<template>
  <div>
    <StoreOrderTopButtons />
    <div v-if="useActiveOrder" class="overflow-y-auto scrollbar">
      <Suspense>
        <OrdersItem />
        <template #fallback>
          <OrderItemSkeleton />
        </template>
      </Suspense>
    </div>

    <div v-else class="flex-1 w-full select-none flex flex-col flex-wrap content-center justify-center">
      <svg class="h-16 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
          d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
      </svg>
      <p>
        CART EMPTY
      </p>
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted, defineProps, defineAsyncComponent } from "vue";
import OrdersItem from "@/Orders/components/OrdersItem.vue";
import { useOrderStore } from "@/Orders/ordersStore";
import { useOrder } from "@/Orders/orderComposables/orderProperties";

onMounted(async () => {
  store.activeNumber = props.number;
  if (store.cart.length === 0) {
    store.cart = JSON.parse(localStorage.getItem("cart"));
  }
});

const props = defineProps({
  number: { type: String, required: true },
});
const StoreOrderTopButtons = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderTopButtons.vue")
);
const OrderItemSkeleton = defineAsyncComponent(() =>
  import("@/Orders/components/OrderItemSkeleton.vue")
);

const store = useOrderStore();
const useActiveOrder = computed(() => useOrder(store.useActiveOrder));

const selectItem = (itm) => {
  itm.isActive = !itm.isActive;
};
</script>
