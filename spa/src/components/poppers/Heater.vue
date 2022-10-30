<template>
  DaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDaryaDarya
</template>
<script>
import { ref } from "vue";
import { usePos } from "@/stores/pos";

import Calculator from "@/components/shared/calculator/Calculator.vue";
import Moneys from "@/components/Cards/Moneys.vue";
import PaymentPopperDiscount from "@/components/poppers/PaymentPopperDiscount.vue";
import SearchPanel from "@/components/shared/SearchPanel.vue";
export default {
  components: {
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
