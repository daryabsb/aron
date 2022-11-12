import { defineStore } from "pinia";

export const useUser = defineStore("user", {
  state: () => {
    return {
      user: null,
    };
  },
});
