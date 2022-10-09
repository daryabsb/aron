<template>
  <div class="relative bg-white mb-12 h-full">
    <div class="mx-auto px-1 sm:px-6">
      <div class="pb-3">
        <ul class="flex items-center text-xs py-2 text-gray-700">
          <li
            v-for="item in productsMenu"
            :key="item.title"
            class="flex grow flex-col items-center px-5 my-1 font-normal uppercase hover:text-pink-700 cursor-pointer"
          >
            <span class="mb-2"
              ><i :class="item.icon" aria-hidden="true"></i
            ></span>
            <span class="text-center">{{ item.title }}</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { productsMenu } from "@/composables/staticData";
export default {
  setup() {
    return { productsMenu };
  },
};
</script>
