<template>
  <!-- Header -->
  <div class="relative bg-emerald-600 md:pt-32 pb-32 pt-12">
    <div class="px-4 md:px-10 mx-auto w-full">
      <div>
        <!-- Card stats -->
        <div class="flex flex-wrap">
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats
              stat-subtitle="TRAFFIC"
              stat-title="350,897"
              stat-arrow="up"
              stat-percent="3.48"
              stat-percent-color="text-emerald-500"
              stat-descripiron="Since last month"
              stat-icon-name="far fa-chart-bar"
              stat-icon-color="bg-red-500"
            />
          </div>
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats
              stat-subtitle="NEW USERS"
              stat-title="2,356"
              stat-arrow="down"
              stat-percent="3.48"
              stat-percent-color="text-red-500"
              stat-descripiron="Since last week"
              stat-icon-name="fas fa-chart-pie"
              stat-icon-color="bg-orange-500"
            />
          </div>
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats
              stat-subtitle="SALES"
              stat-title="924"
              stat-arrow="down"
              stat-percent="1.10"
              stat-percent-color="text-orange-500"
              stat-descripiron="Since yesterday"
              stat-icon-name="fas fa-users"
              stat-icon-color="bg-pink-500"
            />
          </div>
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats
              stat-subtitle="PERFORMANCE"
              stat-title="49,65%"
              stat-arrow="up"
              stat-percent="12"
              stat-percent-color="text-emerald-500"
              stat-descripiron="Since last month"
              stat-icon-name="fas fa-percent"
              stat-icon-color="bg-emerald-500"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CardStats from "@/components/Cards/CardStats.vue";

export default {
  components: {
    CardStats,
  },
};
</script>
