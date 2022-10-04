<template>
  <div class="flex flex-col py-3">
    <div
      class="flex flex-row w-full h-20 rounded-sm border border-aronium-sky my-2"
    >
      <div class="">
        <span
          class="flex justify-center items-center w-12 h-full bg-aronium-sky"
        >
          <span
            class="flex justify-center items-center w-6 h-6 border border-aronium-white rounded-full"
          >
            <i class="fa fa-info"></i>
          </span>
        </span>
      </div>
      <div class="ml-3 p-1 text-sm">
        <p>
          Comments will be printed on kitchen tickets.
        </p>
        <p class="text-aronium-sky cursor-pointer">Learn more</p>
      </div>
    </div>
    <form>
      <div class="flex items-center -ml-2 mt-6">
        <div class="w-full mr-2">
          <text-input type="text" placeholder="Enter comment..."></text-input>
        </div>
        <!-- <div class="w-72 mr-2">
          <text-input-simple
            type="text"
            placeholder="Enter comment..."
          ></text-input-simple>
        </div> -->

        <button
          class="h-7 w-12 bg-inherit text-sm px-3 mb-2 mr-2 border border-aronium-600"
        >
          <i class="fa fa-plus"></i>
        </button>
        <button class="px-2 w-12 text-sm h-7 mb-2 border border-aronium-600">
          <i class="fa fa-trash"></i>
        </button>
      </div>

      <!-- END SECTION 1 CREATE PRODUCT -->
    </form>
    <div class="w-full h-96 border border-aronium-600">
      <ul class="list-disc list-inside font-light">
        <li class="cursor-pointer">
          This is a comment
        </li>
        <li class="ml-2">
          <span><a>This is a comment</a></span> | Zhian Water
        </li>
        <li class="ml-2">
          <span><a>This is a comment</a></span> | Zhian Water
        </li>
        <li class="ml-2">
          <span><a>This is a comment</a></span> | Zhian Water
        </li>
        <li class="ml-2">
          <span><a>This is a comment</a></span> | Zhian Water
        </li>
      </ul>
      <p>
        COMMENTS LIST
      </p>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import useCustomers from "@/composables/useGetProductGroups";

import TextInputSimple from "@/components/shared/forms/TextInputSimple.vue";
import TextInput from "@/components/shared/forms/TextInput.vue";

export default {
  components: {
    TextInputSimple,
    TextInput,
  },
  setup() {
    const barcode = ref("");
    const isLowStockWarning = ref(true);
    const generateBarcode = () => {
      barcode.value = "0101234567890128TEC-IT";
    };

    return {
      barcode,
      isLowStockWarning,
      generateBarcode,
      useCustomers,
    };
  },
};
</script>
