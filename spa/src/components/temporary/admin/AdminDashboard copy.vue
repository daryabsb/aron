<template>
  <div>
    <div class="flex flex-wrap mt-24 bg-white">
      <div class="w-full xl:w-8/12 mb-12 xl:mb-0 px-4">
        <card-line-chart-three />
        <!-- <card-line-chart /> -->
      </div>
      <div class="w-full xl:w-3/12 px-4 inline-block">
        <div class="p-2 mt-6">
          <h2 class="text-3xl">Total Sale</h2>
          <h1 class="text-7xl">3.5K</h1>
          <p class="text-lg">Top performing</p>
          <h2 class="text-2xl font-medium">
            <span>SEPTEMBER</span>
            <br />
            <span>9,500 USD</span>
          </h2>
        </div>
      </div>
    </div>
    <div class="flex flex-wrap mt-4">
      <div class="w-full xl:w-8/12 mb-12 xl:mb-0 px-4">
        <card-page-visits />
      </div>
      <div class="w-full xl:w-4/12 px-4">
        <card-social-traffic />
      </div>
    </div>
  </div>
</template>
<script>
import CardLineChart from "@/components/Cards/CardLineChart.vue";
import CardBarChart from "@/components/Cards/CardBarChart.vue";
import CardPageVisits from "@/components/Cards/CardPageVisits.vue";
import CardSocialTraffic from "@/components/Cards/CardSocialTraffic.vue";
import CardLineChartThree from "@/components/Cards/CardLineChartThree.vue";
export default {
  name: "AdminDashboard",
  components: {
    CardLineChartThree,
    CardLineChart,
    CardBarChart,
    CardPageVisits,
    CardSocialTraffic,
  },
};
</script>
