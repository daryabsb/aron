<template>
  <div class="bg-gray-200">
    <div>
      <!-- <div class="grid grid-cols-12 grid-rows-12 gap-3 p-2"></div> -->
      <aronium-control-center></aronium-control-center>
    </div>
  </div>
</template>
<script>
import AroniumControlCenter from "@/components/shared/AroniumControlCenter.vue";
export default {
  name: "ProductsManagementLayout",
  components: {
    AroniumControlCenter,
  },
};
</script>
