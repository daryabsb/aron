<template>
  <div
    class="max-h-screen overflow-auto grid grid-cols-12 grid-rows-12 p-1 bg-zinc-700"
  >
    <div class="text-white row-start-1 row-span-2 col-start-1 col-span-12">
      <aronium-navbar />
      <!-- Sidebar -->
    </div>

    <div
      class="text-white row-start-3 row-span-5 col-start-1 col-span-2 h-full m-1"
    >
      <aronium-sidebar></aronium-sidebar>
    </div>

    <div class="text-white col-start-3 col-span-10 row-start-3 row-span-2 m-1">
      <aronium-header></aronium-header>
    </div>
    <div class="text-white row-start-5 row-span-6 col-start-3 col-span-2 m-1">
      <aronium-side-card></aronium-side-card>
    </div>
    <div class="text-white row-start-5 row-span-6 col-start-5 col-span-8 m-1">
      <aronium-products-management></aronium-products-management>
    </div>
    <div class="text-white row-start-10 row-span-2 col-start-1 col-span-12 m-1">
      <aronium-footer></aronium-footer>
    </div>
  </div>
</template>
<script>
import AroniumNavbar from "@/components/Navbars/AroniumNavbar.vue";
import AroniumHeader from "@/components/shared/AroniumHeader.vue";
import AroniumSidebar from "@/components/Sidebar/AroniumSidebar.vue";
import AroniumSideCard from "@/components/shared/AroniumSideCard.vue";
import AroniumFooter from "@/components/Footers/AroniumFooter.vue";
import AroniumProductsManagement from "@/components/Cards/AroniumProductsManagement.vue";

export default {
  components: {
    AroniumNavbar,
    AroniumSidebar,
    AroniumHeader,
    AroniumSideCard,
    AroniumProductsManagement,
    AroniumFooter,
  },
  setup() {},
};
</script>
