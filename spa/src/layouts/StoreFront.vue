<template>
  <div
    class="relative w-full h-screen flex flex-col justify-center text-aronium-white bg-aronium-900 z-10"
  >
    <div
      class="h-20 py-1 w-full px-2 flex items-center border border-aronium-500 bg-transparent"
    >
      <store-header></store-header>
    </div>

    <div class="relative w-full">
      <store-search></store-search>
    </div>
    <div
      class="h-[12rem] bg-aronium-900 flex flex-grow justify-between items-center border-x border-aronium-500"
    >
      <div
        class="phone:w-full md:w-1/3 p-2 overflow-auto scrollbar h-full border-r border-aronium-500"
      >
        <store-order></store-order>
      </div>

      <div class="phone:hidden md:block w-2/3 overflow-auto scrollbar h-full">
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
      class="fixed bottom-0 w-full h-fit bg-aronium-900 px-2 flex justify-between items-center border border-aronium-500"
    >
      <store-totals-calculations></store-totals-calculations>
      <h1 class="text-2xl font-light tracking-wider">Search</h1>
      <span @click="$emit('close')">
        <i :class="isShowItems ? 'fa fa-times' : 'fa fa-circle'"></i>
      </span>
    </div>
  </div>
</template>
<script>
import { ref, defineAsyncComponent } from "vue";
import { usePos } from "@/stores/pos";
import { useModals } from "@/stores/modals";

import {
  useFetchProductsDispatch,
  openCashModal,
  openPaymentModal,
} from "@/store/composables";

import StoreHeader from "@/components/Navbars/StoreHeader.vue";
import StoreOrder from "@/components/store/StoreOrder.vue";
import StoreSearch from "@/components/store/StoreSearch.vue";
import StoreTotalsCalculations from "@/components/store/StoreTotalsCalculations.vue";

import Calculator from "@/components/shared/calculator/Calculator.vue";
import Moneys from "@/components/Cards/Moneys.vue";
import PaymentPopperDiscount from "@/components/poppers/PaymentPopperDiscount.vue";
import SearchPanel from "@/components/shared/SearchPanel.vue";
import HeaderSearchPopper from "@/components/poppers/HeaderSearchPopper.vue";
// import PaymentPopper from "@/components/poppers/PaymentPopper.vue";

const CashPopper = defineAsyncComponent(() =>
  import("@/components/poppers/CashPopper.vue")
);
const PaymentPopper = defineAsyncComponent(() => {
  import("@/components/poppers/PaymentPopper.vue");
});
// const HeaderSearchPopper = defineAsyncComponent(() => {
//   import("@/components/poppers/HeaderSearchPopper.vue");
// });

export default {
  components: {
    StoreHeader,
    StoreSearch,
    StoreOrder,
    StoreTotalsCalculations,
    Calculator,
    Moneys,
    PaymentPopperDiscount,
    HeaderSearchPopper,
    SearchPanel,
  },
  emits: ["close", "cashOut"],
  setup() {
    const store = usePos();
    const createCart = store.createCart;
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

    const mods = useModals();
    const isSearchModal = mods.isSearchModal;
    const searchModal = () => {
      mods.searchModal = !mods.searchModal;
    };

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
    createCart();

    return {
      // Numeric pad
      isSearchModal,
      searchModal,

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
