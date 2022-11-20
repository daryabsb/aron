<template>
  <PaymentPopper
    v-if="store.openPaymentModal"
    @close="togglePaymentModal"
    @cash-out="cashOut"
  />
  <CashPopper v-if="store.openCashModal" @close="toggleCashModal" />
  <search-panel
    v-if="store.searchModal"
    @close="toggleSearchModal"
  ></search-panel>
  <StoreOrderDiscount
    v-if="store.orderDiscountModal"
    @close="toggleOrderDiscountModal"
  />
  <div
    class="relative w-full h-screen flex flex-col justify-start text-aronium-white bg-aronium-900 z-10"
  >
    <div
      class="h-20 py-1 w-full px-2 flex items-center border border-aronium-500 bg-transparent"
    >
      <StoreHeader />
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
      <StoreTotalsCalculations />
    </div>
  </div>
</template>

<script setup>
import { defineAsyncComponent } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
import { getEvt } from "@/Orders/orderComposables";
import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

const store = useOrderStore();

window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};

const PaymentPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/PaymentPopper.vue")
);
const StoreTotalsCalculations = defineAsyncComponent(() =>
  import("@/Orders/components/StoreTotalsCalculations.vue")
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

// import StoreGroupsList from "@/Orders/components/StoreGroupsList.vue";
const StoreGroupsList = defineAsyncComponent(() =>
  import("@/Orders/components/StoreGroupsList.vue")
);
const toggleSearchModal = () => {
  store.searchModal = !store.searchModal;
};

const toggleCashModal = () => {
  store.openCashModal = false;
};
const toggleOrderDiscountModal = () => {
  store.openOrderDiscountModal = false;
};
const togglePaymentModal = () => {
  store.openPaymentModal = false;
  store.clearCash();
};
const cashOut = () => {
  togglePaymentModal();
  toggleCashModal();
};
</script>
