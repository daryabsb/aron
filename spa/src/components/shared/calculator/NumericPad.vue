<template>
  <Grid
    rows="4"
    cols="4"
    gap="2"
    class="h-full w-full text-aronium-white sm:my-4 p-2 pt-2 sm:rounded-sm bg-inherit border border-aronium-500"
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
    <Button variant="transRed" @click="clear">Clr</Button>

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
import Modal from "@/components/shared/Modal.vue";
import useCalculate from "@/services/useCalculate";
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
  components: { Button, Screen, Grid, Modal },

  emits: ["getValue", "close"],
  setup: (props, context) => {
    // const calculate = useCalculate();
    const keyboard = useKeyboard();

    const memory = ref("");
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

    // const isOperator = useCalculate.isOperator;
    // const lastCharIsOperator = useCalculate.lastCharIsOperator;
    // const isDigit = useCalculate.isDigit;

    function isOperator(string) {
      return OPERATORS.includes(string);
    }
    function lastCharIsOperator(string) {
      const stringNormalized = string.replace(/\s/g, "");
      return isOperator(stringNormalized[stringNormalized.length - 1]);
    }
    function isDigit(string) {
      return DIGITS.includes(string);
    }

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
      context.emit("getValue", memory);
    };

    const calculateResult = () => {
      context.emit("close");
      // clear();
    };

    const eraseLast = () => {
      if (!memory.value.length) return;

      memory.value = memory.value.slice(0, memory.value.length - 1);
      context.emit("getValue", memory);
      clearOnNextDigit.value = false;
    };

    const closePanel = () => context.emit("close");

    const clear = () => {
      memory.value = "";
      error.value = false;
      context.emit("getValue", memory);
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
      closePanel,
    };
  },
};
</script>
