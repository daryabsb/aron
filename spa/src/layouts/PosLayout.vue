<template>
  <div class="bg-blue-gray-50">
    <!-- noprint-area -->
    <div
      class="hide-print flex flex-row h-screen antialiased text-blue-gray-800"
    >
      <!-- left sidebar -->
      <pos-left-nav></pos-left-nav>

      <router-view></router-view>

      <modal-first-time v-show="isShowModalFirstTime"></modal-first-time>

      <!-- modal receipt -->
      <modal-receipt v-show="isShowModalReceipt"></modal-receipt>
    </div>
    <!-- end of noprint-area -->

    <div id="print-area" class="print-area"></div>
  </div>

  <!-- PAGE START OVER END -->
</template>

<script>
import PosLeftNav from "@/components/pos/PosLeftNav.vue";
import PosRightNav from "@/components/pos/PosRightNav.vue";
import StoreMenu from "@/components/pos/StoreMenu.vue";
import ModalFirstTime from "@/components/modals/ModalFirstTime.vue";
import ModalReceipt from "@/components/pos/ModalReceipt.vue";
import { ref, onMounted } from "vue";
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
    StoreMenu,
    PosLeftNav,
    PosRightNav,
    ModalReceipt,
    ModalFirstTime,
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

    const printAndProceed = () => {
      const receiptContent = document.getElementById("receipt-content");
      const titleBefore = document.title;
      const printArea = document.getElementById("print-area");
      printArea.innerHTML = receiptContent.innerHTML;
      document.title = receiptNo;

      window.print();
      // isShowModalReceipt();
      closeModalReceipt();

      printArea.innerHTML = "";
      document.title = titleBefore;

      // TODO save sale data to database

      clear();
    };
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
      printAndProceed,
      priceFormat,
      getTotalPrice,
    };
  },
};
</script>
