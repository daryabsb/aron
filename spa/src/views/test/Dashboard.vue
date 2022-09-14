<template>
  <div>
    <div class="flex flex-wrap">
      <div class="w-full lg:w-9/12 mb-3 xl:mb-0 px-3">
        <card-table></card-table>
        <!-- <card-line-chart /> -->
      </div>
      <div class="w-full lg:w-3/12 px-3">
        <card-bar-chart />
      </div>
    </div>
    <div class="flex flex-wrap mt-3">
      <div class="w-full lg:w-9/12 mb-12 xl:mb-0 px-3">
        <card-page-visits />
      </div>
      <div class="w-full lg:w-3/12 px-3">
        <card-social-traffic />
      </div>
    </div>
  </div>
</template>
<script>
// import CardLineChart from "@/components/Cards/CardLineChart.vue";
import CardTable from "@/components/Cards/TestCardTable.vue";
import CardBarChart from "@/components/Cards/CardBarChart.vue";
import CardPageVisits from "@/components/Cards/CardPageVisits.vue";
import CardSocialTraffic from "@/components/Cards/CardSocialTraffic.vue";
export default {
  name: "DashboardPage",
  components: {
    // CardLineChart,
    CardTable,
    CardBarChart,
    CardPageVisits,
    CardSocialTraffic,
  },
};
</script>
