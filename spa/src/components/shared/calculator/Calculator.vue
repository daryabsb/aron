<template>
  <Grid
    rows="6"
    cols="4"
    gap="2"
    class="shadow-2xl w-full sm:max-w-md sm:h-auto sm:my-3 p-3 pt-12 sm:rounded-sm bg-inherit border border-aronium-500"
  >
    <Screen :text="memory" :error="error" class="col-span-4" />

    <Button variant="transRed" class="col-span-2" @click="clear">Clear</Button>
    <Button variant="transYellow" @click="eraseLast">Del</Button>
    <Button variant="transGreen" @click="addOperator('/')">/</Button>

    <Button
      v-for="number in ['7', '8', '9']"
      :key="number"
      variant="transparent"
      @click="addDigit(number)"
    >
      {{ number }}
    </Button>
    <Button variant="transGreen" @click="addOperator('*')">*</Button>

    <Button
      v-for="number in ['4', '5', '6']"
      :key="number"
      variant="transparent"
      @click="addDigit(number)"
    >
      {{ number }}
    </Button>
    <Button variant="transGreen" @click="addOperator('-')">-</Button>

    <Button
      v-for="number in ['1', '2', '3']"
      :key="number"
      variant="transparent"
      @click="addDigit(number)"
    >
      {{ number }}
    </Button>
    <Button variant="transGreen" @click="addOperator('+')">+</Button>

    <Button variant="transparent" class="col-span-2" @click="addDigit('0')"
      >0</Button
    >
    <Button variant="transparent" @click="addDigit('.')">.</Button>
    <Button variant="transGreen" @click="calculateResult">=</Button>
  </Grid>
</template>

<script>
import { onBeforeUnmount, onMounted } from "vue";
import { useCalculate } from "@/composables/useCalculate";
import { useKeyboard } from "@/composables/useKeyboard";
import Button from "./Button.vue";
import Screen from "./Screen.vue";
import Grid from "./Grid.vue";
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

  setup: () => {
    const calculate = useCalculate();
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

    return { ...calculate };
  },
};
</script>
