<template>
  <div class="flex flex-col h-screen">
    <sidebar v-if="sidebarOpen" />
    <admin-navbar />
    <router-view />
  </div>
</template>

<script>
import Sidebar from "@/components/Sidebar/Sidebar.vue";
import { onMounted } from "vue";
import { useFetchUserDispatch } from "@/store/composables";
import useGetUser from "@/composables/useGetUser";

import IndexNavbar from "@/components/temporary/IndexNavbar.vue";
import AdminNavbar from "@/components/temporary/AdminNavbar.vue";
export default {
  name: "HomeLayout",
  components: {
    AdminNavbar,
    IndexNavbar,
    Sidebar,
  },
  setup() {
    const sidebarOpen = false;
    onMounted(useFetchUserDispatch);
    let collapseShow = "hidden";
    const toggleCollapseShow = (classes) => (collapseShow = classes);

    const user = useGetUser();

    return { collapseShow, sidebarOpen, user, toggleCollapseShow };
  },
};
</script>
