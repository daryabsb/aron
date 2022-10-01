<template>
  <div
    class="max-h-screen overflow-auto grid grid-cols-12 grid-rows-12 p-1 bg-zinc-700"
  >
    <aronium-modal v-if="closeModal" @close="close"></aronium-modal>

    <div class="text-white row-start-1 row-span-2 col-start-1 col-span-12">
      <aronium-navbar />
      <!-- Sidebar -->
    </div>

    <div
      class="text-white row-start-3 row-span-5 col-start-1 col-span-2 h-full m-1"
    >
      <aronium-sidebar></aronium-sidebar>
    </div>
    <div class="container flex flex-col gap-2 mt-2 ml-1 min-w-screen">
      <div class="flex flex-grow-0 lg:w-full">
        <aronium-header @open="open"></aronium-header>
      </div>

      <div class="grid grid-cols-8 grid-rows-1 gap-2 w-full">
        <div class="col-span-2 w-full">
          <aronium-side-card></aronium-side-card>
        </div>
        <div>
          <aronium-products-management></aronium-products-management>
        </div>
      </div>
    </div>

    <div
      class="text-white row-start-5 row-span-6 col-start-3 col-span-full m-1"
    ></div>
    <!-- <div class="text-white row-start-5 row-span-6 col-start-3 col-span-2 m-1">
      
    </div>
    <div
      class="text-white row-start-5 row-span-6 col-start-5 auto-cols-max m-1"
    >
      
    </div> -->
    <div class="text-white row-start-10 row-span-2 col-start-1 col-span-12 m-1">
      <aronium-footer></aronium-footer>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import AroniumNavbar from "@/components/Navbars/AroniumNavbar.vue";
import AroniumHeader from "@/components/shared/AroniumHeader.vue";
import AroniumSidebar from "@/components/Sidebar/AroniumSidebar.vue";
import AroniumSideCard from "@/components/shared/AroniumSideCard.vue";
import AroniumFooter from "@/components/Footers/AroniumFooter.vue";
import AroniumProductsManagement from "@/components/Cards/AroniumProductsManagement.vue";
import AroniumModal from "@/components/modals/AroniumModal.vue";

export default {
  components: {
    AroniumNavbar,
    AroniumSidebar,
    AroniumHeader,
    AroniumSideCard,
    AroniumProductsManagement,
    AroniumFooter,
    AroniumModal,
  },
  setup() {
    const closeModal = ref(false);
    const close = () => (closeModal.value = false);
    const open = () => (closeModal.value = true);

    const isSideBar = ref(true);

    return {
      close,
      open,
      closeModal,
      isSideBar,
    };
  },
};
</script>
