<template>
  <div class="bg-white w-full h-full z-24">
    <vue3-chart-js v-bind="{ ...lineChart }" />
  </div>
</template>

<script>
import Vue3ChartJs from "@j-t-mcc/vue3-chartjs";
import zoomPlugin from "chartjs-plugin-zoom";
import dataLabels from "chartjs-plugin-datalabels";

// globally registered and available for all charts
Vue3ChartJs.registerGlobalPlugins([zoomPlugin]);

export default {
  name: "App",
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
