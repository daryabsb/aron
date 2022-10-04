<template>
  <div class="h-screen grid grid-cols-8 grid-rows-12 bg-aronium-800 gap-1">
    <aronium-modal-template
      v-if="closeModal"
      :modal-type="modalDataModule"
      @close="close"
    ></aronium-modal-template>
    <!-- <aronium-modal v-if="closeModal" @close="close"></aronium-modal> -->
    <div class="text-white row-start-1 row-span-1 col-start-1 col-span-8">
      <aronium-navbar />
      <!-- Sidebar -->
    </div>

    <div
      class="row-start-2 row-span-10 col-start-1 col-span-1 border border-aronium-600"
    >
      <aronium-sidebar></aronium-sidebar>
    </div>

    <div class="row-start-2 row-span-1 col-start-2 col-span-7">
      <aronium-header @open="(moduleName) => open(moduleName)"></aronium-header>
    </div>
    <div class="row-start-3 row-span-9 col-start-2 col-span-1">
      <aronium-side-card></aronium-side-card>
    </div>
    <div class="row-start-3 row-span-9 col-start-3 col-span-6">
      <aronium-products-management></aronium-products-management>
    </div>
    <div class="row-start-12 row-span-1 col-start-1 col-span-8">
      <aronium-footer></aronium-footer>
    </div>
  </div>
</template>
<script>
import { ref, onMounted } from "vue";
import AroniumNavbar from "@/components/temporary/AroniumNavbar.vue";
import AroniumHeader from "@/components/shared/AroniumHeader.vue";
import AroniumSidebar from "@/components/Sidebar/AroniumSidebar.vue";
import AroniumSideCard from "@/components/shared/AroniumSideCard.vue";
import AroniumFooter from "@/components/temporary/AroniumFooter.vue";
import AroniumProductsManagement from "@/components/Cards/AroniumProductsManagement.vue";
import AroniumModalTemplate from "@/components/shared/AroniumModalTemplate.vue";

import { useFetchProductGroupsDispatch } from "@/store/composables";
import useGetProductGroups from "@/composables/useGetProductGroups";

export default {
  components: {
    AroniumNavbar,
    AroniumSidebar,
    AroniumHeader,
    AroniumSideCard,
    AroniumProductsManagement,
    AroniumFooter,
    AroniumModalTemplate,
  },
  emits: ["close"],
  setup() {
    onMounted(useFetchProductGroupsDispatch);
    const closeModal = ref(false);
    const modalDataModule = ref("");
    const close = () => (closeModal.value = false);
    const open = (moduleName) => {
      modalDataModule.value = moduleName;

      closeModal.value = true;
    };

    const isSideBar = ref(true);

    return {
      useGetProductGroups,
      close,
      open,
      closeModal,
      modalDataModule,
      isSideBar,
    };
  },
};
</script>
