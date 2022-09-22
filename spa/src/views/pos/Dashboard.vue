<script>
import StoreMenu from "@/components/pos/StoreMenu.vue";
import PosRightNav from "@/components/pos/PosRightNav.vue";
import ModalReceipt from "@/components/pos/ModalReceipt.vue";

import { isShowModalReceipt } from "@/store/composables";
export default {
  name: "Dashboard",
  components: {
    StoreMenu,
    PosRightNav,
    ModalReceipt,
  },
  setup() {
    return {
      isShowModalReceipt,
    };
  },
};
</script>
<template>
  <!-- page content -->
  <div class="flex-grow flex">
    <!-- store menu -->
    <store-menu></store-menu>
    <!-- end of store menu -->

    <pos-right-nav></pos-right-nav>
    <!-- modal receipt -->
    <modal-receipt v-show="isShowModalReceipt"></modal-receipt>

    <!-- PRINT_AREA -->
    <div id="print-area" class="print-area"></div>
  </div>
</template>
