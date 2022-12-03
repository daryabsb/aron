<template>
  <!-- Top navigation -->
  <div class="bg-aronium-900 py-2 z-30">
    <div
      class="mx-auto flex h-10 max-w-full items-center justify-between px-4 sm:px-6 lg:px-8"
    >
      <MobileMenu v-model:mobileMenuOpen="mobileMenuOpen" />
      <button
        type="button"
        class="px-4 text-aronium-white"
        @click="mobileMenuOpen = true"
      >
        <span class="sr-only">Open sidebar</span>
        <Bars3BottomLeftIcon class="h-6 w-6" aria-hidden="true" />
      </button>
      <!-- Currency selector -->
      <form>
        <div>
          <label for="desktop-currency" class="sr-only">Currency</label>
          <div class="relative bg-aronium-800 text-aronium-white">
            <select
              id="desktop-currency"
              name="currency"
              class="relative -ml-2 pl-3 pr-4 bg-aronium-900 border-transparent"
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
      <Suspense>
        <CashRegister />
        <template #fallback>Loading---</template>
      </Suspense>
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
import { ref, onMounted, defineAsyncComponent } from "vue";
import { useUser } from "@/Users/userStore";
import MobileMenu from "@/components/Navbars/MobileMenu.vue";
import {
  Bars3BottomLeftIcon,
  Bars3BottomRightIcon,
  ChevronDownIcon,
} from "@heroicons/vue/20/solid";
const store = useUser();

onMounted(async () => await store.loadCashRegisterData());

const UserMenu = defineAsyncComponent(() =>
  import("@/Users/components/UserMenu.vue")
);
const CashRegister = defineAsyncComponent(() =>
  import("@/Users/components/CashRegister.vue")
);
const ManagementMenu = defineAsyncComponent(() =>
  import("@/components/Navbars/ManagementMenu.vue")
);
const currencies = ["CAD", "USD", "AUD", "EUR", "GBP"];
const managementMenuOpen = ref(false);
const mobileMenuOpen = ref(false);
</script>
