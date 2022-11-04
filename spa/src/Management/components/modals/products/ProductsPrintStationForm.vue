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
        <select-input class="-ml-2 opacity-50" :items="usePrinterList">
          <template #select>
            <select
              v-model="value"
              class="bg-inherit relative text-aronium-white w-full py-1 mb-1 text-sm"
              name="itemsSelect"
            >
              <option
                :value="0"
                class="bg-aronium-800 text-aronium-white w-full"
                >(none)</option
              >

              <option
                v-for="item in usePrinterList"
                :key="item"
                class="bg-aronium-800 text-aronium-white w-full"
                :value="item"
              >
                {{ item }}
              </option>
            </select>
          </template>
        </select-input>
      </div>

      <!-- END SECTION 1 CREATE PRODUCT -->
    </form>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
import {
  usePrinterList,
  useFetchPrinterListDispatch,
} from "@/store/composables";

import SelectInput from "@/components/shared/forms/SelectInput.vue";
import InformationAlert from "@/components/shared/InformationAlert.vue";

export default {
  components: {
    SelectInput,
    InformationAlert,
  },
  setup() {
    onMounted(useFetchPrinterListDispatch);

    const value = ref("");

    return {
      usePrinterList,
      value,
    };
  },
};
</script>
