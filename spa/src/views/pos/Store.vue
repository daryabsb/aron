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
  <div class="h-full flex flex-col bg-transparent border border-aronium-600">
    <!-- store menu -->
    <!-- <pos-right-nav></pos-right-nav> -->
    <search-input></search-input>

    <store-menu></store-menu>
  </div>
</template>
