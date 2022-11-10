<template>
  <div>
    <div class="flex justify-start items-stretch h-16 my-3">
      <div
        v-for="number in [7, 8, 9]"
        :key="number"
        class="flex-1 px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('append', `${number}`)"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-lg border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          {{ number }}
        </button>
      </div>

      <div
        class="flex-1 px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('remove')"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          <BackspaceIcon class="h-8 w-8 text-aronium-danger" />
        </button>
      </div>
    </div>

    <div class="flex items-stretch h-16 my-3">
      <div
        v-for="number in [4, 5, 6]"
        :key="number"
        class="flex-1 px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('append', `${number}`)"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          {{ number }}
        </button>
      </div>
      <div
        class="flex-1 px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('sign')"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          +/-
        </button>
      </div>
    </div>

    <div class="flex items-stretch h-16 my-3">
      <div
        v-for="number in [1, 2, 3]"
        :key="number"
        class="flex-1 px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('append', `${number}`)"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          {{ number }}
        </button>
      </div>

      <div
        class="flex-1 px-2 py-2 -mt-2 justify-center flex items-start text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('add')"
          class="rounded-sm h-36 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          <CheckIcon class="h-8 w-8 text-aronium-green" />
        </button>
      </div>
    </div>

    <div class="flex h-16 my-2 mb-4">
      <div
        class="px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('clear')"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          C
        </button>
      </div>

      <div
        class="px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('append', '0')"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          0
        </button>
      </div>

      <div
        class="px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('dot')"
          class="rounded-sm h-16 w-16 flex items-center bg-aronium-800 justify-center shadow-md border border-aronium-500 hover:border-2 hover:border-aronium-400 focus:outline-none"
        >
          .
        </button>
      </div>

      <!-- <div
        class="flex-1 px-2 py-2 justify-center flex items-center text-white text-2xl font-semibold"
      >
        <button
          @click="$emit('equal')"
          class="rounded-sm h-16 w-16 flex items-center bg-orange-500 justify-center shadow-xl border-2 border-orange-600 hover:border-2 hover:border-gray-500 focus:outline-none"
        >
          =
        </button>
      </div> -->
    </div>
  </div>
</template>

<script setup>
import { onMounted, defineEmits } from "vue";
import { useKeyboard } from "@/composables/useKeyboard";
import {
  DIGITS,
  OPERATORS,
  RESULT_KEYS,
  CLEAR_KEYS,
  ERASE_KEYS,
} from "@/store/constants";
import { CheckIcon, BackspaceIcon } from "@heroicons/vue/24/outline";

const emit = defineEmits([
  "append",
  "sign",
  "remove",
  "percentage",
  "add",
  "minus",
  "divide",
  "multiply",
  "clear",
  "dot",
  "equal",
]);
const keyboard = useKeyboard();
const addDigit = (number) => emit("append",`${number}`);
const eraseLast = () => emit("remove")
const clear = ()=> emit("clear")
onMounted(() => {
  keyboard.addListener((e) => {
    const key = e.key === "," ? "." : e.key;

    if (DIGITS.includes(key)) addDigit(key);
    // if (OPERATORS.includes(key)) calculate.addOperator(key);
    // if (RESULT_KEYS.includes(key)) calculate.calculateResult();
    if (ERASE_KEYS.includes(key)) eraseLast();
    if (CLEAR_KEYS.includes(key)) clear();
  });
});
</script>
