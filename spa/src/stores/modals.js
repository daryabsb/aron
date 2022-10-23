import { computed } from "vue";
import { defineStore } from "pinia";

export const useModals = defineStore("modals", {
  state: () => {
    return {
      searchModal: false,
    };
  },
  getters: {
    isSearchModal(state) {
      return computed({
        get() {
          return state.searchModal;
        },
        set(value) {
          state.searchModal = value;
        },
      });
    },
  },
});
