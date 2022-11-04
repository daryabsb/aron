<template>
  <div
    class="absolute left-0 top-0 h-full py-12 flex items-center bg-opacity-90 bg-opacity-85 text-aronium-white bg-aronium-900 z-10"
  >
    <!-- ITEMS AT PAYMENT MODAL -->
    <div class="h-4/5 w-full flex border border-aronium-500">
      <div
        v-if="isShowItems"
        class="h-full w-1/5 text-center bg-transparent text-aronium-white"
      >
        <!-- <div class="w-full h-full bg-aronium-700 border-r border-aronium-500"> -->
        <div
          class="h-16 w-full text-left bg-aronium-900 p-2 border-b border-r border-aronium-500"
        >
          <h1 class="text-2xl font-light tracking-wider">Items</h1>
        </div>
        <div
          class="w-full h-full bg-aronium-700 border-b border-r border-aronium-500 text-left p-3"
        >
          <!-- ITEMS HERE -->
          <div v-for="item in activeOrder.items" :key="item.id">
            <div
              class="bg-aronium-700 border-b mb-2 border-aronium-500 shadow w-full px-2 md:py-0 xl:py-1 flex justify-center"
              :class="
                item.product.id === ID
                  ? 'bg-aronium-sky-600  text-aronium-50 text-shadow-lg'
                  : 'bg-inherit'
              "
              @click="selectItem(item.product)"
            >
              <img
                :src="item.product.image"
                alt=""
                class="rounded-sm h-8 w-8 hover:h-20 hover:w-20 hover:shadow-2xl bg-transparent shadow mr-2"
              />
              <div class="flex-grow">
                <h5
                  class="text-sm subpixel-antialiased tracking-wider font-semibold"
                >
                  {{ item.product.name }}
                </h5>
              </div>

              <div>
                <div class="flex items-center">
                  {{ priceFormat(getItemTotalPrice(item).value) }}
                </div>
              </div>
            </div>
          </div>
          <!-- ITEMS END -->
        </div>
        <!-- </div> -->
      </div>

      <div
        class="relative text-center bg-transparent text-aronium-white"
        :class="isShowItems ? 'w-4/5' : 'w-full'"
      >
        <div
          class="h-16 w-full flex justify-between text-left bg-aronium-900 p-2 border-b border-aronium-500"
        >
          <h1 class="text-2xl">Actions</h1>
          <span @click="showItems">
            <i :class="isShowItems ? 'fa fa-times' : 'fa fa-circle'"></i>
          </span>
        </div>
        <payment-popper-discount
          v-if="isDiscountPopper"
          :id="ID"
          :items="cart"
          @cancel="closeDiscountPopper"
        ></payment-popper-discount>
        <div
          class="w-full h-full bg-aronium-700 border-b border-r border-aronium-500 text-left p-3"
        >
          <div
            class="relative flex items-center justify-between w-full h-12 bg-inherit"
          >
            <div class="flex items-center h-full">
              <button
                class="bg-aronium-danger py-4 px-12"
                @click="$emit('close')"
              >
                <span><i class="fa fa-times"></i></span>
                Cancel
              </button>
            </div>
            <div class="flex items-center h-full">
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 px-12 mr-1"
                @click="openDiscountPopper"
              >
                <span class="mr-2"><i class="fa fa-percent"></i></span>
                Discount
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 px-12 mr-1"
                @click="$emit('close')"
              >
                <span class="mr-2"><i class="fa fa-layer-group"></i></span>
                Rounds
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 px-12"
                @click="$emit('close')"
              >
                <span class="mr-2"><i class="fa fa-user"></i></span>
                Customer
              </button>
            </div>
          </div>
          <div class="flex">
            <div class="flex flex-col items-start h-full w-30 mt-3 mr-3">
              <h1 class="mb-3 text-xl font-light">Payment Type</h1>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('cashOut')"
              >
                Cash
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('cashOut')"
              >
                Credit Card
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('close')"
              >
                Debit Card
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('close')"
              >
                Check
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 w-44 justify-center py-4 text-sm my-1"
                @click="$emit('close')"
              >
                Voucher
              </button>
              <button
                class="flex g-aronium-inherit border border-aronium-500 w-44 justify-center text-sm py-4 my-1"
                @click="$emit('close')"
              >
                Gift Card
              </button>
              <!-- Add Icon to this -->
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('close')"
              >
                Split Payment
              </button>
            </div>
            <div class="flex flex-col items-start h-full w-full mt-3 leading-9">
              <h1 class="mb-3 text-xl font-light">Payment</h1>
              <div class="flex justify-between w-full">
                Total:
                <span
                  class="font-semibold text-2xl text-aronium-sky-500 ml-auto"
                  >{{ priceFormat(activeOrder.total) }}</span
                >
              </div>

              <div class="relative flex justify-start w-full">
                Total:
                <input
                  ref="input"
                  v-model="cash"
                  type="text"
                  class="grow font-semibold text-3xl bg-inherit text-end focus:ring-0 border-0 border-b border-aronium-500 focus:border-aronium-sky-500"
                />
                <span class="absolute left-12 top-2 text-xl">
                  <i class="fa fa-pencil"></i>
                </span>
              </div>
              <div class="flex justify-between w-full text-aronium-danger">
                Change:
                <span
                  class="font-semibold text-2xl text-aronium-sky-500 ml-auto"
                  >{{ priceFormat(change) }}</span
                >
              </div>
              <div class="flex justify-around w-full h-full bottom-0">
                <moneys></moneys>

                <calculator></calculator>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import { usePos } from "@/stores/pos";

import Calculator from "@/components/shared/calculator/Calculator.vue";

import Moneys from "@/Orders/components/Cards/Moneys.vue";
import PaymentPopperDiscount from "@/Orders/components/Modals/PaymentPopperDiscount.vue";
export default {
  components: {
    Calculator,
    Moneys,
    PaymentPopperDiscount,
  },
  emits: ["close", "cashOut"],
  setup() {
    const store = usePos();
    const cart = store.cart;
    const cash = store.useCash;
    const change = store.useChange;
    const isShowItems = ref(true);
    const moneys = store.useMoneys;
    const priceFormat = store.priceFormat;
    const getItemTotalPrice = store.getItemTotalPrice;
    const getItemSubTotal = store.getItemSubTotal;

    const getTotalPrice = store.totalPrice;
    const activeOrder = store.useActiveOrder;
    const inputMoney = ref(0);

    const isDiscountPopper = ref(false);

    const openDiscountPopper = () => {
      ID.value = null;
      isDiscountPopper.value = true;
    };
    const closeDiscountPopper = () => {
      ID.value = null;
      isDiscountPopper.value = false;
    };

    const cashValue = ref(0);

    const addCashValue = (value) => {
      cashValue.value = value;
      store.addCash(value);
    };

    const showItems = () => (isShowItems.value = !isShowItems.value);

    const ID = ref(null);
    const cartItem = ref(null);

    const selectItem = (item) => {
      if (!ID.value) {
        ID.value = item.id;
      } else if (ID.value !== item.id) {
        ID.value = item.id;
      } else {
        ID.value = null;
      }
    };

    return {
      // Numeric pad

      inputMoney,
      cash,
      change,
      activeOrder,
      isShowItems,
      showItems,
      getTotalPrice,
      addCashValue,
      cashValue,
      priceFormat,
      getItemTotalPrice,
      ID,
      cartItem,
      selectItem,
      getItemSubTotal,
      openDiscountPopper,
      isDiscountPopper,
      closeDiscountPopper,
    };
  },
};
</script>
