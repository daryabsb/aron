<script>
import { ref } from "vue";
import { useStore } from "vuex";
import useFilteredProducts from "@/composables/useFilteredProducts";
import {
  updateKeyword,
  priceFormat,
  addToCart,
  tabProducts,
} from "@/store/composables";

/* COMPONENTS */
import ProductsGroupTabs from "@/components/pos/ProductsGroupTabs.vue";
import PinkTabs from "@/components/pos/PinkTabs.vue";
import StoreProductWidget from "@/components/pos/products/StoreProductWidget.vue";
import SearchInput from "@/components/shared/SearchInput.vue";

export default {
  components: { SearchInput, ProductsGroupTabs, PinkTabs, StoreProductWidget },
  setup() {
    const store = useStore();

    const keyword = ref("");

    return {
      addToCart,
      updateKeyword,
      useFilteredProducts,
      keyword,
      priceFormat,
      tabProducts,
    };
  },
};
</script>
<template>
  <!-- store menu -->
  <div class="flex flex-col bg-blue-gray-50 h-full w-full py-4">
    <!-- SEARCH INPUT IN STORE -->
    <search-input></search-input>
    <div class="h-full overflow-hidden mt-4">
      <div class="h-full overflow-y-auto px-2">
        <!-- CATEGORY TABS START -->
        <!-- <products-group-tabs></products-group-tabs> -->
        <div
          v-if="useFilteredProducts().length === 0"
          class="select-none bg-blue-gray-100 rounded-3xl flex flex-wrap content-center justify-center h-full opacity-25"
        >
          <div class="w-full text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-24 w-24 inline-block"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"
              />
            </svg>
            <p class="text-xl">
              YOU DON'T HAVE
              <br />
              ANY PRODUCTS TO SHOW
            </p>
          </div>
        </div>
        <div
          v-if="useFilteredProducts().length === 0 && keyword.length > 0"
          class="select-none bg-blue-gray-100 rounded-3xl flex flex-wrap content-center justify-center h-full opacity-25"
        >
          <div class="w-full text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-24 w-24 inline-block"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
            <p class="text-xl">
              EMPTY SEARCH RESULT
              <br />
              "<span class="font-semibold">{{ keyword }}</span
              >"
            </p>
          </div>
        </div>
        <pink-tabs v-slot="{ productGroups, openTab }">
          <div class="tab-content tab-space">
            <div
              v-for="content in productGroups"
              :key="content.id"
              :class="{
                hidden: openTab !== content.id,
                block: openTab === content.id,
              }"
            >
              <div class="grid lg:grid-cols-6 md:grid-cols-4 gap-4 pb-3">
                <template v-for="product in tabProducts" :key="product.id">
                  <store-product-widget :item="product"></store-product-widget>
                </template>
              </div>
            </div>
          </div>
        </pink-tabs>
        <!-- CATEGORY TABS END -->

        <!-- <div class="grid grid-cols-4 gap-4 pb-3">
          <template v-for="product in tabProducts" :key="product.id">
            <store-product-widget :item="product" />
          </template>
        </div> -->
      </div>
    </div>
  </div>
  <!-- end of store menu -->
</template>
