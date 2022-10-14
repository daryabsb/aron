<template>
  <div class="bg-aronium-800 p-1">
    <!-- <modal-calculator></modal-calculator> -->
    <!-- noprint-area -->
    <div class="hide-print">
      <cash-popper
        v-if="openCashModal"
        class="w-full"
        @close="cashModal"
      ></cash-popper>
      <payment-popper
        v-if="openPaymentModal"
        class="w-full"
        @close="paymentModal"
        @cash-out="cashOut"
      ></payment-popper>

      <div
        class="grid grid-cols-12 grid-rows-12 text-aronium-white h-screen w-full gap-3 pb-3"
      >
        <!-- left sidebar -->
        <!-- <pos-left-nav></pos-left-nav> -->

        <div class="col-span-12 row-span-1 px-1">
          <pos-header
            @cash-modal="cashModal"
            @payment-modal="paymentModal"
          ></pos-header>
        </div>
        <div class="col-span-3 row-span-11 mt-4">
          <pos-right-nav></pos-right-nav>
        </div>
        <div class="col-span-9 row-span-11 mt-4">
          <router-view></router-view>
        </div>

        <modal-first-time v-show="isShowModalFirstTime"></modal-first-time>
      </div>
    </div>
    <!-- end of noprint-area -->
    <div id="print-area" class="print-area"></div>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
// import ModalCalculator from "@/components/modals/ModalCalculator.vue";
import PosHeader from "@/components/Navbars/PosHeader.vue";
import PosRightNav from "@/components/pos/PosRightNav.vue";
// import StoreMenu from "@/components/pos/StoreMenu.vue";
import ModalFirstTime from "@/components/temporary/ModalFirstTime.vue";
import {
  useFetchProductsDispatch,
  openCashModal,
  openPaymentModal,
} from "@/store/composables";

import CashPopper from "@/components/poppers/CashPopper.vue";
import PaymentPopper from "@/components/poppers/PaymentPopper.vue";

// F keys event listener
// window.onkeydown = (evt) => {

//   const getEvt = (key) => {
//     const myKeys = new Map();
//     myKeys.set("F8", (openCashModal.value = !openCashModal.value));
//     return myKeys.get(key) || "None";
//   };
//   return getEvt(evt.key);
// };

// window.onkeydown = (evt) => {
//   switch (evt.key) {
//     case "F8":
//       openPaymentModal.value = true;
//       break;
//     case "F9":
//       openCashModal.value = true;
//       break;
//     default:
//       openCashModal.value = false;
//       openPaymentModal.value = false;
//   }

//   return "Congratulations";
// };

window.onkeydown = (evt) => {
  // console.log(evt.key);
  const getEvt = (key) => {
    const F8 = "F8";
    const F9 = "F9";
    const Escape = "Escape";
    const defaultKey = "default";

    const myKeys = {
      [F8]: () => (openPaymentModal.value = true),
      [F9]: () => (openCashModal.value = true),
      [Escape]: () => {
        openCashModal.value = false;
        openPaymentModal.value = false;
      },
      [defaultKey]: () => {
        "none";
      },
    };

    // console.log(myKeys[key]);
    return myKeys[key] || myKeys[defaultKey];
  };
  return getEvt(evt.key)();
};

// END of F keys

import {
  useCash,
  useChange,
  useCart,
  clear,
  isShowModalReceipt,
  priceFormat,
  getTotalPrice,
  closeModalReceipt,
  receiptNo,
} from "@/store/composables";

export default {
  components: {
    PosHeader,
    PaymentPopper,
    CashPopper,
    PosRightNav,
    ModalFirstTime,
    // ModalCalculator,
  },
  setup() {
    let time = ref(null);
    let activeMenu = "pos";
    let isShowModalFirstTime = false;

    // GETTERS from COMPOSABLES
    const cart = useCart;
    const cash = useCash;
    const change = useChange;

    let receiptDate = ref(null);

    onMounted(useFetchProductsDispatch);

    // CASH
    // const openCashModal = ref(false);
    const cashModal = () => {
      openCashModal.value = !openCashModal.value;
    };
    const paymentModal = () => {
      openPaymentModal.value = !openPaymentModal.value;
    };

    const cashOut = () => {
      paymentModal();
      cashModal();
    };

    // PAYMENT

    // const openModal = (msg) => console.log(msg);

    return {
      cart,
      change,
      cash,
      clear,
      time,
      activeMenu,
      isShowModalReceipt,
      isShowModalFirstTime,
      receiptNo,
      receiptDate,
      closeModalReceipt,
      priceFormat,
      getTotalPrice,

      // CASH PROPERTIES
      openCashModal,
      cashModal,

      // PAYMENT
      openPaymentModal,
      paymentModal,
      cashOut,
    };
  },
};
</script>
