<template>
  <PaymentPopper v-if="isPayment" @close="paymentModal" @cash-out="cashOut" />
  <CashPopper v-if="isCashModal" @close="cashModal" />
  <PaymentPopper v-if="isPayment" @close="paymentModal" @cash-out="cashOut" />
  <search-panel v-if="isSearchModal" @close="searchModal"></search-panel>
  <StoreOrderDiscount v-if="isDiscount" @close="orderDiscountModal" />
  <div class="relative w-full h-screen flex flex-col justify-start text-aronium-white bg-aronium-900 z-10">
    <div class="h-20 py-1 w-full px-2 flex items-center border border-aronium-500 bg-transparent">
      <store-header></store-header>
    </div>

    <div class="relative w-full inset-0">
      <StoreSearch />
    </div>
    <div class="flex flex-col inset-0">
      <div class="flex flex-grow divide-x-1 divide-aronium-500 inset-0 h-[60rem]">
        <div class="phone:w-1/2 md:w-1/3 p-2 border-r border-aronium-500">
          <router-view></router-view>
        </div>

        <div class="phone:w-1/2 md:w-2/3 py-3 overflow-auto scrollbar">
          <StoreGroupsList />
        </div>
      </div>
    </div>

    <div
      class="fixed bottom-0 w-full h-fit bg-aronium-900 px-2 flex justify-between items-center border border-aronium-500">
      <StoreTotalsCalculations />
    </div>
  </div>
</template>

<script setup>
import { ref, defineAsyncComponent } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";

import { useModals } from "@/stores/modals";
import { getEvt } from "@/Orders/orderComposables";
import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

const { clearCash } = useOrderStore();
const store = useModals();

window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};
const isSearchModal = store.isSearchModal;
const isPayment = ref(store.isPaymentModal);
const isCashModal = ref(store.isCashModal);
const isDiscount = ref(store.isStoreOrderDiscount);
const isCalculator = ref(store.isCalculatorModal);


const PaymentPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/PaymentPopper.vue")
);
const StoreOrderDiscount = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderDiscount.vue")
);
const CashPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/CashPopper.vue")
);
const selectItem = (itm) => {
  itm.isActive = !itm.isActive;
};
const SearchPanel = defineAsyncComponent(() =>
  import("@/components/shared/SearchPanel.vue")
);
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
const searchModal = () => {
  store.searchModal = !store.searchModal;
};

const cashModal = () => {
  store.openCashModal = false;
};
const orderDiscountModal = () => {
  store.openOrderDiscountModal = false;
};
const paymentModal = () => {
  store.openPaymentModal = false;
  console.log(store.openPaymentModal);
  clearCash();
};
const cashOut = () => {
  paymentModal();
  cashModal();
};
</script>
