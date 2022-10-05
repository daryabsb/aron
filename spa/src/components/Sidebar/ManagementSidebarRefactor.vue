<template>
  <nav
    class="flex flex-wrap bg-aronium-900 text-aronium-white items-center justify-between relative h-full w-full pb-3 px-4"
  >
    <div
      class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center justify-between h-full w-full mx-auto"
    >
      <!-- Toggler -->
      <button
        class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
        type="button"
        @click="toggleCollapseShow('bg-white m-2 py-3 px-6')"
      >
        <i class="fas fa-bars"></i>
      </button>
      <!-- Brand -->
      <router-link
        class="md:block text-left md:pb-2 text-blueGray-600 mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold p-4 px-0"
        to="/"
      >
        Vue Notus
      </router-link>
      <!-- User -->
      <ul class="md:hidden items-center flex flex-wrap list-none">
        <li class="inline-block relative">
          <notification-dropdown />
        </li>
        <li class="inline-block relative">
          <user-dropdown />
        </li>
      </ul>
      <!-- Collapse -->
      <div
        class="md:flex md:flex-col md:items-stretch md:opacity-100 md:relative md:mt-4 md:shadow-none shadow absolute top-0 left-0 right-0 z-40 overflow-y-auto overflow-x-hidden h-auto items-center flex-1 rounded"
        :class="collapseShow"
      >
        <!-- Collapse header -->
        <div
          class="md:min-w-full md:hidden block pb-2 mb-2 border-b border-solid border-blueGray-200"
        >
          <div class="flex flex-wrap">
            <div class="w-6/12">
              <router-link
                class="md:block text-left md:pb-2 text-blueGray-600 mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold p-2 px-0"
                to="/"
              >
                Vue Notus
              </router-link>
            </div>
            <div class="w-6/12 flex justify-end">
              <button
                type="button"
                class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                @click="toggleCollapseShow('hidden')"
              >
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <form class="mt-6 mb-4 md:hidden">
          <div class="mb-3 pt-0">
            <input
              type="text"
              placeholder="Search"
              class="px-3 py-2 h-12 border border-solid border-blueGray-500 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-base leading-snug shadow-none outline-none focus:outline-none w-full font-normal"
            />
          </div>
        </form>

        <!-- Divider -->
        <hr class="my-4 md:min-w-full" />

        <!-- Navigation -->
        <div class="flex">
          <!-- <ul class="md:flex-col md:min-w-full flex flex-col list-none">
            <li class="items-center">
              <router-link
                v-for="item in sideBArNavItems"
                :key="item.id"
                v-slot="{ href, navigate, isActive }"
                :to="item.link"
              >
                <a
                  :href="href"
                  class="text-sm py-2 font-normal block"
                  :class="[
                    isActive
                      ? 'text-pink-500 hover:text-pink-700'
                      : 'text-blueGray-700 hover:text-blueGray-500',
                  ]"
                  @click="navigate"
                >
                  <i
                    :class="[
                      isActive
                        ? `opacity-75 ${item.icon}`
                        : `text-aronium-white ${item.icon}`,
                      item.icon,
                    ]"
                  ></i>
                </a>
              </router-link>
            </li>
          </ul> -->
          <ul
            class="md:flex-col z-10 md:min-w-full flex flex-col list-none"
            @mouseleave="toggleCollapseShow('hidden')"
          >
            <li class="items-center">
              <router-link
                v-for="item in sideBArNavItems"
                :key="item.id"
                v-slot="{ href, navigate, isActive }"
                :to="item.link"
              >
                <a
                  :href="href"
                  class="text-sm py-2 font-normal block"
                  :class="[
                    isActive
                      ? 'text-pink-500 hover:text-pink-700'
                      : 'text-blueGray-700 hover:text-blueGray-500',
                  ]"
                  @click="navigate"
                >
                  <!-- class="fas fa-tv mr-2 text-sm" -->
                  <i
                    :class="[
                      isActive
                        ? `opacity-75 ${item.icon}`
                        : `text-aronium-white ${item.icon}`,
                      item.icon,
                    ]"
                  ></i>
                  {{ item.name }}
                </a>
              </router-link>
            </li>
          </ul>
        </div>

        <!-- Divider -->
        <div class="mb-3 mt-auto">
          <hr class="my-4 md:min-w-full" />
        </div>
      </div>
    </div>
  </nav>
</template>
); }

<script>
import { ref } from "vue";
import NotificationDropdown from "@/components/Dropdowns/NotificationDropdown.vue";
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";

import { sideBArNavItems } from "@/composables/staticData";

export default {
  components: {
    NotificationDropdown,
    UserDropdown,
  },
  setup() {
    const collapseShow = ref("hidden");
    const toggleCollapseShow = (classes) => {
      collapseShow.value = classes;
    };
    return {
      sideBArNavItems,
      collapseShow,
      toggleCollapseShow,
    };
  },
};
</script>
