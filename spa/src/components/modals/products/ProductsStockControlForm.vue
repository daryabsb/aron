<template>
  <div class="py-3">
    <div
      class="flex flex-row w-full h-20 rounded-sm border border-aronium-sky my-2"
    >
      <div class="relative">
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
          Set low stock quantity rules that can be used as a stock reorder
          point.
        </p>
        <p class="text-aronium-sky cursor-pointer">Learn more</p>
      </div>
    </div>

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

        <div class="w-48">
          <text-input
            type="text"
            placeholder="Unit"
            label="Unit of measurement"
          ></text-input>
        </div>
      </div>
      <!-- END SECTION 1 CREATE PRODUCT -->
      <hr class="mt-6 border-b-1 border-zinc-600" />
      <div class="mb-2">
        <toggle-input target="active" label="Active" checked></toggle-input>
      </div>
      <div class="mb-2">
        <toggle-input
          target="default-uantity"
          label="Default quantity"
        ></toggle-input>
      </div>
      <div class="mb-2">
        <toggle-input
          target="service"
          label="Service (not using stock)"
        ></toggle-input>
      </div>
    </form>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
import useCustomers from "@/composables/useGetProductGroups";

import TextInput from "@/components/shared/forms/TextInput.vue";
import ToggleInput from "@/components/shared/forms/ToggleInput.vue";
import SelectInput from "@/components/shared/forms/SelectInput.vue";

export default {
  components: {
    TextInput,
    ToggleInput,
    SelectInput,
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
