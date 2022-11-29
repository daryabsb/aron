<template>
  <div>
    <div v-if="!store.activeItem" class="text-xl font-light w-full h-full">
      <h1 class="text-xl text-aronium-white my-16">
        Please select an item to add Item discount
      </h1>
      <div class="w-full">
        <EmptyNumericPad />
      </div>
    </div>
    <div v-else class="text-xl text-aronium-white font-light w-full h-full">
      This is a discount for " {{ store.activeItem.product.name }} "
      <div class="flex flex-col items-center">
        <div class="flex justify-center mt-4 w-full height-16">
          <button class="rounded-l-lg w-20 bg-inherit border border-aronium-500" :class="
            discountType === 0
              ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
              : 'bg-inherit  border-aronium-500'
          " @click="toggleDiscountType(0)">
            %
          </button>
          <button class="rounded-r-lg w-20 border" :class="
            discountType === 1
              ? 'bg-aronium-sky text-aronium-white border-aronium-sky'
              : 'bg-inherit  border-aronium-500'
          " @click="toggleDiscountType(1)">
            $
          </button>
        </div>
      </div>
      <NumericPad v-model="itemInputValue" :symbol="discountType == 0 ? '%' : '$'" @update:calc-memory="updateItemInput"
        @close="submitResults" />

      <div class="w-full flex justify-center mt-6 text-xl">
        <!-- <input
          :id="selectedItem.id"
          :value="itemInputValue"
          type="text"
          disabled
          class="relative bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
        /> -->
        <!-- @input="addItemDiscount(id)" -->
        <!-- <label class="absolute ml-48 mt-2">
          <span class="text-aronium-white">{{
            discountType == 0 ? "%" : "$"
          }}</span>
        </label> -->
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, defineEmits, onMounted } from "vue";

import { useOrderStore } from "@/Orders/ordersStore";
import NumericPad from "@/components/shared/calculator/NumericPad.vue";
import EmptyNumericPad from "@/components/shared/calculator/EmptyNumericPad.vue";

const emit = defineEmits(["close"]);

const store = useOrderStore();
// const selectedItem = store.useActiveItem;

// const selectedItem = computed({
//   get() {
//     return useActiveOrder.items.find((item) => item.isActive);
//   },
//   set(value) {
//     selectedItem.value.discount = value;
//   },
// });
const selectItemInputText = () => {
  // const itemDiscountInput = document.getElementById(selectedItem.value.id);
  // if (!itemDiscountInput) return;
  // itemDiscountInput.focus();
  // itemDiscountInput.setSelectionRange(0, 3);
};
onMounted(() => {
  // if (selectedItem.value) selectItemInputText();
});

const discountType = ref(0);
const itemInputValue = ref("");
const updateItemInput = (memory) => (itemInputValue.value = memory.value);

const toggleDiscountType = (type) => {
  discountType.value = type;
  selectItemInputText();
};

const discountValue = (payload) => {
  itemInputValue.value = payload.value;
};


const submitResults = () => {
  store.appllyItemDiscount(discountType.value, +itemInputValue.value);
  // selectedItem.value.discountType = discountType.value;
  // selectedItem.value.discount = +itemInputValue.value;
  // selectedItem.value.isActive = false;
  store.activeItem = null
  store.openOrderDiscountModal = false;
};
</script>
