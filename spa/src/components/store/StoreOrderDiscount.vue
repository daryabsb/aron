<template>
  <div>
    <Modal size="md">
      <template #title>
        <div
          class="flex justify-center items-end w-full h-12 border-b border-aronium-500"
        >
          <button
            class="h-12 text-lg mx-2 px-6 border-b-2"
            :class="
              tabID === 1
                ? 'text-aronium-sky  border-aronium-sky'
                : 'text-aronium-white border-transparent'
            "
            @click="cartDiscount"
          >
            Cart discount
          </button>
          <button
            class="h-12 text-lg mx-2 px-6 border-b-2"
            :class="
              tabID === 2
                ? 'text-aronium-sky  border-aronium-sky'
                : 'text-aronium-white border-transparent'
            "
            @click="itemDiscount"
          >
            Item discount
          </button>
        </div>
      </template>
      <template #content>
        <div class="flex flex-col items-center h-2/5 w-full p-2">
          <div class="p-5">
            <img src="/media/icons/cart.svg" class="w-16" alt="cart-icon" />
          </div>
          <div
            v-if="tabID === 1"
            class="text-xl text-aronium-white font-light w-full h-full"
          >
            Applly cart discount
            <div class="flex flex-col items-center">
              <div class="flex justify-center mt-4 w-full height-16">
                <button
                  class="rounded-l-lg w-20 bg-inherit border border-aronium-500"
                  :class="
                    discountType === '%'
                      ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
                      : 'bg-inherit  border-aronium-500'
                  "
                  @click="toggleDiscountType('%')"
                >
                  %
                </button>
                <button
                  class="rounded-r-lg w-20 border"
                  :class="
                    discountType === '$'
                      ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
                      : 'bg-inherit  border-aronium-500'
                  "
                  @click="toggleDiscountType('$')"
                >
                  $
                </button>
              </div>
            </div>
            <div class="flex justify-center relative mt-6 text-xl w-full">
              <input
                v-model="cartInputValue"
                id="cart-discount-input"
                type="text"
                class="relative bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
                :class="
                  tabID === 2 && item === null
                    ? 'opacity-50 text-opacity-50 select-none'
                    : 'opacity-100'
                "
                :disabled="tabID === 2 && item === null"
              />

              <!-- @input="addCartDiscount()" -->
              <label class="absolute ml-48 mt-2">
                <span
                  class="text-aronium-white"
                  :class="
                    tabID === 2 && item === null
                      ? 'opacity-50 select-none'
                      : 'opacity-100'
                  "
                  :disabled="tabID === 2 && item === null"
                  >{{ discountType }}</span
                >
              </label>
            </div>
            <keep-alive>
              <NumericPad
                @close="submitResults"
                @calculator-value="discountValue"
              />
            </keep-alive>
          </div>

          <div
            v-if="tabID === 2 && selectedItem.id === null"
            class="text-xl font-light w-full h-full"
          >
            Please select an item to add Item discount
          </div>
          <div v-if="tabID === 2 && selectedItem.id !== null">
            <div>
              <div class="text-xl text-aronium-white font-light w-full h-full">
                This is a discount for " {{ selectedItem.product.name }} "
                <div class="flex flex-col items-center">
                  <div class="flex justify-center mt-4 w-full height-16">
                    <button
                      class="rounded-l-lg w-20 bg-inherit border border-aronium-500"
                      :class="
                        discountType === '%'
                          ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
                          : 'bg-inherit  border-aronium-500'
                      "
                      @click="toggleDiscountType('%')"
                    >
                      %
                    </button>
                    <button
                      class="rounded-r-lg w-20 border"
                      :class="
                        discountType === '$'
                          ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
                          : 'bg-inherit  border-aronium-500'
                      "
                      @click="toggleDiscountType('$')"
                    >
                      $
                    </button>
                  </div>
                </div>

                <div class="w-full flex justify-center mt-6 text-xl">
                  <input
                    :id="selectedItem.id"
                    v-model="itemInputValue"
                    type="text"
                    class="relative bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
                    :class="
                      tabID === 2 && selectedItem.id === null
                        ? 'opacity-50 text-opacity-50 select-none'
                        : 'opacity-100'
                    "
                    :disabled="tabID === 2 && selectedItem.id === null"
                    @input="addItemDiscount(id)"
                  />
                  <label class="absolute ml-48 mt-2">
                    <span
                      class="text-aronium-white"
                      :class="
                        tabID === 2 && selectedItem.id === null
                          ? 'opacity-50 select-none'
                          : 'opacity-100'
                      "
                      :disabled="tabID === 2 && selectedItem.item === null"
                      >{{ discountType }}</span
                    >
                  </label>
                </div>

                <NumericPad
                  @close="submitResults"
                  @calculator-value="discountValue"
                />
              </div>
            </div>
          </div>

          <!-- <NumericPad @calculatorValue="discountValue" /> -->
        </div>
      </template>
      <template #button>
        <button
          type="button"
          class="inline-flex leading-6 w-full justify-center rounded-sm border border-aronium-500 bg-aronium-900 px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-aronium-600 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:text-sm"
          @click="open = false"
        >
          Clear all discounts
        </button>
      </template>
    </Modal>
  </div>
</template>

<script setup>
import { ref, computed, defineProps, defineEmits, nextTick } from "vue";
import { useCalculate } from "@/composables/useCalculate";
import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import { CheckIcon } from "@heroicons/vue/24/outline";
import { usePos } from "@/stores/pos";
import NumericPad from "@/components/shared/calculator/NnumericPad.vue";

// const props = defineProps({
// id: { type: Number, default: null },
// items: { type: Object, default: null },
// });
const emit = defineEmits(["close"]);

import StoreOrderTopButtons from "@/components/store/StoreOrderTopButtons.vue";
import Modal from "@/components/shared/Modal.vue";
// const OrderItem = defineAsyncComponent(() =>
//   import("@/components/store/orders/OrderItem.vue")
// );
const store = usePos();
const priceFormat = store.priceFormat;
const getTotalPrice = store.totalPrice;
const activeNumber = ref(store.activeNumber);
const useActiveOrder = ref(store.useActiveOrder);

const selectedItem = computed(() =>
  useActiveOrder.value.items.find((item) => item.isActive)
);
// const tabID = ref(1);
const tabID = computed(() => (selectedItem.value ? 2 : 1));
const discountType = ref("%");
const totalOrderDiscount = ref(0);
const cartInputValue = ref(0);
const itemInputValue = ref(0);
const selectCartInputText = () => {
  const cartDiscountInput = document.getElementById("cart-discount-input");
  // const itemDiscountInput = document.getElementById("item-discount-input");
  cartDiscountInput.focus();
  // discountInput.focus();
  cartDiscountInput.setSelectionRange(0, 3);
};
const selectItemInputText = (id) => {
  const itemDiscountInput = document.getElementById(id);
  if (!itemDiscountInput) return;
  itemDiscountInput.focus();
  itemDiscountInput.setSelectionRange(0, 3);
};
const toggleDiscountType = async (type) => {
  // cartInputValue.value = 0;
  discountType.value = type;
  // discount.value = "0";
  // await nextTick();
  // if (tabID.value === 1) selectCartInputText();
  // if (tabID.value === 2 && selectedItem.id !== null) selectItemInputText(selectedItem.id);
};
const cartDiscount = async () => {
  tabID.value = 1;
  await nextTick();
  toggleDiscountType("%");
};
const itemDiscount = () => {
  tabID.value = 2;
};

const discountValue = (payload) => {
  if (tabID.value == 1) cartInputValue.value = payload.value;
  if (tabID.value == 2) itemInputValue.value = payload.value;
};

const submitResults = () => {
  // console.log("CONGRATULATIONS!!");
  emit("close");
};
</script>
