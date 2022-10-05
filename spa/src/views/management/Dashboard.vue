<template>
  <div>
    <div class="m-2">
      <!-- <div class="w-full xl:w-3/12 px-4">
        <card-social-traffic />
      </div> -->
      <!-- <div class="w-full mb-12 xl:mb-0 px-2"> -->
      <dashboard-line-chart />
      <!-- </div> -->
    </div>
    <div class="flex flex-wrap">
      <div class="w-full xl:w-3/12 px-4 h-72">
        <dashboard-bar-chart />
      </div>
      <div class="w-full xl:w-9/12 mb-12 xl:mb-0 px-2">
        <dashboard-line-chart />
      </div>
    </div>
    <div class="flex flex-wrap mt-4">
      <div class="w-full xl:w-3/12 px-4">
        <dashboard-social-traffic />
      </div>
      <div class="w-full xl:w-9/12 mb-12 xl:mb-0 px-2">
        <dashboard-page-visits />
      </div>
    </div>
  </div>
</template>
<script>
import DashboardLineChart from "@/components/management/dashboard/DashboardLineChart.vue";
import DashboardBarChart from "@/components/management/dashboard/DashboardBarChart.vue";
import DashboardPageVisits from "@/components/management/dashboard/DashboardPageVisits.vue";
import DashboardSocialTraffic from "@/components/management/dashboard/DashboardSocialTraffic.vue";
export default {
  name: "DashboardPage",
  components: {
    DashboardLineChart,
    DashboardBarChart,
    DashboardPageVisits,
    DashboardSocialTraffic,
  },
};
</script>
