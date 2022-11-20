<template>
  <TransitionRoot as="template" :show="true">
    <Dialog as="div" class="relative z-10" @close="$emit('close')">
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
          class="fixed inset-0 bg-aronium-900 bg-opacity-90 transition-opacity"
        />
      </TransitionChild>
      <div class="fixed inset-0 z-10 overflow-y-auto">
        <div
          class="flex min-h-full items-end justify-center p-2 text-center sm:items-center sm:p-0"
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
              class="relative sm:max-w-full transform overflow-hidden rounded-sm bg-aronium-800 border border-aronium-500 text-left shadow-xl transition-all"
            >
              <div>
                <slot name="icon"></slot>

                <div class="text-center">
                  <DialogTitle as="h3">
                    <slot name="title"></slot>
                  </DialogTitle>
                  <div class="min-h-[40rem]">
                    <div
                      class="h-full py-12 flex items-center text-aronium-white bg-aronium-900"
                    >
                      <!-- ITEMS AT PAYMENT MODAL -->
                      <div class="flex border border-aronium-500">
                        <div
                          v-if="isShowItems"
                          class="inset-0 h-full text-center bg-transparent text-aronium-white"
                        >
                          <!-- <div class="w-full h-full bg-aronium-700 border-r border-aronium-500"> -->
                          <div
                            class="h-16 w-full text-left bg-aronium-900 p-2 border-b border-r border-aronium-500"
                          >
                            <h1 class="text-2xl font-light tracking-wider">
                              Items
                            </h1>
                          </div>
                          <div
                            class="w-full h-full bg-aronium-700 text-left p-3"
                          >
                            <!-- ITEMS HERE -->

                            <Suspense>
                              <div
                                v-for="item in useActiveOrder.items"
                                :key="item.id"
                                class="w-0 sm:w-72"
                              >
                                <orders-item
                                  :orderitem="item"
                                  :is-payment="true"
                                  @click="selectItem(item)"
                                >
                                </orders-item>
                                <!-- :is-payment="true" -->
                              </div>
                              <template #fallback>
                                Loading...
                              </template>
                            </Suspense>
                            <!-- ITEMS END -->
                          </div>
                          <!-- </div> -->
                        </div>

                        <div
                          class="text-center bg-transparent text-aronium-white"
                          :class="isShowItems ? 'w-4/5' : 'w-full'"
                        >
                          <div
                            class="h-16 w-full flex justify-between text-left bg-aronium-900 p-2 border-b border-aronium-500"
                          >
                            <h1 class="text-2xl">Actions</h1>
                            <span @click="showItems">
                              <i
                                :class="
                                  isShowItems ? 'fa fa-times' : 'fa fa-circle'
                                "
                              ></i>
                            </span>
                          </div>
                          <div
                            class="flex flex-col justify-start w-full h-full bg-aronium-700 border-b border-r border-aronium-500 text-left p-3"
                          >
                            <div
                              class="flex justify-center text-2xl w-full text-aronium-danger mb-6"
                            >
                              Change:
                              <span class="font-semibold text-aronium-green"
                                >{{ change }} IQD</span
                              >
                            </div>
                            <div
                              class="w-full my-6 text-4xl text-aronium-white font-light text-center"
                            >
                              <h1>How would the customer like the receipt?</h1>
                            </div>
                            <div
                              class="flex items-center justify-between w-full h-12 bg-inherit"
                            >
                              <div
                                class="flex flex-wrap items-center h-full w-full gap-2"
                              >
                                <Button
                                  variant="transparent"
                                  class="grow flex flex-col py-14 items-center justify-center w-1/4 mx-1"
                                >
                                  <i class="fa fa-receipt text-2xl mb-3"></i>
                                  Print receipt
                                </Button>
                                <Button
                                  variant="transparent"
                                  class="grow flex flex-col py-14 items-center justify-center w-1/4 mx-1"
                                  @click="printAndProceed()"
                                >
                                  <i class="fa fa-print text-2xl mb-3"></i>
                                  Print invoice</Button
                                >
                                <Button
                                  variant="transparent"
                                  class="grow flex flex-col py-14 items-center justify-center w-1/4 mx-1"
                                >
                                  <i class="fa fa-at text-2xl mb-3"></i>
                                  Send email</Button
                                >
                                <Button
                                  variant="transparent"
                                  class="w-1/3 flex flex-col py-14 items-center justify-center mt-10"
                                >
                                  <i class="fa fa-file-pdf text-2xl mb-3"></i>
                                  Save as PDF
                                </Button>
                              </div>
                            </div>
                            <div class="flex justify-between mt-auto">
                              <toggle-input
                                label="Don't show again"
                                target="skipPaymentModal"
                              ></toggle-input>
                              <Button variant="green" @click="$emit('close')"
                                >Done</Button
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>
<script setup>
import { ref, toRefs, defineEmits, defineAsyncComponent } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
import Button from "@/components/shared/Button.vue";
import ToggleInput from "@/components/shared/forms/ToggleInput.vue";

import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
const {
  cart,
  cash,
  change,
  addCash,
  moneys,
  clear,
  receiptNo,
  priceFormat,
  addQty,
  submitable,
  submit,
  useActiveOrder,
  totalPrice,
  subTotalBeforeDiscount,
} = toRefs(useOrderStore());

const emit = defineEmits(["close"]);

// Numeric pad
const number = ref("");
const maxLength = ref(6);
const showKeypad = ref(true);
const onInput = (key) => {
  const myKeys = {
    10: parseInt(","),
    11: 0,
    12: parseInt("."),
  };
  key = myKeys[key] || key;
  if (key === 11) key = 0;
  // number.value = (number.value + key).slice(0, maxLength.value);
  number.value = (number.value + key).slice(0, maxLength.value);
};
const onDelete = () => {
  number.value = number.value.slice(0, number.value.length - 1);
};
const onReset = () => {
  number.value = "";
};
const OrdersItem = defineAsyncComponent(() =>
  import("@/Orders/components/OrdersItem.vue")
);

// const cart = useCart;
// const cash = useCash;
// const change = useChange;
const isShowItems = ref(true);
// const moneys = useMoneys;
const inputMoney = ref(0);

const cashValue = ref(0);
// const cashValue = computed(() => parseInt(number.value) + inputMoney.value);

const addCashValue = (value) => {
  cashValue.value = value;
  addCash(value);
};

const showItems = () => (isShowItems.value = !isShowItems.value);

const printAndProceed = () => {
  const receiptContent = document.getElementById("receipt-print-content");

  const titleBefore = document.title;
  const printArea = document.getElementById("print-area");

  printArea.innerHTML = receiptContent.innerHTML + printArea.innerHTML;
  document.title = receiptNo;

  window.print();
  // window.print(printArea.innerHTML);
  // isShowModalReceipt();

  printArea.innerHTML = "";
  document.title = titleBefore;

  // TODO save sale data to database

  emit("close");
  clear();
};
</script>
