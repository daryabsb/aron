<template>
  <div class="text-xl text-aronium-white font-light w-full h-full">
    Applly cart discount
    <div class="flex flex-col items-center">
      <div class="flex justify-center mt-4 w-full height-16">
        <button
          class="rounded-l-lg w-20 bg-inherit border border-aronium-500"
          :class="
            discountType === 0
              ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
              : 'bg-inherit  border-aronium-500'
          "
          @click="toggleDiscountType(0)"
        >
          %
        </button>
        <button
          class="rounded-r-lg w-20 border"
          :class="
            discountType === 1
              ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
              : 'bg-inherit  border-aronium-500'
          "
          @click="toggleDiscountType(1)"
        >
          $
        </button>
      </div>
    </div>
    <NumericPad
      v-model="cartInputValue"
      :symbol="discountType == 0 ? '%' : '$'"
      @update:calc-memory="updateCartInput"
      @close="submitResults"
    />
    <div class="flex justify-center relative mt-6 text-xl w-full">
      <!-- <input
        :value="cartInputValue"
        id="cart-discount-input"
        type="text"
        disabled
        class="relative bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
      /> -->
      <!-- <input id="cart-discount-input" :value="cartInputValue" type="text" disabled 
      class="relative bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
      />-->

      <!-- @input="addCartDiscount()" -->
      <!-- <label class="absolute ml-48 mt-2">
        <span class="text-aronium-white">{{
            discountType == 0 ? "%" : "$"
        }}</span>
      </label> -->
    </div>
    <!-- <NumericPad @close="submitResults" @get-value="discountValue" /> -->
    <!-- <keep-alive> -->
    <!-- </keep-alive> -->
  </div>
</template>

<script setup>
import { ref, defineEmits, onMounted } from "vue";

import { useOrderStore } from "@/Orders/ordersStore";
import NumericPad from "@/components/shared/calculator/NumericPad.vue";

const emit = defineEmits(["close"]);

const updateCartInput = (memory) => (cartInputValue.value = memory.value);

const store = useOrderStore();

const useActiveOrder = store.useActiveOrder;

const discountType = ref(0);
const cartInputValue = ref("");

const selectCartInputText = () => {
  // const cartDiscountInput = document.getElementById("cart-discount-input");
  // // const itemDiscountInput = document.getElementById("item-discount-input");
  // cartDiscountInput.focus();
  // // discountInput.focus();
  // cartDiscountInput.setSelectionRange(0, 3);
};
onMounted(selectCartInputText);

const toggleDiscountType = (type) => {
  discountType.value = type;
  // selectCartInputText();
};

const discountValue = (payload) => {
  cartInputValue.value = payload.value;
};

const submitResults = () => {
  store.appllyCartDiscount(
    useActiveOrder,
    discountType.value,
    +cartInputValue.value
  );

  store.openOrderDiscountModal = false;
};
</script>
