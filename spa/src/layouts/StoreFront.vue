<template>
  <div
    class="w-full h-screen flex flex-col justify-center text-aronium-white bg-aronium-900 z-10"
  >
    <!-- ITEMS AT PAYMENT MODAL -->
    <!-- <search-panel></search-panel> -->

    <div
      class="h-20 py-1 w-full px-2 flex items-center border border-aronium-500 bg-transparent"
    >
      <store-header></store-header>
      <!-- <h1 class="text-2xl font-light tracking-wider">Search</h1>
      <span @click="$emit('close')">
        <i class="fa fa-times"></i>
      </span> -->
    </div>
    <div
      class="h-[30rem] flex flex-grow justify-between items-center border-x border-aronium-500 bg-transparent"
    >
      <div class="w-1/3 h-full border-r border-aronium-500">
        <div class="relative w-full">
          <input
            type="text"
            placeholder="Product names..."
            class="w-full px-10 bg-transparent outline-none border-x-0 border-t-0 border-b border-aronium-500"
          />
          <i class="absolute top-3 left-3 fa fa-search"></i>
          <i class="absolute top-3 right-3 fa fa-times"></i>
        </div>
        <div class="relative w-full">
          <input
            type="text"
            placeholder="Product code..."
            class="w-full px-10 bg-transparent outline-none border-x-0 border-t-0 border-b border-aronium-500"
          />
          <i class="absolute top-3 left-3 fa fa-search"></i>
          <i class="absolute top-3 right-3 fa fa-times"></i>
        </div>
        <div class="relative w-full">
          <input
            type="text"
            placeholder="Barcodes..."
            class="w-full px-10 bg-transparent outline-none border-x-0 border-t-0 border-b border-aronium-500"
          />
          <i class="absolute top-3 left-3 fa fa-search"></i>
          <i class="absolute top-3 right-3 fa fa-times"></i>
        </div>
        <div class="relative w-full">
          Darya
        </div>
      </div>
      <div class="w-2/3 h-full">
        <div class="relative w-full">
          <input
            type="text"
            placeholder="Product names..."
            class="w-full px-10 bg-transparent outline-none border-x-0 border-t-0 border-b border-aronium-500"
          />
          <i class="absolute top-3 left-3 fa fa-search"></i>
          <i class="absolute top-3 right-3 fa fa-times"></i>
        </div>
        <router-view></router-view>
      </div>
    </div>
    <div
      class="h-20 px-4 flex justify-between items-center border border-aronium-500 bg-transparent"
    >
      <h1 class="text-2xl font-light tracking-wider">Search</h1>
      <span @click="$emit('close')">
        <i :class="isShowItems ? 'fa fa-times' : 'fa fa-circle'"></i>
      </span>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import { usePos } from "@/stores/pos";

import StoreHeader from "@/components/Navbars/StoreHeader.vue";

import Calculator from "@/components/shared/calculator/Calculator.vue";
import Moneys from "@/components/Cards/Moneys.vue";
import PaymentPopperDiscount from "@/components/poppers/PaymentPopperDiscount.vue";
import SearchPanel from "@/components/shared/SearchPanel.vue";
export default {
  components: {
    StoreHeader,
    Calculator,
    Moneys,
    PaymentPopperDiscount,
    SearchPanel,
  },
  emits: ["close", "cashOut"],
  setup() {
    const store = usePos();
    const cart = store.cart;
    const cash = store.useCash;
    const change = store.useChange;
    console.log("change", change);
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
