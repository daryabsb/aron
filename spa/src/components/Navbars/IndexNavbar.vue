<template>
  <nav class="sm:hidden border border-solid top-0 fixed z-50 w-full p-3 shadow">
    <div
      class="py-3 bg-pink-700 px-4 pl-12 mr-auto flex flex-nowrap items-center justify-between"
    >
      <div class="mx-12">
        <router-link to="/">
          ARON - POS
        </router-link>
      </div>

      <a
        class="hover:text-slate-500 text-slate-700 px-3 py-2 flex items-center text-xs uppercase font-bold"
        href="https://www.creative-tim.com/learning-lab/tailwind/vue/overview/notus?ref=vn-index-navbar"
      >
        <i class="text-slate-400 far fa-file-alt text-lg leading-lg mr-2" />
        Docs
      </a>

      <div class="fixe left-0 ml-auto">
        <user-dropdown></user-dropdown>
      </div>
    </div>
  </nav>
</template>

<script>
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";

export default {
  components: {
    UserDropdown,
  },
  data() {
    return {
      navbarOpen: false,
    };
  },
  methods: {
    setNavbarOpen: function () {
      this.navbarOpen = !this.navbarOpen;
    },
  },
};
</script>
