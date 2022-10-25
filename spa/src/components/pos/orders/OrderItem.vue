<template>
  <div
    class="max-h-16 relative flex items-center space-x-3 rounded-sm border border-aronium-500 bg-aronium-700 px-6 py-2 shadow-sm focus-within:ring-2 focus-within:ring-pink-500 focus-within:ring-offset-0 hover:border-pink-500"
  >
    <div class="flex-shrink-0">
      <img class="h-10 w-10 rounded-full" :src="item.product.image" alt="" />
    </div>
    <div class="min-w-0 flex-1">
      <a href="#" class="focus:outline-none text-aronium-white">
        <span class="absolute inset-0" aria-hidden="true" />
        <p class="text-sm font-medium">{{ item.product.name }}</p>
        <p class="truncate text-sm">
          {{ item.product.price }} / {{ item.quantity * item.product.price }}
        </p>
      </a>
    </div>
    <div class="ml-4 flex flex-shrink-0 space-x-4">
      <button
        type="button"
        class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
      >
        <PlusIcon
          class="h-5 w-5 flex-shrink-0"
          fill="white"
          aria-hidden="true"
        ></PlusIcon>
      </button>
      <span class="text-aronium-white" aria-hidden="true">{{
        item.quantity
      }}</span>
      <button
        type="button"
        class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
      >
        <MinusIcon class="h-5 w-5 flex-shrink-0" aria-hidden="true"></MinusIcon>
      </button>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from "vue";
import { PaperClipIcon, PlusIcon, MinusIcon } from "@heroicons/vue/20/solid";

const props = defineProps({
  item: Object,
});
</script>
