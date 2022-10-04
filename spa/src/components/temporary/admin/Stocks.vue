<template>
  <div class="flex flex-wrap">
    <div class="w-full px-4">
      <div
        class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded"
      >
        <div class="grid grid-rows-3 grid-flow-col gap-4">
          <div class="row-span-1 col-span-4 bg-pink-500">
            <custom-header />
          </div>
          <div class="row-span-2 col-span-1 col-start-3 bg-purple-500">
            <card-settings />
          </div>
          <div class="row-span-3 col-span-2 bg-emerald-300">
            <side-card />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import CustomHeader from "@/components/shared/CustomHeader.vue";
import CardSettings from "@/components/Cards/CardSettings.vue";
import SideCard from "@/components/shared/SideCard.vue";
export default {
  components: {
    CustomHeader,
    CardSettings,
    SideCard,
  },
};
</script>
