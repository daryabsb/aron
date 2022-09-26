<template>
  <div class="flex flex-col h-screen bg-pink-50 pt-20 pb-24 relative">
    <div class="flex flex-nowrap">
      <custom-grid-component />
    </div>
  </div>
</template>

<script>
import CustomGridComponent from "@/components/shared/CustomGridComponent.vue";
export default {
  components: {
    CustomGridComponent,
  },
  setup() {},
};
</script>
