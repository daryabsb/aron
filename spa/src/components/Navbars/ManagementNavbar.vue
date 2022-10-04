<template>
  <!-- Navbar -->
  <nav
    class="bg-aronium-900 border-b border-aronium-600 md:flex-row md:flex-nowrap md:justify-start flex items-center w-full"
  >
    <div
      class="w-full mx-autp items-center flex justify-between md:flex-nowrap flex-wrap md:px-10 py-2 px-4"
    >
      <span>
        <i class="fa fa-arrow-left text-white text-xl font-bold pr-6"></i>
      </span>
      <!-- Brand -->
      <a
        class="text-white text-2sm hidden lg:inline-block font-normal"
        href="javascript:void(0)"
      >
        Products Control Center
      </a>
      <!-- Form -->
      <form
        class="md:flex hidden flex-row flex-wrap items-center lg:ml-auto mr-3"
      >
        <div class="relative flex w-full flex-wrap items-stretch">
          <span
            class="absolute top-0 left-0 py-1 h-full leading-snug font-normal text-center text-aronium-600 bg-transparent rounded text-base items-center justify-center w-8"
          >
            <i class="fas fa-search"></i>
          </span>
          <input
            type="text"
            placeholder="Search here..."
            class="border-0 px-3 py-1 placeholder-blueGray-300 text-blueGray-600 relative bg-white rounded text-sm shadow outline-none focus:outline-none focus:ring w-full pl-10"
          />
        </div>
      </form>
      <!-- User -->
      <ul class="flex-col md:flex-row list-none items-center hidden md:flex">
        <user-dropdown />
      </ul>
    </div>
  </nav>
  <!-- End Navbar -->
</template>

<script>
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";

export default {
  components: {
    UserDropdown,
  },
};
</script>
