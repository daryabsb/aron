<template>
  <div class="py-3">
    <form>
      <div class="flex flex-col">
        <div class="w-96">
          <text-input
            type="text"
            placeholder="Product name"
            label="Name"
            required
          ></text-input>
        </div>
        <div class="w-96">
          <select-input
            label="Product Group"
            :items="useGetProductGroups"
            required
          ></select-input>
        </div>
        <div class="w-32">
          <text-input
            type="text"
            placeholder="Internal code"
            label="Code"
          ></text-input>
        </div>

        <text-input type="text" placeholder="Barcode" label="Barcode">
          <template #validation>
            <p class="cursor-pointer" @click="generateBarcode">
              Generate barcode
            </p>
          </template>
        </text-input>
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
import { ref } from "vue";
import useGetProductGroups from "@/composables/useGetProductGroups";

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
    const generateBarcode = () => {
      barcode.value = "0101234567890128TEC-IT";
    };

    return {
      barcode,
      generateBarcode,
      useGetProductGroups,
    };
  },
};
</script>
