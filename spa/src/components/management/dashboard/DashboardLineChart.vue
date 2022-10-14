<template>
  <div
    class="relative flex flex-col min-w-0 break-words h-64 w-full mb-6 bg-inherit py-2 px-12"
  >
    <div class="rounded-t mb-0 px-2 py-3 bg-transparent">
      <div class="flex flex-wrap items-center">
        <div class="relative w-full max-w-full flex-grow flex-1">
          <h2 class="text-pink-700 text-xl font-semibold">
            Sales value
          </h2>
        </div>
      </div>
    </div>
    <div class="flex-auto">
      <!-- Chart -->
      <vue3-chart-js :height="32" v-bind="{ ...lineChart }" />
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import Vue3ChartJs from "@j-t-mcc/vue3-chartjs";
import zoomPlugin from "chartjs-plugin-zoom";
// import dataLabels from "chartjs-plugin-datalabels";

import { lineChart } from "@/composables/staticData";

// globally registered and available for all charts
Vue3ChartJs.registerGlobalPlugins([zoomPlugin]);

export default {
  components: {
    Vue3ChartJs,
  },
  setup() {
    const labelsOn = ref(false);
    return {
      lineChart,
      labelsOn,
    };
  },
};
</script>
