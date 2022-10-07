<template>
  <div class="bg-aronium-800 p-1">
    <!-- <modal-calculator></modal-calculator> -->
    <!-- noprint-area -->
    <div class="hide-print">
      <div
        class="grid grid-cols-12 grid-rows-12 text-aronium-white h-screen gap-2 pb-3"
      >
        <!-- left sidebar -->
        <!-- <pos-left-nav></pos-left-nav> -->

        <div class="col-start-1 col-span-12 row-start-1 row-span-1 px-1">
          <pos-header></pos-header>
        </div>
        <div class="col-start-1 col-span-3 row-start-2 row-span-11">
          <pos-right-nav></pos-right-nav>
        </div>
        <div class="col-start-4 col-span-9 row-start-2 row-span-11">
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
import ModalCalculator from "@/components/modals/ModalCalculator.vue";
import PosHeader from "@/components/Navbars/PosHeader.vue";
import PosRightNav from "@/components/pos/PosRightNav.vue";
import StoreMenu from "@/components/pos/StoreMenu.vue";
import ModalFirstTime from "@/components/temporary/ModalFirstTime.vue";
import { useFetchProductsDispatch } from "@/store/composables";

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
    StoreMenu,
    PosRightNav,
    ModalFirstTime,
    ModalCalculator,
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
    };
  },
};
</script>
