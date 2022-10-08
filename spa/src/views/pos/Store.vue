<script>
import StoreMenu from "@/components/pos/StoreMenu.vue";
import SearchInput from "@/components/shared/SearchInput.vue";

export default {
  name: "Store",
  components: {
    StoreMenu,
    SearchInput,
  },
  setup() {
    return {};
  },
};
</script>
<template>
  <!-- page content -->

  <div class="bg-transparent border border-aronium-500">
    <!-- store menu -->
    <!-- <pos-right-nav></pos-right-nav> -->
    <search-input></search-input>

    <store-menu></store-menu>
  </div>
</template>
