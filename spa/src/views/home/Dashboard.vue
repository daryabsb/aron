<template>
  <div>
    <div class="flex flex-wrap mt-48">
      <div
        class="w-full xl:w-8/12 mb-2 xl:h-screen md:overflow-hidden p-2 ml-24 bg-slate-800"
      >
        <card-table></card-table>
      </div>
      <div
        class="w-full xl:w-4/12 mb-2 xl:h-screen p-2 xl:mx-2 px-4 bg-slate-800"
      >
        <h1>This is the side window of the page</h1>
      </div>
    </div>
    <div class="flex flex-wrap mt-4">
      <div class="w-full xl:w-8/12 mb-12 xl:mb-0 px-4"></div>
      <div class="w-full xl:w-4/12 px-4"></div>
    </div>
  </div>
</template>
<script>
import {onMounted} from "vue"
import {useFetchProductsDispatch} from "@/store/composables"
import CardTable from "@/components/Cards/CardTable.vue";
export default {
  name: "DashboardPage",
  components: {
    CardTable,
  },
  setup() {
    onMounted(useFetchProductsDispatch)
  }
};
</script>
