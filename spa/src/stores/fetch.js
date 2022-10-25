import { computed, ref } from "vue";
import { defineStore } from "pinia";
import getStockList from "@/stores/api/getStockList";
import getProducts from "@/stores/api/getProducts";
import getProductGroups from "@/stores/api/getProductGroups";
import moment from "moment";

export const useFetch = defineStore("api", {
  state: () => {
    return {
      products: [],
      productGroups: [],
      filteredProducts: [],
      filteredStockProducts: [],
      stocks: [],
    };
  },
  actions: {
    async fetchProducts() {
      try {
        const products = await getProducts();
        this.products = products;
      } catch (error) {
        console.log("getProducts from store", error);
      }
    },
    async fetchProductsByGroupId(groupId) {
      try {
        const products = await getProducts(groupId);
        this.filteredProducts = products;
      } catch (error) {
        console.log("getProducts from store", error);
      }
      console.log("this.filteredProducts", this.filteredProducts);
    },
    async fetchGroups() {
      try {
        // console.log(" reached groups");
        const groups = await getProductGroups();
        this.productGroups = groups;
        // console.log("groups", this.productGroups);
      } catch (error) {
        console.log("getProducts from store", error);
      }
    },
    async fetchProductData() {
      await this.fetchGroups();
      await this.fetchProducts();
      console.log("hooray");
    },
    async fetchStock() {
      try {
        const stocks = await getStockList();
        this.stocks = stocks;
      } catch (error) {
        console.log("getStockList from store", error);
      }
    },
    // async fetchProductsByGroupId(groupId) {
    //   try {
    //     const products = await getStockList(groupId);
    //     this.filteredroducts = products;
    //   } catch (error) {
    //     console.log("getProducts from store", error);
    //   }
    // },
  },
  getters: {
    getProductById(state) {
      return (productId) =>
        state.products.find((product) => product.id === productId);
    },
    filteredGroups(state) {
      if (state.productGroups.length === 0) [];
      // console.log("From getters", state.productGroups);
      return computed(
        () =>
          state.productGroups.filter(
            (group) => group.is_parent && group.parent_group === null
          ) || state.productGroups
      );
    },
    childGroups(state) {
      return (parentID) =>
        state.productGroups.filter((group) => group.parent_group === parentID);
      //   ||
      //   state.products.filter((product) => product.parent_group === parentID)
    },
    useFilteredProductsByGroups(state) {
      if (state.productGroups.length === 0) [];
      // console.log("From getters", state.productGroups);
      return (groupID) =>
        state.products.filter((product) => product.parent_group === groupID);
    },
  },
});