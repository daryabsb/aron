<template>
  <div
    role="button"
    class="select-none cursor-pointer transition-shadow overflow-hidden border-2 border-solid border-blue-gray-100 rounded-2xl bg-aronium-900 shadow-lg hover:shadow-lg"
    :title="item.name"
    @click="addToCart(item)"
  >
    <div class="w-full overflow-hidden">
      <img :src="item.image" class="pb-3 object-fit" :alt="item.name" />
    </div>
    <div class="flex p-3 text-sm mt-3">
      <p class="flex-grow truncate mr-1">{{ item.name }}</p>
      <p class="nowrap font-semibold">
        {{ priceFormat(item.price) }}
      </p>
    </div>
  </div>
</template>
<script>
import { addToCart, priceFormat } from "@/store/composables";
export default {
  props: {
    item: {
      type: Object,
      required: true,
    },
  },
  setup() {
    return {
      addToCart,
      priceFormat,
    };
  },
};
</script>
