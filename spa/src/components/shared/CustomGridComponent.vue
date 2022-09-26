<template>
  <div
    class="min-h-screen grid grid-cols-12 auto-rows-max grid-rows-12 gap-4 m-4"
  >
    <div class="row-start-1 row-span-2 col-start-1 col-span-12 h-20">
      <custom-header />
    </div>
    <div class="row-start-3 row-span-9 col-start-1 col-span-3">
      <side-card />
    </div>
    <div class="row-start-3 row-span-9 col-start-4 col-span-9">
      <card-settings />
    </div>
    <div
      class="row-start-11 row-span-1 col-start-1 col-span-12 bg-pink-50 h-20"
    >
      <footer-admin />
    </div>
  </div>
</template>
<script>
import CustomHeader from "@/components/shared/CustomHeader.vue";
import SideCard from "@/components/shared/SideCard.vue";
import CardSettings from "@/components/Cards/CardSettings.vue";
import FooterAdmin from "@/components/Footers/FooterAdmin.vue";
export default {
  components: {
    CustomHeader,
    SideCard,
    CardSettings,
    FooterAdmin,
  },
  setup() {},
};
</script>
