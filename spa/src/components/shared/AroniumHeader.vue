<template>
  <div
    class="text-white border border-zinc-900 drop-shadow-lg shadow-zinc-900 bg-zinc-700 py-3"
  >
    <ul class="flex items-center text-xs">
      <li
        v-for="item in productsMenu"
        :key="item.id"
        class="flex grow flex-col items-center px-5 my-1 font-normal uppercase hover:text-pink-700 cursor-pointer"
        @click="broadcastFunction(item)"
      >
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
  setup(props, { emit }) {
    const broadcastFunction = (item, data = {}) => {
      // console.log(productsMenu);
      const itemIndex = productsMenu.findIndex((itm) => itm.id === item.id);
      item.submit(item.title, data);
      emit("open", item.title);
    };

    return { productsMenu, broadcastFunction };
  },
};
</script>
