<template>
  {{ memory }}
  <Grid
    rows="4"
    cols="4"
    gap="2"
    class="h-full w-full sm:my-4 p-3 pt-8 sm:rounded-sm bg-inherit border border-aronium-500"
  >
    <!-- class="shadow-2xl w-full sm:max-w-md sm:h-auto sm:my-3 p-3 pt-12 sm:rounded-sm bg-inherit border border-aronium-500" -->
    <!-- <Screen :text="memory" :error="error" class="col-span-6" /> -->

    <!-- <Button variant="transRed" class="col-span-2" @click="clear">Clear</Button> -->

    <Button
      v-for="number in ['1', '2', '3']"
      :key="number"
      variant="transparent"
      @click="addDigit(number)"
    >
      {{ number }}
    </Button>
    <Button variant="transYellow" @click="eraseLast">Del</Button>

    <Button
      v-for="number in ['4', '5', '6']"
      :key="number"
      variant="transparent"
      @click="addDigit(number)"
    >
      {{ number }}
    </Button>
    <Button variant="transRed" @click="clear">Esc</Button>

    <Button
      v-for="number in ['7', '8', '9']"
      :key="number"
      variant="transparent"
      @click="addDigit(number)"
    >
      {{ number }}
    </Button>
    <Button
      variant="transparent"
      class="row-start-3 col-start-4 inset-0 col-span-1 row-span-2"
      @click="calculateResult"
      >Ent</Button
    >
    <Button variant="transparent" class="col-span-2" @click="addDigit('0')"
      >0</Button
    >
    <Button variant="transparent" @click="addDigit('.')">.</Button>
  </Grid>
</template>

<script>
import { ref } from "vue";
import { onBeforeUnmount, onMounted } from "vue";
import { useCalculate } from "@/composables/useCalculate";
import { useKeyboard } from "@/composables/useKeyboard";
import Button from "@/components/shared/Button.vue";
import Screen from "./Screen.vue";
import Grid from "@/components/shared/Grid.vue";
import {
  DIGITS,
  OPERATORS,
  RESULT_KEYS,
  CLEAR_KEYS,
  ERASE_KEYS,
} from "@/store/constants";

export default {
  name: "NumericPad",
  components: { Button, Screen, Grid },
  emits: ["calculatorValue"],
  setup: (props, context) => {
    // const calculate = useCalculate();
    const keyboard = useKeyboard();

    // const isDigit = calculate.isDigit;
    // const lastCharIsOperator = calculate.lastCharIsOperator;

    let memory = ref("");
    let error = ref(false);
    let clearOnNextDigit = ref(false);

    onMounted(() => {
      keyboard.addListener((e) => {
        const key = e.key === "," ? "." : e.key;

        if (DIGITS.includes(key)) addDigit(key);
        // if (OPERATORS.includes(key)) calculate.addOperator(key);
        if (RESULT_KEYS.includes(key)) calculateResult();
        if (ERASE_KEYS.includes(key)) eraseLast();
        if (CLEAR_KEYS.includes(key)) clear();
      });
    });

    function clear() {
      memory.value = "";
      error.value = false;
    }
    const eraseLast = () => {
      if (!memory.value.length) return;

      memory.value = memory.value.slice(0, memory.value.length - 1);
      clearOnNextDigit.value = false;
    };

    const isOperator = (string) => {
      return OPERATORS.includes(string);
    };

    const lastCharIsOperator = (string) => {
      const stringNormalized = string.replace(/\s/g, "");
      return isOperator(stringNormalized[stringNormalized.length - 1]);
    };

    const isDigit = (string) => {
      return DIGITS.includes(string);
    };

    const addDigit = (digit) => {
      if (!isDigit(digit)) {
        throw new Error("Invalid param, is not a valid digit");
      }

      const lastDigit = memory.value[memory.value.length - 1];

      if (lastDigit === "." && digit === ".") return;
      if (lastDigit === "0" && memory.value.length === 1) clear();
      if (clearOnNextDigit.value) clear();
      if ((!memory.value || lastCharIsOperator(memory.value)) && digit === ".")
        memory.value += "0";

      clearOnNextDigit.value = false;
      memory.value += `${digit}`;
    };

    const calculateResult = () => {
      // calculate.calculateResult();
      // console.log(context);
      context.emit("calculatorValue", memory);
      clear();
    };

    onBeforeUnmount(() => {
      keyboard.removeAllListeners();
    });

    return {
      memory,
      error,
      clearOnNextDigit,
      clear,
      eraseLast,
      addDigit,
      calculateResult,
    };
  },
};
</script>
