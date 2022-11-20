import { defineStore } from "pinia";
import taxesAPI from "@/services/taxesAPI";
export default defineStore("tax", {
  actions: {
    fetchVAT() {
      return taxesAPI.getVAT();
    },
  },
});
