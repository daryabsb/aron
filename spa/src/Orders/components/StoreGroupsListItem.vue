<template>
  <li
    role="button"
    class="col-span-1 flex flex-col divide-y divide-aronium-500 rounded-sm bg-aronium-700 border border-aronium-500 text-center shadow"
  >
    <div class="flex flex-1 flex-col p-4">
      <img
        v-if="item.image"
        class="mx-auto h-32 w-32 flex-shrink-0 rounded-sm"
        :src="item.image"
        alt=""
      />
      <img
        v-else
        class="mx-auto h-32 w-32 flex-shrink-0 rounded-sm"
        src="http://127.0.0.1:8000/media/uploads/product/product.jpg"
        alt=""
      />

      <h3 class="mt-4 text-sm font-medium text-aronium-white">
        {{ item.name }}
      </h3>
      <dl class="mt-1 flex flex-grow flex-col justify-between">
        <dt class="sr-only">Title</dt>
        <dd class="text-sm text-gray-500">
          {{ item.price ? `${item.price}  IQD` : "" }}
        </dd>
      </dl>
    </div>
    <div>
      <div
        v-if="item.is_product"
        class="-mt-px flex divide-x divide-aronium-500"
      >
        <div
          class="flex w-0 flex-1 text-aronium-white hover:text-pink-700"
          @click="$emit('addToCart', item)"
        >
          <a
            href="#"
            class="relative -mr-px inline-flex w-0 flex-1 items-center justify-center rounded-bl-sm border border-transparent py-2 text-sm font-medium"
          >
            <ArrowLeftIcon class="h-5 w-5" aria-hidden="true" />
            <span class="ml-3">Add to Cart</span>
          </a>
        </div>
      </div>
      <div v-else class="-mt-px flex divide-x divide-aronium-500">
        <div
          class="flex w-0 flex-1 text-aronium-white hover:text-pink-700"
          @click="$emit('back', item.id)"
        >
          <a
            href="#"
            class="relative -mr-px inline-flex w-0 flex-1 items-center justify-center rounded-bl-sm border border-transparent py-2 text-sm font-medium"
          >
            <ArrowLeftIcon class="h-5 w-5" aria-hidden="true" />
            <span class="ml-3">Back</span>
          </a>
        </div>
        <div
          class="-ml-px flex w-0 flex-1 text-aronium-white hover:text-pink-700"
          @click="$emit('selectItem')"
        >
          <a
            href="#"
            class="relative inline-flex w-0 flex-1 items-center justify-center rounded-br-sm border border-transparent py-2 text-sm font-medium"
          >
            <span class="mr-3">Expand</span>
            <ArrowRightIcon class="h-5 w-5" aria-hidden="true" />
          </a>
        </div>
      </div>
    </div>
  </li>
</template>

<script setup>
import { ref, computed, defineProps, defineEmits } from "vue";

import { ArrowLeftIcon, ArrowRightIcon } from "@heroicons/vue/20/solid";

defineEmits(["back", "addToCart", "selectItem"]);
defineProps({ item: { type: Object, required: true } });

// const close = () => (isNumpadOpen.value = false);
</script>
