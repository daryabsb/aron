<template>
  <div class="grid grid-cols-8 grid-rows-9 bg-aronium-800 gap-1 h-full w-full">
    <products-modal
      v-if="closeModal"
      :modal-type="modalDataModule"
      @close="close"
    ></products-modal>
    <!-- <aronium-modal v-if="closeModal" @close="close"></aronium-modal> -->
    <!-- <aronium-control-center></aronium-control-center> -->
    <div class="container bg-inherit">
      <div class="">
        <products-header
          @open="(moduleName) => open(moduleName)"
        ></products-header>
      </div>
      <div class="flex flex-nowrap">
        <div class="basis-1/2 mr-3 w-full">
          <products-side-card class="pr-20"></products-side-card>
        </div>
        <div class="basis-1/2">
          <products-management></products-management>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref, onMounted } from "vue";

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
