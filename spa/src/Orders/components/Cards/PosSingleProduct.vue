<template>
  <div role="button" :title="product.name">
    <div
      class="h-48 border border-aronium-500 py-2 px-2 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75"
    >
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
                <span class="truncate">
                  {{ product.name }}
                </span>
              </a>
            </h3>
            <p class="mt-1 text-sm">{{ product.color }}</p>
          </div>
          <div class="relative">
            <p class="text-sm font-medium">
              {{ priceFormat(product.price) }}
            </p>
            <p
              v-if="product.stock_quantity"
              class="m-2 text-sm text-aronium-green"
            >
              {{ product.stock_quantity }}
            </p>
            <p v-else class="m-2 text-sm text-aronium-danger">
              Out of Stock
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from "vue";
import { priceFormat } from "@/store/composables";

defineProps({
  product: {
    type: Object,
    required: true,
  },
});
</script>
