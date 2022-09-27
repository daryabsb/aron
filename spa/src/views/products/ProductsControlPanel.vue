<template>
  <div class="flex flex-col h-full pt-20 pb-4 relative">
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
