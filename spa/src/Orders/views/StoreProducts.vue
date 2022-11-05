<template>
  <div>
    <cash-popper
      v-if="isCashModal"
      class="w-full"
      @close="cashModal"
    ></cash-popper>
    <payment-popper
      v-if="isPaymentModal"
      class="w-full"
      @close="paymentModal"
      @cash-out="cashOut"
    ></payment-popper>
    <search-panel v-if="isSearchModal" @close="searchModal"></search-panel>
    <store-order-discount
      v-if="isStoreOrderDiscount"
      @close="orderDiscountModal"
    ></store-order-discount>
    <!-- <header-search-popper
      v-if="isSearchModal"
      @close="searchModal"
    ></header-search-popper> -->
    <search-input></search-input>
    <div class="w-full h-fit overflow-auto scrollbar">
      <store-groups-list></store-groups-list>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import { useModals } from "@/stores/modals";
import { useOrderStore } from "@/Orders/ordersStore";

import SearchInput from "@/components/shared/SearchInput.vue";
import SearchPanel from "@/components/shared/SearchPanel.vue";

import StoreGroupsList from "@/Orders/components/StoreGroupsList.vue";
import CashPopper from "@/Orders/components/Modals/CashPopper.vue";
import PaymentPopper from "@/Orders/components/Modals/PaymentPopper.vue";
import StoreOrderDiscount from "@/Orders/components/StoreOrderDiscount.vue";
const store = useModals();

window.onkeydown = (evt) => {
  const getEvt = (key) => {
    const F8 = "F8";
    const F9 = "F9";
    const Control = "Control";
    const Escape = "Escape";
    const defaultKey = "default";

    const myKeys = {
      [F8]: () => (store.openPaymentModal = true),
      [F9]: () => (store.openCashModal = true),
      [Control]: () => (store.searchModal = true),
      [Escape]: () => {
        store.openCashModal = false;
        store.openPaymentModal = false;
        store.searchModal = false;
      },
      [defaultKey]: () => {
        "none";
      },
    };
    return myKeys[key] || myKeys[defaultKey];
  };
  return getEvt(evt.key)();
};

// END of F keys

export default {
  components: {
    SearchInput,
    StoreGroupsList,
    CashPopper,
    PaymentPopper,
    SearchPanel,
    StoreOrderDiscount,
  },
  setup() {
    const pos = useOrderStore();

    const isSearchModal = ref(store.isSearchModal);
    const isPaymentModal = ref(store.isPaymentModal);
    const isCashModal = ref(store.isCashModal);
    const isStoreOrderDiscount = ref(store.isStoreOrderDiscount);
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

    return {
      searchModal,
      isSearchModal,
      isStoreOrderDiscount,
      orderDiscountModal,
      cashModal,
      isCashModal,
      isPaymentModal,
      paymentModal,
      cashOut,
    };
  },
};
</script>
