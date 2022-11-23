import { defineStore } from "pinia";
import usersAPI from "@/services/usersAPI";

export const useUser = defineStore("user", {
  state: () => {
    return {
      user: null,
    };
  },
  actions: {
    async loadUserData() {
      if (!this.user) {
        try {
          const userResponse = await usersAPI.getLoggedInUser();
          this.user = userResponse.data;
        } catch (error) {
          console.log(error);
        }
      }

      return this.user;
    },
  },
});
