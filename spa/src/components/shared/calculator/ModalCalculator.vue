<template>
  <modal>
    <template #modal-content>
      <div class="relative flex items-center justify-center">
        <div class="w-screen h-screen bg-aronium-800 bg-opacity-50">
          <div
            class="w-fit h-fit mx-auto my-52 overflow-hidden z-10 shadow-lg shadow-transparent bg-aronium-800 border"
          >
            {{ type }}
            <Grid
              rows="4"
              cols="6"
              gap="2"
              class="h-full w-full sm:my-4 p-3 pt-8 sm:rounded-sm bg-inherit border border-aronium-500"
            >
              <!-- class="shadow-2xl w-full sm:max-w-md sm:h-auto sm:my-3 p-3 pt-12 sm:rounded-sm bg-inherit border border-aronium-500" -->
              <Screen
                :header="type"
                :text="memory"
                :error="error"
                class="col-span-6"
              />

              <!-- <Button variant="transRed" class="col-span-2" @click="clear">Clear</Button> -->
              <Button variant="transRed" @click="clear">Clear</Button>
              <Button variant="transGreen" @click="addOperator('-')">-</Button>
              <Button variant="transGreen" @click="addOperator('*')">*</Button>
              <Button
                v-for="number in ['7', '8', '9']"
                :key="number"
                variant="transparent"
                @click="addDigit(number)"
              >
                {{ number }}
              </Button>

              <Button variant="transYellow" @click="eraseLast">Del</Button>
              <Button variant="transGreen" @click="addOperator('+')">+</Button>
              <Button variant="transparent" @click="addDigit('.')">.</Button>
              <Button
                v-for="number in ['4', '5', '6']"
                :key="number"
                variant="transparent"
                @click="addDigit(number)"
              >
                {{ number }}
              </Button>

              <Button variant="transGreen" @click="submitResult">=</Button>
              <Button variant="transGreen" @click="addOperator('/')">/</Button>
              <Button variant="transparent" @click="addDigit('0')">0</Button>
              <Button
                v-for="number in ['3', '2', '1'].reverse()"
                :key="number"
                variant="transparent"
                @click="addDigit(number)"
              >
                {{ number }}
              </Button>
            </Grid>
            <!-- End calculator -->
          </div>
        </div>
      </div>
    </template>
  </modal>
</template>
<script>
import { onBeforeUnmount, onMounted } from "vue";
import { useCalculate } from "@/composables/useCalculate";
import { useKeyboard } from "@/composables/useKeyboard";
import Button from "@/components/shared/Button.vue";
import Screen from "@/components/shared/calculator/Screen.vue";
import Grid from "@/components/shared/Grid.vue";
import {
  DIGITS,
  OPERATORS,
  RESULT_KEYS,
  CLEAR_KEYS,
  ERASE_KEYS,
} from "@/store/constants";
import Modal from "@/components/shared/Modal.vue";
// import ModalSmall from "@/components/shared/ModalSmall.vue";
export default {
  components: { Modal, Button, Screen, Grid },
  props: {
    type: { type: String, required: true },
  },
  emits: ["close"],
  setup(props, context) {
    const calculate = useCalculate();
    const submitResult = () => {
      context.emit("close", calculate.memory.value);
      calculate.calculateResult();
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

    return { submitResult, ...calculate };
  },
};
</script>
