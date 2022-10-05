<template>
  <modal-small>
    <template #modal-content>
      <div class="relative h-screen w-screen flex items-center justify-center">
        <div class="h-screen w-screen absolute bg-aronium-900 opacity-70"></div>
        <div
          class="overflow-hidden z-10 mt-3 shadow-lg mb-2 bg-aronium-900 border"
        >
          <div class="flex flex-col mt-3 px-3">
            <div class="p-5 text-white text-center text-lg bg-inherit">
              <span class="text-aronium-danger">Calcu</span>lator
            </div>
            <div
              class="pt-3 px-3 pb-0 text-white text-right text-lg bg-aronium-800"
            >
              2000 + 100
            </div>
            <div class="p-2 text-white text-right text-lg bg-aronium-800">
              = <span class="text-aronium-danger">2100</span>
            </div>

            <div class="flex flex-col mt-6">
              <div
                v-for="item in calculator"
                :key="item"
                class="flex items-stretch my-1 bg-aronium-900 h-12"
              >
                <div
                  v-for="num in item.row"
                  :key="num"
                  class="p-1 py-2 justify-center flex items-center text-white text-lg font-normal"
                >
                  <div
                    class="h-12 w-16 flex items-center bg-aronium-800 justify-center shadow-lg border border-aronium-700 hover:border hover:border-gray-500 focus:outline-none"
                  >
                    {{ num.toString() }}
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
          </div>
        </div>
      </div>
    </template>
  </modal-small>
</template>
<script>
import { reactive, ref } from "vue";
import ModalSmall from "@/components/shared/ModalSmall.vue";
export default {
  components: {
    ModalSmall,
  },
  setup() {
    const openCalculator = ref(true);
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
    const value = ref(0);
    return {
      calculator,
      openCalculator,
      value,
    };
  },
};
</script>
