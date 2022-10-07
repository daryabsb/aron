<template>
  <div role="button" :title="product.name" @click="addToCart(product)">
    <div
      class="h-48 border border-aronium-700 py-2 px-2 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75"
    >
      <!-- class="h-48 aspect-w-1 border aspect-h-1 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75 lg:aspect-none" -->
      <div class="w-full h-32 border-b border-aronium-600">
        <img
          :src="product.image"
          :alt="product.name"
          class="h-full w-full object-contain object-center lg:h-full lg:w-full"
        />
        <div class="mt-2 flex justify-between">
          <div>
            <h3 class="text-sm">
              <a href="#">
                <span aria-hidden="true" class="absolute inset-0" />
                {{ product.name }}
              </a>
            </h3>
            <p class="mt-1 text-sm">{{ product.color }}</p>
          </div>
          <p class="text-sm font-medium">
            {{ priceFormat(product.price) }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { addToCart, priceFormat } from "@/store/composables";
export default {
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
  setup() {
    return {
      priceFormat,
      addToCart,
    };
  },
};
</script>
