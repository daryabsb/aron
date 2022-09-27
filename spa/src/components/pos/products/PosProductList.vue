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
  <div class="bg-white">
    <div
      class="mt-3 grid grid-cols-1 gap-y-5 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8"
    >
      <div v-for="product in products" :key="product.id" class="group relative">
        <pos-single-product :product="product"></pos-single-product>
      </div>
    </div>
  </div>
</template>

<script>
import PosSingleProduct from "@/components/pos/products/PosSingleProduct.vue";
export default {
  components: { PosSingleProduct },
  props: {
    products: {
      type: Object,
      required: true,
    },
  },
};
</script>
