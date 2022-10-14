<template>
  <div class="flex flex-col mt-6">
    <div
      v-for="n in 12"
      :key="n"
      class="flex items-stretch my-1 bg-inherit h-12"
    >
      <div
        class="p-1 py-2 justify-center flex items-center text-white text-lg font-normal"
      >
        <div
          v-if="n == 10 && onReset"
          @click="onReset"
          class="h-12 w-16 flex items-center bg-aronium-800 justify-center shadow-lg border border-aronium-500 hover:border hover:border-gray-500 focus:outline-none"
        >
          &copy;
        </div>
        <div
          v-if="n != 10 && n != 12"
          class="h-12 w-16 flex items-center bg-aronium-800 justify-center shadow-lg border border-aronium-500 hover:border hover:border-gray-500 focus:outline-none"
          @click="onInput(n)"
        >
          {{ n.toString() }}
        </div>
      </div>
      <div
        v-if="item.hasIcon"
        class="p-1 py-2 justify-center flex items-center text-white text-lg font-normal"
      >
        <div
          class="h-12 w-16 flex items-center bg-aronium-800 justify-center shadow-lg border border-aronium-700 hover:border hover:border-gray-500 focus:outline-none"
        >
          <i :class="item.icon"></i>
        </div>
      </div>
    </div>
    <div class="flex items-stretch my-1 mb-4 bg-aronium-900 h-12">
      <div
        class="py-1 px-1 justify-start flex items-center text-white text-lg font-normal"
      >
        <div
          class="h-12 w-[8.6rem] flex items-center bg-aronium-800 justify-center shadow-lg border border-aronium-700 hover:border hover:border-gray-500 focus:outline-none"
        >
          0
        </div>
      </div>
      <div
        class="py-1 px-1 justify-start flex items-center text-white text-lg font-normal"
      >
        <div
          class="h-12 w-16 flex items-center bg-aronium-800 justify-center shadow-lg border border-aronium-700 hover:border hover:border-gray-500 focus:outline-none"
        >
          .
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { reactive, ref } from "vue";
export default {
  setup() {
    const calculator = reactive([
      {
        row: [1, 2, 3],
        hasIcon: true,
        icon: "fa-sharp fa-solid fa-delete-left",
      },
      {
        row: [4, 5, 6],
        hasIcon: true,
        icon: "esc",
      },
      {
        row: [7, 8, 9],
        hasIcon: true,
        icon: "fa-solid fa-arrow-turn-down-left",
      },
    ]);

    return {
      calculator,
    };
  },
};
</script>
