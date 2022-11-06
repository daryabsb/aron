<template>
  <div>
    <CashPopper v-if="isCashModal" @close="cashModal" />
    <PaymentPopper v-if="isPayment" @close="paymentModal" @cash-out="cashOut" />
    <search-panel v-if="isSearchModal" @close="searchModal"></search-panel>
    <StoreOrderDiscount v-if="isDiscount" @close="orderDiscountModal" />
    <search-input></search-input>
    <div class="w-full h-fit overflow-auto scrollbar">
      <store-groups-list></store-groups-list>
    </div>
  </div>
</template>
<script setup>
import { ref, defineAsyncComponent } from "vue";
import { useModals } from "@/stores/modals";
import { useOrderStore } from "@/Orders/ordersStore";
import { getEvt } from "@/Orders/orderComposables";

import StoreGroupsList from "@/Orders/components/StoreGroupsList.vue";

const StoreOrderDiscount = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderDiscount.vue")
);

const SearchInput = defineAsyncComponent(() =>
  import("@/components/shared/SearchInput.vue")
);
const SearchPanel = defineAsyncComponent(() =>
  import("@/components/shared/SearchPanel.vue")
);
const CashPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/CashPopper.vue")
);
const PaymentPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/PaymentPopper.vue")
);

const store = useModals();
window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};

const pos = useOrderStore();

const isSearchModal = ref(store.isSearchModal);
const isPayment = ref(store.isPaymentModal);
const isCashModal = ref(store.isCashModal);
const isDiscount = ref(store.isStoreOrderDiscount);
const clearCash = pos.clearCash;

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
  clearCash();
};
const cashOut = () => {
  paymentModal();
  cashModal();
};
</script>
