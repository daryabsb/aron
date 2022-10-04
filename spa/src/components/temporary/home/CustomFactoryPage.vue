<template>
  <div class="flex flex-col pt-20 pb-4 relative">
    <div class="flex flex-nowrap">
      <div class="mt-20">
        <side-bar></side-bar>
      </div>

      <div class="relative md:ml-64 block ml-20">
        <custom-grid-component />
      </div>
    </div>
  </div>
</template>

<script>
import SideBar from "@/components/Sidebar/Sidebar.vue";
import CustomGridComponent from "@/components/shared/CustomGridComponent.vue";
export default {
  components: {
    SideBar,
    CustomGridComponent,
  },
  setup() {},
};
</script>
