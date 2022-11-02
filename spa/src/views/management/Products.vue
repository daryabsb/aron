<template>
  <div class="bg-aronium-800 h-full w-full">
    <products-modal
      :modal-type="modalDataModule"
      :open="closeModal"
      @close="close"
    ></products-modal>
    <!-- <aronium-modal v-if="closeModal" @close="close"></aronium-modal> -->
    <!-- <aronium-control-center></aronium-control-center> -->
    <div class="bg-inherit h-full">
      <div class="py-3">
        <products-header
          @open="(moduleName) => open(moduleName)"
        ></products-header>
      </div>
      <div class="grid grid-cols-12 grid-rows-12 place-content-stretch h-full">
        <div class="row-start-1 row-span-12 col-start-1 col-span-2 mr-2 h-full">
          <products-side-card></products-side-card>
        </div>
        <div class="row-start-1 row-span-12 col-start-3 col-span-10 h-full">
          <products-management></products-management>
        </div>
      </div>
    </div>
    <!-- <SideModal></SideModal> -->
  </div>
</template>
<script>
import { ref, onMounted } from "vue";

// import SideModal from "@/components/shared/Modal.vue";

import ProductsModal from "@/components/modals/ProductsModal.vue";
// import AroniumControlCenter from "@/components/shared/AroniumControlCenter.vue";

import ProductsHeader from "@/components/Headers/ProductsHeader.vue";
import ProductsSideCard from "@/components/products/ProductsSideCard.vue";
import ProductsManagement from "@/components/products/ProductsManagement.vue";

import { useFetchProductGroupsDispatch } from "@/store/composables";
import useGetProductGroups from "@/composables/useGetProductGroups";

export default {
  name: "ProductsManagementView",
  components: {
    // SideModal,
    ProductsHeader,
    ProductsSideCard,
    ProductsManagement,
    ProductsModal,

    // AroniumControlCenter,
  },
  setup() {
    onMounted(useFetchProductGroupsDispatch);
    const closeModal = ref(false);
    const modalDataModule = ref("");
    const close = () => {
      closeModal.value = false;
      console.log("close called");
    };
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
