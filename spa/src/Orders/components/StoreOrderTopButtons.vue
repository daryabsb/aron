<template>
  <div
    class="phone:hidden text-aronium-white md:grid grid-cols-1 gap-2 sm:grid-cols-4"
  >
    <div
      class="py-2 bg-aronium-800 border border-aronium-500 flex justify-center items-center hover:bg-pink-600"
    >
      <button
        role="button"
        class="mt-1 px-2 text-sm font-semibold tracking-tight"
      >
        Delete
      </button>
    </div>
    <div
      class="py-2 bg-aronium-800 border border-aronium-500 flex justify-center items-center hover:bg-pink-600"
    >
      <button
        role="button"
        class="mt-1 px-2 text-sm font-semibold tracking-tight"
      >
        Quantity
      </button>
    </div>
    <Menu
      as="dive"
      class="relative bg-aronium-800 border border-aronium-500 flex justify-center items-center hover:bg-pink-600 col-span-2"
    >
      <div>
        <MenuButton
          v-if="store.activeNumber"
          class="text-sm flex font-semibold uppercase tracking-tight"
        >
          <span>{{ store.activeNumber }}</span>
          <ChevronDownIcon
            class="ml-1 hidden h-6 w-6 flex-shrink-0 lg:block"
            aria-hidden="true"
          />
        </MenuButton>
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
          class="absolute right-0 mt-2 w-48 z-10 mt-2 origin-top-right rounded-sm text-aronium-white bg-aronium-800 py-1 shadow-lg ring-1 ring-pink-700 ring-opacity-5 focus:outline-none"
        >
          <MenuItem
            v-for="order in store.cart"
            :key="order.number"
            v-slot="{ active }"
          >
            <a
              :href="`/store/order/${order.number}`"
              :class="[active ? 'bg-pink-500' : '', 'block px-4 py-2 text-sm ']"
              >{{ order.number }}</a
            >
          </MenuItem>
        </MenuItems>
      </transition>
    </Menu>
  </div>
  <!-- <pre>
  {{ cart }}
  </pre> -->
</template>

<script setup>
import { useOrderStore } from "@/Orders/ordersStore";
import { Menu, MenuButton, MenuItem, MenuItems } from "@headlessui/vue";
import { ChevronDownIcon } from "@heroicons/vue/20/solid";
const store = useOrderStore();
</script>
