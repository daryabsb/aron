<template>
  <!-- <div class="h-full flex flex-col mt-6" :class="show ? 'hidden' : 'block'"> -->
  <div class="h-full flex flex-col">
    <div class="flex items-start my-1 bg-inherit h-12">
      <div class="grid grid-cols-3 grid-rows-4 w-72 h-56">
        <div
          v-for="n in 12"
          :key="n"
          class="w-full h-full flex justify-center border border-aronium-500 cursor-pointer"
        >
          <div
            v-if="n == 10 && onReset"
            class="select-none w-full h-full flex items-center justify-center shadow-lg focus:outline-none"
          >
            <div class="text-lg font-semibold">
              <strong class="text-lg">,</strong>
            </div>
          </div>
          <div
            v-if="n != 10 && n != 12"
            class="select-none w-full h-full flex items-center justify-center shadow-lg focus:outline-none"
            :ripple="true"
            @click="onInput(n)"
          >
            <div v-if="n < 10" class="text-lg font-semibold">
              {{ n }}
            </div>
            <div v-if="n === 11" class="text-lg font-semibold" :value="0">
              0
            </div>
          </div>
          <div
            v-if="n == 12 && onDelete"
            class="select-none w-full h-full p-8 flex items-center justify-center shadow-lg focus:outline-none"
          >
            <div v-if="n == 12" class="text-lg font-semibold">
              <strong class="text-lg">.</strong>
            </div>
          </div>
        </div>
      </div>
      <div class="grid grid-rows-4 w-24 h-56 border border-aronium-500">
        <div
          class="flex justify-center items-center cursor-pointer select-none text-xl h-full w-full border border-aronium-500"
          @click="onDelete(n)"
        >
          <i class="fa fa-delete-left"></i>
        </div>
        <div
          class="flex justify-center items-center cursor-pointer select-none text-xl h-full w-full border border-aronium-500"
          @click="onReset"
        >
          <i class="fa fa-c"></i>
        </div>
        <div
          class="flex justify-center items-center cursor-pointer select-none text-3xl row-span-2 h-full w-full border border-aronium-500"
        >
          <i class="fa fa-arrow-turn-down"></i>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "NumericKeypad",
  props: {
    keypadClass: { type: String, default: "keypad-class", required: false },
    show: { type: Boolean, default: true, required: false },
    close: { type: String, default: "Close", required: false },
    onInput: { type: Function, required: true },
    onDelete: {
      type: Function,
      required: false,
      default: () => 1,
    },
    onReset: { type: Function, required: false, default: () => 1 },
  },
};
</script>
