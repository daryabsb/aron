<template>
  <div
    class="absolute h-full flex flex-col justify-between w-full z-20 bg-aronium-800"
  >
    <div class="my-2">
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
      <div class="flex flex-col items-center h-2/5 w-full p-2">
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
          </div>
          <div class="relative mt-6 text-xl">
            <label class="w-32">
              <span
                class="absolute bottom-3 right-4"
                :class="
                  tabID === 2 && item === null
                    ? 'opacity-50 select-none'
                    : 'opacity-100'
                "
                :disabled="tabID === 2 && item === null"
                >{{ discountType }}</span
              >
            </label>
            <input
              id="discount-input"
              v-model="discount"
              type="text"
              class="bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
              :class="
                tabID === 2 && item === null
                  ? 'opacity-50 text-opacity-50 select-none'
                  : 'opacity-100'
              "
              :disabled="tabID === 2 && item === null"
              @input="addCartDiscount()"
            />
          </div>
        </div>

        <div
          v-if="tabID === 2 && item === null"
          class="text-xl font-light w-full h-full"
        >
          Please select an item to add Item discount
        </div>
        <div
          v-if="tabID === 2 && item !== null"
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
          </div>

          <div class="relative mt-6 text-xl">
            <label class="w-32">
              <span
                class="absolute bottom-3 right-4"
                :class="
                  tabID === 2 && item === null
                    ? 'opacity-50 select-none'
                    : 'opacity-100'
                "
                :disabled="tabID === 2 && item === null"
                >{{ discountType }}</span
              >
            </label>
            <input
              id="discount-input"
              v-model="discount"
              type="text"
              class="bg-inherit border-0 border-b-2 text-right pb-3 pr-10 items-center focus:outline-none focus:ring-0"
              :class="
                tabID === 2 && item === null
                  ? 'opacity-50 text-opacity-50 select-none'
                  : 'opacity-100'
              "
              :disabled="tabID === 2 && item === null"
              @input="addItemDiscount(item)"
            />
          </div>
        </div>
      </div>
    </div>

    <div class="w-full px-6">
      <div class="text-right h-1/2 w-full leading-8 pr-2 items-end">
        <div>
          <span>Subtotal: {{ priceFormat(getTotalPrice().value) }}</span>
        </div>
        <div>
          <span>Total discount: {{ totalDiscount }}</span>
        </div>
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
            @click="$emit('cancel')"
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
import { ref, nextTick, onMounted, computed } from "vue";

import { priceFormat, getTotalPrice } from "@/store/composables";

export default {
  name: "PaymentPopperDiscount",
  components: {},
  props: {
    id: { type: Number, default: null },
    item: { type: Object, default: null },
  },
  emits: ["input", "cancel"],
  setup() {
    const selectInputText = () => {
      const discountInput = document.getElementById("discount-input");
      discountInput.focus();
      discountInput.setSelectionRange(0, 3);
    };
    onMounted(selectInputText);
    const tabID = ref(1);
    const discount = ref("0");
    const discountType = ref("%");

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
    const totalItemDiscount = ref([]);
    const totalAfterCartDiscount = ref(0);

    const totalDiscount = computed(
      () =>
        totalAfterCartDiscount.value +
        totalItemDiscount.value.reduce((total, item) => total + item.value, 0)
    );

    const addCartDiscount = () => {
      if (discountType.value == "%") {
        totalAfterCartDiscount.value = 0;
        totalAfterCartDiscount.value =
          (getTotalPrice().value * parseInt(discount.value)) / 100;
        return;
      }
      if (discountType.value == "$") {
        totalAfterCartDiscount.value = 0;
        totalAfterCartDiscount.value = parseInt(discount.value);
        return;
      }
    };
    const addItemDiscount = (item) => {
      if (!item) return;

      let singleItemDiscount = null;
      const itemIndex = totalItemDiscount.value.indexOf(item.id);
      if (!itemIndex) {
        singleItemDiscount.item = item.id;
        if (discountType.value == "%") {
          singleItemDiscount.value =
            item.price * item.qty * parseInt(discount.value);
          totalItemDiscount.value.push(singleItemDiscount);
          return;
        }
        if (discountType.value == "$") {
          singleItemDiscount.value = parseInt(discount.value);
          totalItemDiscount.value.push(singleItemDiscount);
          return;
        }
      }
      console.log(totalItemDiscount.value.length);
    };

    const clearDiscounts = () => (discount.value = "0");

    return {
      totalItemDiscount,
      totalAfterCartDiscount,

      tabID,
      cartDiscount,
      itemDiscount,
      toggleDiscountType,
      discountType,
      discount,
      clearDiscounts,
      priceFormat,
      getTotalPrice,
      addCartDiscount,
      addItemDiscount,
      totalDiscount,
    };
  },
};
</script>
