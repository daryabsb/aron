<!--
  This example requires Tailwind CSS v2.0+ 
  
  This example requires some changes to your config:
  
  ```
  // tailwind.config.js
  module.exports = {
    // ...
    plugins: [
      // ...
      require('@tailwindcss/aspect-ratio'),
    ],
  }
  ```
-->
<template>
  <Suspense>
    <template #default>
      <div class="p-2">
        <div class="grid gap-2 grid-cols-6" :class="gridClasses">
          <div
            v-for="product in products"
            :key="product.id"
            class="group relative"
          >
            <pos-single-product :product="product"></pos-single-product>
          </div>
        </div>
      </div>
    </template>
    <template #fallback>
      <div class="p-2">
        <div class="grid gap-2 grid-cols-6" :class="gridClasses">
          <div v-for="product in 3" :key="product" class="group relative">
            <pos-single-product-skeleton></pos-single-product-skeleton>
          </div>
        </div>
      </div>
    </template>
  </Suspense>
</template>

<script>
import { ref } from "vue";
import PosSingleProduct from "@/components/pos/products/PosSingleProduct.vue";
import PosSingleProductSkeleton from "@/components/pos/products/PosSingleProductSkeleton.vue";
export default {
  components: { PosSingleProduct, PosSingleProductSkeleton },
  props: {
    products: {
      type: Object,
      required: true,
    },
    cols: {
      type: String,
      required: false,
      default: "6",
    },
    rows: {
      type: String,
      required: false,
      default: "6",
    },
  },
  setup(props) {
    const x = ref(props.rows);
    const y = ref(props.cols);
    const gridClasses = `grid-cols-${y.value} grid-rows-${x.value}`;

    return {
      gridClasses,
    };
  },
};
</script>
