<template>
  <custom-header />
  <div class="flex flex-wrap pr-4">
    <div class="w-full lg:w-4/12">
      <side-card />
    </div>
    <div class="w-full lg:w-8/12">
      <CardSettings />
    </div>
  </div>
</template>
<script>
import CardSettings from "@/components/Cards/CardSettings.vue";
import SideCard from "@/components/shared/SideCard.vue";
import CustomHeader from "@/components/shared/CustomHeader.vue";

export default {
  components: {
    CustomHeader,
    CardSettings,
    SideCard,
  },
};
</script>
