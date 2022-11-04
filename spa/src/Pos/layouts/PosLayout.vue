<template>
  <div class="relative bg-aronium-800 p-1 box-border">
    <!-- <modal-calculator></modal-calculator> -->
    <!-- noprint-area -->
    <div class="hide-print">
      <!-- <cash-popper
        v-if="openCashModal"
        class="w-full"
        @close="cashModal"
      ></cash-popper> -->
      <!-- <payment-popper
        v-if="openPaymentModal"
        class="w-full"
        @close="paymentModal"
        @cash-out="cashOut"
      ></payment-popper> -->

      <!-- <header-search-popper
        v-show="isSearchModal"
        @close="searchModal"
      ></header-search-popper> -->

      <div
        class="grid grid-cols-8 grid-rows-12 text-aronium-white h-screen w-full overflow-auto"
      >
        <!-- left sidebar -->
        <!-- <pos-left-nav></pos-left-nav> -->

        <div class="col-span-8 row-span-1 px-1 h-min my-3">
          <pos-header
            @cash-modal="cashModal"
            @payment-modal="paymentModal"
          ></pos-header>
        </div>
        <div class="col-span-8 grid grid-cols-12 row-span-10">
          <div class="mr-2 col-span-3 row-span-11">
            <Suspense>
              <template #default>
                <pos-right-nav></pos-right-nav>
                <!-- <store-order></store-order> -->
              </template>
              <template #fallback>
                <span>Loading...</span>
              </template>
            </Suspense>
          </div>
          <div class="col-span-9 row-span-11 h-full">
            <router-view></router-view>
          </div>
        </div>

        <!-- <modal-first-time v-show="isShowModalFirstTime"></modal-first-time> -->
      </div>
    </div>
    <!-- end of noprint-area -->
    <div id="print-area" class="print-area"></div>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
import { usePos } from "@/stores/pos";
import { useModals } from "@/stores/modals";

// import ModalCalculator from "@/components/modals/ModalCalculator.vue";
import PosHeader from "@/Pos/components/Headers/PosHeader.vue";
import PosRightNav from "@/Pos/components/PosRightNav.vue";
import StoreOrder from "@/Pos/components/StoreOrder.vue";
// import ModalFirstTime from "@/components/temporary/ModalFirstTime.vue";
import {
  useFetchProductsDispatch,
  openCashModal,
  openPaymentModal,
} from "@/store/composables";

window.onkeydown = (evt) => {
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
    PosRightNav,
    // HeaderSearchPopper,
    StoreOrder,

    // ModalFirstTime,
    // ModalCalculator,
  },
  setup() {
    const store = usePos();
    const createCart = store.createCart;
    const clearCash = store.clearCash;
    let time = ref(null);
    let activeMenu = "pos";
    let isShowModalFirstTime = false;

    const mods = useModals();
    const isSearchModal = ref(mods.isSearchModal);

    // GETTERS from COMPOSABLES
    const cart = useCart;
    const cash = useCash;
    const change = useChange;

    let receiptDate = ref(null);
    onMounted(() => {
      useFetchProductsDispatch();
      if (store.cart.length === 0) createCart();
    });
    onMounted(useFetchProductsDispatch);

    // CASH
    // const openCashModal = ref(false);
    const searchModal = () => {
      isSearchModal.value = !isSearchModal.value;
    };
    const cashModal = () => {
      openCashModal.value = !openCashModal.value;
    };
    const paymentModal = () => {
      openPaymentModal.value = !openPaymentModal.value;
      clearCash();
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

      searchModal,
      isSearchModal,
    };
  },
};
</script>
