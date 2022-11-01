<template>
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
  name: "Calculator",
  components: { Button, Screen, Grid },
  emits: ["calculatorValue"],
  setup: (props, context) => {
    const calculate = useCalculate();
    const calculateResult = () => {
      // calculate.calculateResult();
      // console.log(context);
      context.emit("calculatorValue", calculate.memory);
    };
    const keyboard = useKeyboard();

    onMounted(() => {
      keyboard.addListener((e) => {
        const key = e.key === "," ? "." : e.key;

        if (DIGITS.includes(key)) calculate.addDigit(key);
        if (OPERATORS.includes(key)) calculate.addOperator(key);
        if (RESULT_KEYS.includes(key)) calculate.calculateResult();
        if (ERASE_KEYS.includes(key)) calculate.eraseLast();
        if (CLEAR_KEYS.includes(key)) calculate.clear();
      });
    });

    onBeforeUnmount(() => {
      keyboard.removeAllListeners();
    });

    return { ...calculate, calculateResult };
  },
};
</script>
