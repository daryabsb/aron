<template>
  <div class="bg-gray-200">
    <div>
      <aronium-modal></aronium-modal>
      <aronium-control-center></aronium-control-center>
    </div>
  </div>
</template>
<script>
import AroniumControlCenter from "@/components/shared/AroniumControlCenter.vue";
import AroniumModal from "@/components/modals/AroniumModal.vue";
// import ModalTemplate from "@/components/shared/ModalTemplate.vue";

export default {
  name: "ProductsManagementLayout",
  components: {
    // ModalTemplate,
    AroniumModal,
    AroniumControlCenter,
  },
};
</script>
