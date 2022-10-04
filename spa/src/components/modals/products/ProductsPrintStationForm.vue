<template>
  <div class="flex flex-col py-3">
    <information-alert
      tip="License expired, please purchase a license to enable print stations functionality."
      color="danger"
    ></information-alert>
    <form>
      <div class="flex flex-col justify-start mt-3">
        <button
          class="h-7 w-48 bg-inherit text-sm px-3 mb-2 mr-2 border opacity-50 border-aronium-600"
          disabled
        >
          <i class="fa fa-print"></i>
          <span class="ml-3">Assign print station</span>
        </button>
        <select-input class="-ml-2 opacity-50" disabled></select-input>
      </div>

      <!-- END SECTION 1 CREATE PRODUCT -->
    </form>
  </div>
</template>

<script>
import { ref } from "vue";
import useCustomers from "@/composables/useGetProductGroups";

import SelectInput from "@/components/shared/forms/SelectInput.vue";
import InformationAlert from "@/components/shared/InformationAlert.vue";

export default {
  components: {
    SelectInput,
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
