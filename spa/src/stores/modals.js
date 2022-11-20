import { computed } from "vue";
import { defineStore } from "pinia";

export const useModals = defineStore("modals", {
  state: () => {
    return {
      searchModal: false,
      openPaymentModal: false,
      openCashModal: false,
      openOrderDiscountModal: false,
      openCalculatorModal: false,
    };
  },
  getters: {
    isSearchModal(state) {
      return state.searchModal;
    },
    isPaymentModal(state) {
      return state.openPaymentModal;
    },
    isCashModal(state) {
      return state.openCashModal;
    },
    isStoreOrderDiscount(state) {
      return state.openOrderDiscountModal;
    },
    isCalculatorModal(state) {
      return state.openCalculatorModal;
    },
  },
});
