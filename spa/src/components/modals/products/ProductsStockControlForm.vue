<template>
  <div class="py-3">
    <information-alert
      tip="Set low stock quantity rules that can be used as a stock reorder
          point."
    ></information-alert>

    <form>
      <div class="flex flex-col">
        <div class="w-96">
          <select-input
            label="Supplier"
            :items="useCustomers"
            required
          ></select-input>
        </div>
        <div class="w-32">
          <text-input
            type="text"
            placeholder="0"
            label="Reorder point"
          ></text-input>
        </div>
        <div class="w-32">
          <text-input
            type="text"
            placeholder="0"
            label="Preferred quantity"
          ></text-input>
        </div>
        <div class="mb-2">
          <toggle-input
            v-model="isLowStockWarning"
            target="low-stok-warning"
            label="Low stock warning"
          ></toggle-input>
        </div>
        <div class="mb-2">
          <text-input
            type="text"
            placeholder="Barcode"
            label="Low stock warning quantity"
            :disabled="isLowStockWarning"
          >
            <template #validation>
              <p class="cursor-pointer" @click="generateBarcode">
                Reset to default
              </p>
            </template>
          </text-input>
        </div>
      </div>
      <!-- END SECTION 1 CREATE PRODUCT -->
    </form>
  </div>
</template>

<script>
import { ref } from "vue";
import useCustomers from "@/composables/useGetProductGroups";

import TextInput from "@/components/shared/forms/TextInput.vue";
import ToggleInput from "@/components/shared/forms/ToggleInput.vue";
import SelectInput from "@/components/shared/forms/SelectInput.vue";
import InformationAlert from "@/components/shared/InformationAlert.vue";

export default {
  components: {
    TextInput,
    ToggleInput,
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
