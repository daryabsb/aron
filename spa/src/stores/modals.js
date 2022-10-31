import { computed } from "vue";
import { defineStore } from "pinia";

export const useModals = defineStore("modals", {
  state: () => {
    return {
      searchModal: false,
      openPaymentModal: false,
      openCashModal: false,
    };
  },
  getters: {
    isSearchModal(state) {
      return computed(() => state.searchModal);
    },
    isPaymentModal(state) {
      return computed(() => state.openPaymentModal);
    },
    isCashModal(state) {
      return computed(() => state.openCashModal);
    },
  },
});
