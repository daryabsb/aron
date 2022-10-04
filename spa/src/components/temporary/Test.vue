<template>
  <div>
    <sidebar />
    <div class="relative md:ml-64 bg-slate-100">
      <admin-navbar />
      <test-header-stats />
      <div class="px-4 md:px-10 mx-auto w-full -m-24">
        <router-view />
        <footer-admin />
      </div>
    </div>
  </div>
</template>
<script>
import AdminNavbar from "@/components/temporary/AdminNavbar.vue";
import Sidebar from "@/components/Sidebar/Sidebar.vue";
import TestHeaderStats from "@/components/temporary/TestHeaderStats.vue";
import FooterAdmin from "@/components/temporary/FooterAdmin.vue";
export default {
  name: "TestLayout",
  components: {
    AdminNavbar,
    Sidebar,
    TestHeaderStats,
    FooterAdmin,
  },
};
</script>
