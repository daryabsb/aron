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
  <div class="flex px-2 flex-row relative">
    <div
      class="absolute left-3 top-3 m-2 p-2 rounded-full bg-pink-500 text-white"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-5 w-5"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
        />
      </svg>
    </div>
    <input
      v-model="keyword"
      type="text"
      class="bg-white rounded-lg border-none shadow text-lg w-full h-12 pl-16 focus:outline-pink-500 focus:shadow-lg"
      placeholder="Barcode, Name, Picture, anything at all ..."
      @keyup="updateKeyword(keyword)"
    />
  </div>
</template>
