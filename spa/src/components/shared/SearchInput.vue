<script>
import { ref } from "vue";
import { updateKeyword } from "@/store/composables";
export default {
  setup() {
    const keyword = ref("");
    return {
      keyword,
      updateKeyword,
    };
  },
};
</script>
<template>
  <div class="h-11 border border-aronium-500">
    <!-- NEW SEARCH INPUT -->

    <div class="flex flex-nowrap">
      <span class="text-xs h-full py-3 px-3 border-r border-aronium-600">
        <i class="fa fa-barcode"></i>
      </span>
      <span class="text-xs h-full py-3 px-3 border-r border-aronium-600">
        123
      </span>
      <span class="text-xs h-full py-3 px-3 border-r border-aronium-600">
        <i class="fa fa-tags"></i>
      </span>

      <input
        v-model="keyword"
        class="w-full border-0 placeholder:italic placeholder:text-aronium-600 placeholder:text-2sm h-10 bg-inherit p-3 sm:text-sm"
        placeholder="Search for anything..."
        type="text"
        @keyup="updateKeyword(keyword)"
      />

      <span class="flex items-center mx-2">
        <i class="fa fa-search"></i>
      </span>
      <span class="flex items-center mx-2">
        <i class="fa fa-keyboard"></i>
      </span>
    </div>
  </div>
  <!-- END NEW INPUT -->
</template>
