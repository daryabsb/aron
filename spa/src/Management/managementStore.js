import { defineStore } from "pinia";
import productsAPI from "@/services/productsAPI"
import getProducts from "@/stores/api/getProducts";
import getProductGroups from "@/stores/api/getProductGroups";


export const useManagementStore = defineStore("management", {
    state() {
        return {
            products: [],
            productGroups: [],
            stocks: []
        };
    },
    getters: {},
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
        },
    },
})