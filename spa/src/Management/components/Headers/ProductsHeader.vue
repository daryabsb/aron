<template>
  <div class="text-aronium-white font-light bg-aronium-800">
    <ul class="flex items-center text-sm">
      <li
        v-for="item in productsMenu"
        :key="item.id"
        class="flex grow flex-col items-center px-5 font-normal mt-1 hover:text-pink-700 cursor-pointer"
        @click="item.submit($emit, item.title)"
      >
        <!-- @click="broadcastFunction(item)" -->
        <span class="mb-2"><i :class="item.icon" aria-hidden="true"></i></span>
        <span class="text-center">{{ item.title }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
import { productsMenu } from "@/composables/staticData";
export default {
  emits: ["open"],
  setup(props, context) {
    const broadcastFunction = (item) => {
      item.submit(context, item.title);
    };

    return { productsMenu, broadcastFunction, context };
  },
};
</script>
