<template>
  <div class="h-screen grid grid-cols-8 grid-rows-12 bg-aronium-800 gap-2">
    <!-- <aronium-modal-template
      v-if="closeModal"
      :modal-type="modalDataModule"
      @close="close"
    ></aronium-modal-template> -->
    <!-- <aronium-modal v-if="closeModal" @close="close"></aronium-modal> -->
    <div class="text-white row-start-1 row-span-1 col-start-1 col-span-8">
      <management-navbar />
      <!-- Sidebar -->
    </div>
    <!-- <products-modal></products-modal> -->

    <div
      class="row-start-2 row-span-10 col-start-1 col-span-1 border border-aronium-600"
    >
      <management-sidebar></management-sidebar>
    </div>
    <div class="row-start-2 row-span-9 col-start-2 col-span-7">
      <router-view></router-view>
    </div>

    <div class="row-start-12 row-span-1 col-start-1 col-span-8">
      <management-footer></management-footer>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";

import ManagementNavbar from "@/components/Navbars/ManagementNavbar.vue";
import ManagementSidebar from "@/components/Sidebar/ManagementSidebar.vue";
import ManagementFooter from "@/components/Footers/ManagementFooter.vue";
import ProductsModal from "@/components/modals/ProductsModal.vue";
export default {
  components: {
    ProductsModal,
    ManagementNavbar,
    ManagementSidebar,
    ManagementFooter,
  },
  setup() {
    const fullSideBar = ref(true);

    const open = ref(true);

    return {
      fullSideBar,
      open,
    };
  },
};
</script>
