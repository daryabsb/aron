<template>
  <div class="bg-gray-200">
    <sidebar />
    <div class="relative md:ml-64 bg-blue-gray-50">
      <admin-navbar />
      <div class="mx-auto w-full">
        <router-view />
      </div>
    </div>
  </div>
</template>
<script>
import AdminNavbar from "@/components/temporary/AdminNavbar.vue";
import Sidebar from "@/components/Sidebar/Sidebar.vue";
export default {
  name: "AdminLayout",
  components: {
    AdminNavbar,
    Sidebar,
  },
};
</script>
