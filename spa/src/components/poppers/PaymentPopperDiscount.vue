<template>
  <div class="absolute h-full w-full z-20 bg-aronium-800">
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

    <div class="flex flex-col items-center h-full w-full p-2">
      <div class="p-5">
        <img src="/media/icons/cart.svg" class="w-16" alt="cart-icon" />
      </div>
      <div v-if="tabID === 1" class="text-xl font-light w-full h-full">
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
          <label class="relative w-32 mt-6" for="discount-input">
            <input
              v-model="discount"
              name="discount-input"
              type="text"
              class="bg-inherit ring-0 border-0 border-b-2"
            />
            <span class="absolute top-0 right-6">{{ discountType }}</span>
          </label>
        </div>
      </div>

      <div
        v-if="tabID === 2 && id === null"
        class="text-xl font-light w-full h-full"
      >
        Please select an item to add Item discount
      </div>
      <div
        v-if="tabID === 2 && id !== null"
        class="text-xl font-light w-full h-full"
      >
        This is a discount for " {{ item.name }} "
      </div>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
export default {
  name: "PaymentPopperDiscount",
  components: {},
  props: {
    id: { type: Number, default: null },
    item: { type: Object, default: null },
  },
  setup() {
    const isActive = ref(false);
    const tabID = ref(1);
    const discount = ref("");
    const discountType = ref("%");

    const toggleDiscountType = (type) => (discountType.value = type);
    const cartDiscount = () => {
      tabID.value = 1;
    };
    const itemDiscount = () => {
      tabID.value = 2;
    };

    return {
      isActive,
      tabID,
      cartDiscount,
      itemDiscount,
      toggleDiscountType,
      discountType,
      discount,
    };
  },
};
</script>
