<template>
  <div class="text-xl text-aronium-white font-light w-full h-full">
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
      />

      <!-- @input="addCartDiscount()" -->
      <label class="absolute ml-48 mt-2">
        <span class="text-aronium-white">{{ discountType }}</span>
      </label>
    </div>
    <keep-alive>
      <NumericPad @close="submitResults" @calculator-value="discountValue" />
    </keep-alive>
  </div>
</template>

<script setup>
import { ref, defineEmits } from "vue";

import { usePos } from "@/stores/pos";
import NumericPad from "@/components/shared/calculator/NnumericPad.vue";

const emit = defineEmits(["close"]);

import StoreOrderTopButtons from "@/components/store/StoreOrderTopButtons.vue";
import Modal from "@/components/shared/Modal.vue";

const store = usePos();
const useActiveOrder = ref(store.useActiveOrder);

const discountType = ref("%");
const cartInputValue = ref(0);

const selectCartInputText = () => {
  const cartDiscountInput = document.getElementById("cart-discount-input");
  // const itemDiscountInput = document.getElementById("item-discount-input");
  cartDiscountInput.focus();
  // discountInput.focus();
  cartDiscountInput.setSelectionRange(0, 3);
};

const toggleDiscountType = (type) => {
  discountType.value = type;
};

const discountValue = (payload) => {
  cartInputValue.value = payload.value;
};

const submitResults = () => {
  useActiveOrder.value.discountType = discountType.value;
  useActiveOrder.value.discount = cartInputValue.value;
  emit("close");
};
</script>
