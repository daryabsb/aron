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
    </div>
    <!-- end of noprint-area -->
    <div id="print-area" class="print-area"></div>
  </div>
</template>

<script>
import PosLeftNav from "@/components/pos/PosLeftNav.vue";
import PosRightNav from "@/components/pos/PosRightNav.vue";
import StoreMenu from "@/components/pos/StoreMenu.vue";
import ModalFirstTime from "@/components/temporary/ModalFirstTime.vue";
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
