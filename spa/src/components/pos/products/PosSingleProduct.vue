<template>
  <div role="button" :title="product.name" @click="addToCart(product)">
    <div
      class="min-h-80 aspect-w-1 border aspect-h-1 w-full overflow-hidden rounded-md bg-gray-200 group-hover:opacity-75 lg:aspect-none lg:h-80"
    >
      <img
        :src="product.image"
        :alt="product.name"
        class="h-full w-full object-cover object-center lg:h-full lg:w-full"
      />
    </div>
    <div class="mt-4 flex justify-between">
      <div>
        <h3 class="text-sm text-gray-700">
          <a href="#">
            <span aria-hidden="true" class="absolute inset-0" />
            {{ product.name }}
          </a>
        </h3>
        <p class="mt-1 text-sm text-gray-500">{{ product.color }}</p>
      </div>
      <p class="text-sm font-medium text-gray-900">
        {{ priceFormat(product.price) }}
      </p>
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
