<template>
  <div class="h-full overflow-hidden bg-aronium-800">
    <!-- <aronium-modal-template
      v-if="closeModal"
      :modal-type="modalDataModule"
      @close="close"
    ></aronium-modal-template> -->
    <!-- <aronium-modal v-if="closeModal" @close="close"></aronium-modal> -->
    <div class="text-white">
      <management-header />
      <!-- Sidebar -->
    </div>

    <!-- <div
      class="row-start-2 row-span-10 col-start-1 col-span-1 border border-aronium-600"
    >
      <management-sidebar v-if="fullSideBar"></management-sidebar>
      <management-sidebar-refactor v-else></management-sidebar-refactor>
    </div> -->

    <router-view></router-view>

    <div class="row-start-12 row-span-1 col-start-1 col-span-8">
      <management-footer></management-footer>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import ManagementHeader from "@/components/Headers/ManagementHeader.vue";
import ManagementNavbar from "@/components/Navbars/ManagementNavbar.vue";
import ManagementSidebar from "@/components/Sidebar/ManagementSidebar.vue";
import ManagementSidebarRefactor from "@/components/Sidebar/ManagementSidebarRefactor.vue";
import ManagementFooter from "@/components/Footers/ManagementFooter.vue";
export default {
  components: {
    ManagementHeader,
    ManagementSidebar,
    ManagementSidebarRefactor,
    ManagementFooter,
  },
  setup() {
    const fullSideBar = ref(true);

    return {
      fullSideBar,
    };
  },
};
</script>
