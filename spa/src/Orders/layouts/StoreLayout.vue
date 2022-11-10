<template>
  <div>
    <PurpleCalculator />
    <CashPopper v-if="isCashModal" @close="cashModal" />
    <PaymentPopper v-if="isPayment" @close="paymentModal" @cash-out="cashOut" />
    <search-panel v-if="isSearchModal" @close="searchModal"></search-panel>
    <StoreOrderDiscount v-if="isDiscount" @close="orderDiscountModal" />
    <router-view></router-view>
  </div>
</template>
<script setup>
import { ref, defineAsyncComponent } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";

import { useModals } from "@/stores/modals";
import { getEvt } from "@/Orders/orderComposables";

const { clearCash } = useOrderStore();

const StoreOrderDiscount = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderDiscount.vue")
);

const SearchPanel = defineAsyncComponent(() =>
  import("@/components/shared/SearchPanel.vue")
);
const CashPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/CashPopper.vue")
);
const PurpleCalculator = defineAsyncComponent(() =>
  import("@/components/shared/calculator/NumericPadPurple.vue")
);
const PaymentPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/PaymentPopper.vue")
);
const store = useModals();

window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};

const isSearchModal = store.isSearchModal;
const isPayment = ref(store.isPaymentModal);
const isCashModal = ref(store.isCashModal);
const isDiscount = ref(store.isStoreOrderDiscount);
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
