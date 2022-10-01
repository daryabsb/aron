<template>
  <div class="bg-gray-200">
    <div>
      <aronium-control-center></aronium-control-center>
    </div>
  </div>
</template>
<script>
import AroniumControlCenter from "@/components/shared/AroniumControlCenter.vue";
// import ModalTemplate from "@/components/shared/ModalTemplate.vue";

export default {
  name: "ProductsManagementLayout",
  components: {
    // ModalTemplate,
    AroniumControlCenter,
  },
  setup() {},
};
</script>
