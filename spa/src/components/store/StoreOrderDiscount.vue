<template>
  <div>
    <Modal>
      <DialogPanel
        class="relative transform overflow-hidden rounded-sm border border-aronium-500 bg-aronium-900 px-4 pt-5 pb-4 text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-sm sm:p-6"
      >
        <div>
          <div
            class="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-green-100"
          >
            <CheckIcon class="h-6 w-6 text-green-600" aria-hidden="true" />
          </div>
          <div class="mt-3 text-center sm:mt-5">
            <DialogTitle
              as="h3"
              class="text-lg font-medium leading-6 text-aronium-white"
            >
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
            </DialogTitle>
            <div class="mt-2">
              <p class="text-sm text-aronium-300">
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Consequatur amet labore.
              </p>
            </div>
          </div>
        </div>
        <div class="mt-5 sm:mt-6">
          <button
            type="button"
            class="inline-flex w-full justify-center rounded-md border border-aronium-500 bg-aronium-900 px-4 py-2 text-base font-medium text-white hover:text-pink-700 shadow-sm hover:bg-aronium-700 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2 sm:text-sm"
            @click="open = false"
          >
            Go back to dashboard
          </button>
        </div>
      </DialogPanel>
    </Modal>
  </div>
</template>

<script setup>
import { ref, defineProps, nextTick } from "vue";
import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import { CheckIcon } from "@heroicons/vue/24/outline";
import { usePos } from "@/stores/pos";

const props = defineProps({
  id: { type: Number, default: null },
  items: { type: Object, default: null },
});

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
console.log(useActiveOrder.value);

const tabID = ref(1);
const discountType = ref("%");
const totalOrderDiscount = ref(0);
const cartInputValue = ref(0);
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
  cartInputValue.value = 0;
  discountType.value = type;
  // discount.value = "0";
  await nextTick();
  if (tabID.value === 1) selectCartInputText();
  if (tabID.value === 2 && props.id !== null) selectItemInputText(props.id);
};
const cartDiscount = async () => {
  tabID.value = 1;
  await nextTick();
  toggleDiscountType("%");
};
const itemDiscount = () => {
  tabID.value = 2;
};
</script>
