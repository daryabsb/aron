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
      <div class="md:grid md:grid-cols-4">
        <div class="md:col-span-1 mr-2 inset-y-0">
          <products-side-card></products-side-card>
        </div>
        <div class="col-span-3 inset-y-0">
          <products-management></products-management>
        </div>
      </div>
    </div>
    <!-- <SideModal></SideModal> -->
  </div>
</template>
<script>
import { ref, onMounted } from "vue";
import useManagementStore from "@/Management/managementStore";
import productsAPI from "@/services/productsAPI";
// import SideModal from "@/components/shared/Modal.vue";

import ProductsModal from "@/Management/components/modals/ProductsModal.vue";
// import AroniumControlCenter from "@/components/shared/AroniumControlCenter.vue";

import ProductsHeader from "@/Management/components/Headers/ProductsHeader.vue";
import ProductsSideCard from "@/Management/components/Products/ProductsSideCard.vue";
// import ProductsSideCard from "@/Management/component components/products/ProductsSideCard.vue";
import ProductsManagement from "@/Management/components/Products/ProductsManagement.vue";

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
    // const store = useManagementStore()
    const products = ref([]);
    const loadProducts = async () => {
      try {
        const response = await productsAPI.getProducts();
        products.value = response.data;

        return response.data;
      } catch (error) {
        console.log(error);
      }
    };
    loadProducts();
    console.log("products from manage", products.value);
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
      products,
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
