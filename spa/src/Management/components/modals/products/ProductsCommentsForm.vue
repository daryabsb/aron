<template>
  <div class="flex flex-col py-3">
    <information-alert
      tip="Comments will be printed on kitchen tickets."
      color="sky"
    ></information-alert>
    <form>
      <div class="flex items-center -ml-2 mt-6">
        <div class="w-full mr-2">
          <text-input type="text" placeholder="Enter comment..."></text-input>
        </div>
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

import TextInput from "@/components/shared/forms/TextInput.vue";
import InformationAlert from "@/components/shared/InformationAlert.vue";

export default {
  components: {
    TextInput,
    InformationAlert,
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
