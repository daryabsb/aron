import { defineStore } from "pinia";

export const useModals = defineStore("modals", {
  state: () => {
    return {
      searchModal: false,
    };
  },
});
