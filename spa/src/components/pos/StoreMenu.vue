<script>
import { ref } from "vue";
import useFilteredProducts from "@/composables/useFilteredProducts";
import {
  updateKeyword,
  filteredProducts,
  priceFormat,
  addToCart,
  tabProducts,
} from "@/store/composables";

/* COMPONENTS */
// import ProductsGroupTabs from "@/components/pos/ProductsGroupTabs.vue";
import PinkTabs from "@/components/pos/PinkTabs.vue";
import PosProductList from "@/components/pos/products/PosProductList.vue";
// import StoreProductWidget from "@/components/pos/products/StoreProductWidget.vue";

export default {
  components: {
    // ProductsGroupTabs,
    PosProductList,
    PinkTabs,
    // StoreProductWidget,
  },
  setup() {
    const keyword = ref("");

    return {
      addToCart,
      updateKeyword,
      filteredProducts,
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
  <div class="flex flex-col">
    <!-- SEARCH INPUT IN STORE -->
    <div class="overflow-y-hidden">
      <div
        v-if="useFilteredProducts() != undefined"
        class="overflow-y-auto px-2"
      >
        <!-- CATEGORY TABS START -->
        <!-- <products-group-tabs></products-group-tabs> -->

        <pink-tabs>Darya </pink-tabs>
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
