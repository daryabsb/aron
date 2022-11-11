<template>
  <TransitionRoot as="template" :show="open">
    <Dialog as="div" class="relative z-10" @close="open = false">
      <TransitionChild
        as="template"
        enter="ease-out duration-300"
        enter-from="opacity-0"
        enter-to="opacity-100"
        leave="ease-in duration-200"
        leave-from="opacity-100"
        leave-to="opacity-0"
      >
        <div
          class="fixed inset-0 bg-aronium-900 bg-opacity-75 transition-opacity"
        />
      </TransitionChild>

      <div class="fixed inset-0 z-10 overflow-y-auto">
        <div
          class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0"
        >
          <TransitionChild
            as="template"
            enter="ease-out duration-300"
            enter-from="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
            enter-to="opacity-100 translate-y-0 sm:scale-100"
            leave="ease-in duration-200"
            leave-from="opacity-100 translate-y-0 sm:scale-100"
            leave-to="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
          >
            <DialogPanel
              class="relative transform overflow-hidden rounded-sm border border-aronium-500 bg-aronium-800 px-4 pt-5 pb-4 text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-sm sm:p-6"
            >
              <div>
                <!-- <div
                  class="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-green-100"
                >
                  <CheckIcon
                    class="h-6 w-6 text-green-600"
                    aria-hidden="true"
                  />
                </div> -->
                <div>
                  <DialogTitle
                    as="div"
                    class="text-lg font-medium leading-6 text-gray-900 border border-aronium-500"
                  >
                    <div
                      class="p-3 text-white text-center text-3xl bg-aronium-900"
                    >
                      <span class="text-pink-500">Calcu</span>lator
                    </div>
                  </DialogTitle>
                  <div
                    class="mx-auto p-2 overflow-hidden mt-3 shadow-lg mb-2 border border-aronium-500 rounded-sm w-fit"
                  >
                    <div
                      ref="valve"
                      class="p-3 flex justify-end items-center bg-aronium-800"
                    >
                      <input
                        v-if="!current"
                        id="input-1"
                        :value="itemPrice"
                        type="text"
                        class="w-full h-full bg-transparent text-aronium-white text-center text-2xl font-bold focus:ring-0 focus:outline-0 focus:border-pink-700"
                        ref="input"
                      />
                      <input
                        v-else
                        id="input-2"
                        v-model="current"
                        type="text"
                        class="w-full h-full bg-transparent text-aronium-white text-center text-2xl font-bold focus:ring-0 focus:outline-0 focus:border-pink-700"
                        ref="input2"
                        disabled
                      />
                      <!-- {{ current || itemPrice }} -->
                    </div>

                    <NumPad
                      @append="append"
                      @sign="sign"
                      @remove="remove"
                      @percentage="percentage"
                      @add="add"
                      @minus="minus"
                      @divide="divide"
                      @multiply="multiply"
                      @clear="clear"
                      @dot="dot"
                      @equal="equal"
                    />
                  </div>
                </div>
              </div>
              <div class="mt-5 sm:mt-6">
                <button
                  type="button"
                  class="inline-flex w-full justify-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:text-sm"
                  @click="open = false"
                >
                  Go back to dashboard
                </button>
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script setup>
import { ref, nextTick, onMounted } from "vue";

import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import { CheckIcon } from "@heroicons/vue/24/outline";

import Modal from "../Modal.vue";
import NumPad from "./NumPad.vue";

const open = ref(true);
const previous = ref(null);
const itemPrice = ref((180).toString());

const valve = ref(null);
const input = ref(null);
const selectText = async () => {
  // input.value = 185;
  console.log(valve.value);
  await valve.value.focus();
  // current.value = 185;
  // input.value = 185;
  // const calcValue = document.getElementById(selectedItem.value.id);
  // if (!itemDiscountInput) return;
  // itemDiscountInput.focus();
  // itemDiscountInput.setSelectionRange(0, 3);
};
onMounted(async () => {
  // current.value = itemPrice.value;
  await nextTick();
  await input.value.focus();
  await input.value.setSelectionRange(0, itemPrice.value.length);
});

const current = ref("");
let operator = null;
const operatorClicked = ref(false);
const equalsTo = ref("");
const clear = () => {
  current.value = "";
  equalsTo.value = "";
};
const percentage = () => {
  current.value = `${parseFloat(current.value) / 100}`;
};
const sign = () => {
  current.value =
    current.value.charAt(0) === "-"
      ? current.value.slice(1)
      : `-${current.value}`;
};
const remove = () => {
  current.value = current.value.slice(0, -1);
};
const append = (number) => {
  if (operatorClicked.value) {
    current.value = "";
    operatorClicked.value = false;
  }
  current.value = `${current.value}${number}`;
};
const dot = () => {
  if (current.value.indexOf(".") === -1) {
    append(".");
  }
};
const setPrevious = () => {
  previous.value = current.value;
  operatorClicked.value = true;
};
const divide = () => {
  operator = (a, b) => a / b;
  setPrevious();
};
const multiply = () => {
  operator = (a, b) => a * b;
  setPrevious();
};
const minus = () => {
  operator = (a, b) => a - b;
  setPrevious();
};
const add = () => {
  operator = (a, b) => a + b;
  setPrevious();
};
const equal = () => {
  current.value = `${operator(
    parseFloat(previous.value),
    parseFloat(current.value)
  )}`;
  equalsTo.value = current.value;
  previous.value = null;
};
</script>
