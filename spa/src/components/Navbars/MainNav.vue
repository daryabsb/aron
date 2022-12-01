<template>
  <!-- Top navigation -->
  <div class="bg-gray-900 py-2 z-50">
    <div
      class="mx-auto flex h-10 max-w-full items-center justify-between px-4 sm:px-6 lg:px-8"
    >
      <!-- Currency selector -->
      <form>
        <div>
          <label for="desktop-currency" class="sr-only">Currency</label>
          <div
            class="group relative -ml-2 rounded-md border-transparent bg-gray-900 focus-within:ring-2 focus-within:ring-white"
          >
            <select
              id="desktop-currency"
              name="currency"
              class="flex items-center rounded-md border-transparent bg-gray-900 bg-none py-0.5 pl-2 pr-5 text-sm font-medium text-white focus:border-transparent focus:outline-none focus:ring-0 group-hover:text-gray-100"
            >
              <option v-for="currency in currencies" :key="currency">{{
                currency
              }}</option>
            </select>
            <div
              class="pointer-events-none absolute inset-y-0 right-0 flex items-center"
            >
              <ChevronDownIcon
                class="h-5 w-5 text-gray-300"
                aria-hidden="true"
              />
            </div>
          </div>
        </div>
      </form>

      <div class="flex items-center space-x-6">
        <UserMenu />

        <!-- Management menu -->
        <button
          type="button"
          class="px-4 text-aronium-white"
          @click="managementMenuOpen = true"
        >
          <span class="sr-only">Open sidebar</span>
          <Bars3BottomRightIcon class="h-6 w-6" aria-hidden="true" />
        </button>
      </div>
      <ManagementMenu v-model:managementMenuOpen="managementMenuOpen" />
    </div>
  </div>
</template>

<script setup>
import { ref, defineAsyncComponent } from "vue";
import { Bars3BottomRightIcon, ChevronDownIcon } from "@heroicons/vue/20/solid";
const UserMenu = defineAsyncComponent(() =>
  import("@/Users/components/UserMenu.vue")
);
const ManagementMenu = defineAsyncComponent(() =>
  import("@/components/Navbars/ManagementMenu.vue")
);
const currencies = ["CAD", "USD", "AUD", "EUR", "GBP"];
const managementMenuOpen = ref(false);
</script>
