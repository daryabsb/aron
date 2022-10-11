<template>
  <div class="absolute h-4/5 w-full z-20 bg-aronium-800">
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

    <div class="flex flex-col items-center h-2/3 w-full p-2">
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

          <div class="relative mt-6 text-xl">
            <label class="w-32">
              <span class="absolute bottom-3 right-4">{{ discountType }}</span>
            </label>
            <input
              id="discount-input"
              v-model="discount"
              type="text"
              class="bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
              @input="addDiscount({ discount, discountType })"
            />
          </div>
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

          <div class="relative mt-6 text-xl">
            <label class="w-32">
              <span class="absolute bottom-3 right-4">{{ discountType }}</span>
            </label>
            <input
              id="discount-input"
              v-model="discount"
              type="text"
              class="bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
              @input="addDiscount(discount + discountType)"
            />
          </div>
        </div>
      </div>
    </div>

    <div class="h-1/3 mt-28 w-full px-6">
      <div class="text-right h-1/2 w-full leading-8 pr-2 items-end">
        <div><span>Subtotal: 5,745</span></div>
        <div><span>Total discount: 1,436.25</span></div>
        <div><span>Total: 4,308.75</span></div>
      </div>
      <div class="h-1/2 flex justify-between w-full p-1">
        <button
          class="h-12 px-8 p-2 rounded-sm focus:outline-none bg-inherit border border-aronium-500 hover:bg-aronium-500"
          @click="clearDiscounts"
        >
          <span class="grow w-24"><i class="fa fa-trash"></i></span>

          Clear discounts
        </button>

        <div class="mt-3">
          <button
            class="h-12 px-8 p-2 rounded-sm focus:outline-none active:bg-gray-400 bg-aronium-green hover:bg-green-400 hover:shadow-lg"
          >
            <span><i class="fa fa-check"></i></span>
            OK
          </button>
          <button
            class="h-12 px-6 ml-4 p-2 rounded-sm focus:outline-none active:bg-gray-400 bg-aronium-danger hover:bg-red-400 hover:shadow-lg"
            @click="closeDiscount"
          >
            <span><i class="fa fa-times"></i></span>
            Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref, nextTick } from "vue";

import { priceFormat, getTotalPrice, addDiscount } from "@/store/composables";

export default {
  name: "PaymentPopperDiscount",
  components: {},
  props: {
    id: { type: Number, default: null },
    item: { type: Object, default: null },
  },
  emits: ["input", "cancel"],
  setup(props, context) {
    const isActive = ref(false);
    const tabID = ref(1);
    const discount = ref("0");
    const discountType = ref("%");

    const selectInputText = () => {
      const discountInput = document.getElementById("discount-input");
      discountInput.focus();
      discountInput.setSelectionRange(0, 3);
    };

    const toggleDiscountType = async (type) => {
      discountType.value = type;
      discount.value = "0";
      await nextTick();
      selectInputText();
    };
    const cartDiscount = async () => {
      tabID.value = 1;
      await nextTick();
      toggleDiscountType("%");
    };
    const itemDiscount = async () => {
      tabID.value = 2;

      await nextTick();
      toggleDiscountType("%");
    };
    const closeDiscount = () => context.emit("cancel");
    const clearDiscounts = () => (discount.value = "0");

    return {
      isActive,
      tabID,
      cartDiscount,
      itemDiscount,
      toggleDiscountType,
      discountType,
      discount,
      closeDiscount,
      clearDiscounts,
      priceFormat,
      getTotalPrice,
      addDiscount,
    };
  },
};
</script>
