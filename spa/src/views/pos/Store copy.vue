<script>
import StoreMenu from "@/components/pos/StoreMenu.vue";
import PosRightNav from "@/components/pos/PosRightNav.vue";

export default {
  name: "Store",
  components: {
    StoreMenu,
    PosRightNav,
  },
  setup() {
    return {};
  },
};
</script>
<template>
  <!-- page content -->
  <div class="flex-grow flex">
    <!-- store menu -->
    <store-menu></store-menu>
    <!-- <store-menu></store-menu> -->
    <!-- end of store menu -->

    <pos-right-nav></pos-right-nav>
    <!-- modal receipt -->
    <!-- <modal-receipt v-show="isShowModalReceipt"></modal-receipt> -->
  </div>
</template>
