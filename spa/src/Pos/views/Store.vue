<script>
import StoreMenu from "@/Pos/components/StoreMenu.vue";
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

  <div class="bg-transparent">
    <!-- store menu -->
    <!-- <pos-right-nav></pos-right-nav> -->
    <search-input></search-input>
    <Suspense>
      <template #default>
        <store-menu></store-menu>
      </template>
      <template #fallback>
        <div class="h-64 p-1 bg-aronium-white animate-pulse">
          <div
            class="h-full select-none cursor-pointer transition-shadow overflow-hidden border-2 border-solid border-aronium-500 rounded-sm bg-aronium-900 hover:shadow-xl"
          >
            <div
              class="flex items-center justify-center h-3/4 w-48 overflow-hidden bg-aronium-500"
            >
              <span class="text-6xl">
                <i class="fa fa-cart-circle-arrow-down"></i>
                <i class="fa-solid fa-cart-shopping"></i>
              </span>
            </div>
          </div>
        </div>
      </template>
    </Suspense>
  </div>
</template>
