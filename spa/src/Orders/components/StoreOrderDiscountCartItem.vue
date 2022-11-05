<template>
  <div>
    <div v-if="!selectedItem" class="text-xl font-light w-full h-full">
      Please select an item to add Item discount
    </div>
    <div v-else class="text-xl text-aronium-white font-light w-full h-full">
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
          @input="addItemDiscount(id)"
        />
        <label class="absolute ml-48 mt-2">
          <span class="text-aronium-white">{{ discountType }}</span>
        </label>
      </div>

      <NumericPad @close="submitResults" @get-value="discountValue" />
    </div>
  </div>
</template>

<script setup>
import { ref, computed, defineEmits } from "vue";

import { useOrderStore } from "@/Orders/ordersStore";
import NumericPad from "@/components/shared/calculator/NumericPad.vue";

const emit = defineEmits(["close"]);

const store = useOrderStore();
const useActiveOrder = ref(store.useActiveOrder);

const selectedItem = computed({
  get() {
    return useActiveOrder.value.items.find((item) => item.isActive);
  },
  set(value) {
    selectedItem.value.discount = value;
  },
});

const discountType = ref("%");
const itemInputValue = ref(0);

const selectItemInputText = (id) => {
  const itemDiscountInput = document.getElementById(id);
  if (!itemDiscountInput) return;
  itemDiscountInput.focus();
  itemDiscountInput.setSelectionRange(0, 3);
};
const toggleDiscountType = (type) => {
  discountType.value = type;
};

const discountValue = (payload) => {
  itemInputValue.value = payload.value;
};

const submitResults = () => {
  selectedItem.value.discountType = discountType.value;
  selectedItem.value.discount = itemInputValue.value;
  selectedItem.value.isActive = false;
  emit("close");
};
</script>
