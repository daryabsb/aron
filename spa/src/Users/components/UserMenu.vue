<template>
  <!-- Profile dropdown -->
  <Menu as="div" class="relative ml-3">
    <div>
      <Suspense>
        <MenuButton
          v-if="user"
          class="flex max-w-xs items-center rounded-full text-aronium-white bg-aronium-900 border border-aronium-500 shadow-md text-sm focus:outline-none lg:rounded-sm lg:p-2 lg:hover:bg-aronium-700"
        >
          <img class="h-6 w-6 rounded-full" :src="user.image" alt="" />
          <span class="ml-3 hidden text-sm font-medium lg:block"
            ><span class="sr-only">Open user menu for </span
            >{{ user.name }}</span
          >
          <ChevronDownIcon
            class="ml-1 hidden h-5 w-5 flex-shrink-0 lg:block"
            aria-hidden="true"
          />
        </MenuButton>

        <template #fallback>
          <MenuButton
            v-if="user"
            class="flex max-w-xs items-center rounded-full text-aronium-white bg-aronium-900 border border-aronium-500 shadow-xl text-sm focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:ring-offset-2 lg:rounded-md lg:p-2 lg:hover:bg-aronium-400"
          >
            <div
              class="block bg-aronium-500 animate-pulse h-8 w-8 rounded-full"
            />
            <span class="ml-3 hidden text-sm font-medium lg:block"
              ><span class="sr-only">Open user menu for </span>Loading...</span
            >
            <ChevronDownIcon
              class="ml-1 hidden h-5 w-5 flex-shrink-0 lg:block"
              aria-hidden="true"
            />
          </MenuButton>
        </template>
      </Suspense>
    </div>
    <transition
      enter-active-class="transition ease-out duration-100"
      enter-from-class="transform opacity-0 scale-95"
      enter-to-class="transform opacity-100 scale-100"
      leave-active-class="transition ease-in duration-75"
      leave-from-class="transform opacity-100 scale-100"
      leave-to-class="transform opacity-0 scale-95"
    >
      <MenuItems
        class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-sm text-aronium-white bg-aronium-800 py-1 shadow-lg ring-1 ring-pink-700 ring-opacity-5 focus:outline-none"
      >
        <MenuItem v-slot="{ active }">
          <a
            href="#"
            :class="[active ? 'bg-gray-100' : '', 'block px-4 py-2 text-sm ']"
            >Your Profile</a
          >
        </MenuItem>
        <MenuItem v-slot="{ active }">
          <a
            href="#"
            :class="[active ? 'bg-gray-100' : '', 'block px-4 py-2 text-sm ']"
            >Settings</a
          >
        </MenuItem>
        <MenuItem>
          <a href="/logout/" class="block px-4 py-2 text-sm">Logout</a>
        </MenuItem>
      </MenuItems>
    </transition>
  </Menu>
</template>

<script setup>
import { computed, onMounted } from "vue";
import { useUser } from "@/Users/userStore";

import { Menu, MenuButton, MenuItem, MenuItems } from "@headlessui/vue";
import { ChevronDownIcon } from "@heroicons/vue/20/solid";
const store = useUser();
const user = computed(() => store.user);

onMounted(async () => {
  if (!store.user) await store.loadUserData();
});
</script>
