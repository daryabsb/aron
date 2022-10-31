<template>
  <div
    class="max-h-16 relative flex items-center space-x-3 rounded-sm border border-aronium-500 bg-aronium-700 px-6 py-2 mb-1 shadow-sm focus-within:ring-2 focus-within:ring-pink-500 focus-within:ring-offset-0 hover:border-pink-500"
  >
    <div class="flex-shrink-0">
      <img
        class="h-10 w-10 rounded-full"
        :src="props.item.product.image"
        alt=""
      />
    </div>
    <div class="min-w-0 flex-1">
      <a href="#" class="focus:outline-none text-aronium-white">
        <!-- <span class="absolute inset-0" aria-hidden="true" /> -->
        <p class="text-sm font-medium">{{ props.item.product.name }}</p>
        <p class="truncate text-sm">
          {{ props.item.product.price }} /
          <span
            :class="[
              props.item.discount
                ? 'line-through text-aronium-danger'
                : 'text-aronium-white',
            ]"
          >
            {{ props.item.quantity * props.item.price }}
          </span>
          <span v-if="props.item.discount">
            {{ " " }}
            {{
              props.item.quantity * props.item.price -
              (props.item.quantity * props.item.price * props.item.discount) /
                100
            }}</span
          >
        </p>
      </a>
    </div>
    <div
      v-if="props.item.discount"
      class="p-3 h-8 w-9 rounded-full bg-aronium-danger relative"
    >
      <span class="absolute top-1 left-1 text-sm"
        >{{ props.item.discount }}%</span
      >
    </div>
    <div class="ml-4 flex flex-shrink-0 space-x-4">
      <button
        type="button"
        class="font-medium hover:text-pink-500 outline-none focus:ring-pink-500 ring-0"
        @click="addQty(item, -1)"
      >
        <MinusIcon class="h-5 w-5 flex-shrink-0" aria-hidden="true"></MinusIcon>
      </button>
      <span class="text-aronium-white" aria-hidden="true">{{
        props.item.quantity
      }}</span>
      <button
        type="button"
        class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
      >
        <PlusIcon
          class="h-5 w-5 flex-shrink-0"
          fill="white"
          aria-hidden="true"
          @click="addQty(item, 1)"
        ></PlusIcon>
      </button>
    </div>
  </div>
</template>

<script setup>
import { usePos } from "@/stores/pos";
import { defineProps } from "vue";
import { PlusIcon, MinusIcon } from "@heroicons/vue/20/solid";

const store = usePos();

const addQty = store.addQty;

const props = defineProps({
  item: Object,
});
</script>
