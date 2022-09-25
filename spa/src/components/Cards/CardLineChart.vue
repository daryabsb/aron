<template>
  <div
    class="relative flex flex-col min-w-0 break-words h-95 w-full mb-6 shadow-lg rounded bg-white py-2 px-12"
  >
    <div class="rounded-t mb-0 px-2 py-3 bg-transparent">
      <div class="flex flex-wrap items-center">
        <div class="relative w-full max-w-full flex-grow flex-1">
          <h6 class="uppercase text-blueGray-100 mb-1 text-xs font-semibold">
            Overview
          </h6>
          <h2 class="text-pink-700 text-xl font-semibold">
            Sales value
          </h2>
        </div>
      </div>
    </div>
    <div class="flex-auto">
      <!-- Chart -->
      <vue3-chart-js :height="64" v-bind="{ ...lineChart }" />
    </div>
  </div>
</template>
<script>
import Vue3ChartJs from "@j-t-mcc/vue3-chartjs";
import zoomPlugin from "chartjs-plugin-zoom";
import dataLabels from "chartjs-plugin-datalabels";

// globally registered and available for all charts
Vue3ChartJs.registerGlobalPlugins([zoomPlugin]);

export default {
  components: {
    Vue3ChartJs,
  },
  setup() {
    const lineChart = {
      type: "line",
      // locally registered and available for this chart
      plugins: [dataLabels],
      data: {
        labels: [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
        ],
        datasets: [
          {
            label: "Caffine Consumption",
            data: [65, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: "#41B883",
            backgroundColor: "pink",
          },
          {
            label: "Productivity",
            data: [70, 25, 110, 90, 5, 60, 30],
            fill: false,
            borderColor: "#00D8FF",
            tension: 0.5,
            backgroundColor: "purple",
          },
        ],
      },
      options: {
        plugins: {
          zoom: {
            zoom: {
              wheel: {
                enabled: true,
              },
              pinch: {
                enabled: true,
              },
              mode: "y",
            },
          },
          datalabels: {
            backgroundColor: function (context) {
              return context.dataset.backgroundColor;
            },
            borderRadius: 4,
            color: "white",
            font: {
              weight: "bold",
            },
            formatter: Math.round,
            padding: 6,
          },
        },
      },
    };

    return {
      lineChart,
    };
  },
};
</script>
