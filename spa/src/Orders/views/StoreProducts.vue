<template>
  <div
    class="relative w-full h-screen flex flex-col justify-start text-aronium-white bg-aronium-900 z-10"
  >
    <CashPopper v-if="isCashModal" @close="cashModal" />
    <PaymentPopper v-if="isPayment" @close="paymentModal" @cash-out="cashOut" />
    <search-panel v-if="isSearchModal" @close="searchModal"></search-panel>
    <StoreOrderDiscount v-if="isDiscount" @close="orderDiscountModal" />
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
import { ref, computed, onMounted, defineAsyncComponent } from "vue";
import { useRouter } from "vue-router";

import { useOrderStore } from "@/Orders/ordersStore";
import { useModals } from "@/stores/modals";
import { getEvt } from "@/Orders/orderComposables";

import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

const StoreOrderDiscount = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderDiscount.vue")
);

const SearchPanel = defineAsyncComponent(() =>
  import("@/components/shared/SearchPanel.vue")
);
const StoreSearch = defineAsyncComponent(() =>
  import("@/Orders/components/StoreSearch.vue")
);
const CashPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/CashPopper.vue")
);
const PaymentPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/PaymentPopper.vue")
);
const StoreTotalsCalculations = defineAsyncComponent(() =>
  import("@/Orders/components/StoreTotalsCalculations.vue")
);

// import PaymentPopper from "@/components/poppers/PaymentPopper.vue";

// const HeaderSearchPopper = defineAsyncComponent(() => {
//   import("@/components/poppers/HeaderSearchPopper.vue");
// });

// defineEmits(["close", "cashOut"]);

window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};

const store = useOrderStore();
const mods = useModals();

const createCart = store.createCart;
const cart = store.cart;

const isSearchModal = mods.isSearchModal;
const searchModal = () => {
  mods.searchModal = !mods.searchModal;
};

const router = useRouter();

const pos = useOrderStore();
const activeNumber = computed(() => pos.activeNumber);
onMounted(() => router.push(`/store/order/${activeNumber.value}`));

const isPayment = ref(mods.isPaymentModal);
const isCashModal = ref(mods.isCashModal);
const isDiscount = ref(mods.isStoreOrderDiscount);
const clearCash = pos.clearCash;

const cashModal = () => {
  mods.openCashModal = false;
};

const orderDiscountModal = () => {
  mods.openOrderDiscountModal = false;
};

const paymentModal = () => {
  mods.openPaymentModal = false;
  clearCash();
};
const cashOut = () => {
  paymentModal();
  cashModal();
};
if (cart.length === 0) createCart();
</script>
