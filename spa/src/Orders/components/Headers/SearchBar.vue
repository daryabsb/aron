<template>
  <div class="flex flex-1 justify-between px-4 sm:px-6">
    <div class="flex flex-1">
      <form class="flex w-full md:ml-0" action="#" method="GET">
        <label for="search-field" class="sr-only">Search all files</label>
        <div
          class="relative w-full text-gray-800 focus-within:text-aronium-900"
        >
          <div
            class="pointer-events-none absolute inset-y-0 left-0 flex items-center"
          >
            <MagnifyingGlassIcon
              class="h-5 w-5 flex-shrink-0"
              aria-hidden="true"
            />
          </div>
          <input
            name="search-field"
            id="search-field"
            class="h-full w-full border-transparent bg-transparent py-2 pl-8 pr-3 text-base text-aronium-900 placeholder-aronium-500 focus:border-transparent focus:placeholder-aronium-600 focus:outline-none focus:ring-0"
            placeholder="Search"
            type="search"
          />
        </div>
      </form>
    </div>
    <div class="mx-4 flex items-center space-x-4 sm:mx-6 sm:space-x-6">
      <nav aria-label="Global" class="flex space-x-4">
        <span
          class="flex items-center md:w-32 md:h-full py-2 px-1 md:px-2 justify-center rounded-full md:rounded-sm bg-aronium-800 p-1 text-aronium-white shadow-sm hover:bg-gray-700 cursor-pointer"
        >
          <PlusIcon class="h-6 w-8" />
          <span class="hidden md:block">
            Save slae
          </span>
        </span>
        <span
          class="flex items-center md:w-32 md:h-full py-2 px-1 md:px-2 justify-center rounded-full md:rounded-sm bg-aronium-800 p-1 text-aronium-white shadow-sm hover:bg-gray-700 cursor-pointer"
          @click="store.openPaymentModal = true"
        >
          <ReceiptPercentIcon class="h-6 w-8" />
          <span class="hidden md:block">
            Payment
          </span>
        </span>
        <span
          class="flex items-center md:w-32 md:h-full py-2 px-1 md:px-2 justify-center rounded-full md:rounded-sm bg-aronium-800 p-1 text-aronium-white shadow-sm hover:bg-gray-700 cursor-pointer"
          @click="store.openCashModal = true"
        >
          <BanknotesIcon class="h-6 w-8" />
          <span class="hidden md:block">
            Cash
          </span>
        </span>
      </nav>
      <div class="flex items-center space-x-8">
        <span class="inline-flex">
          <a
            href="#"
            class="-mx-1 rounded-full bg-white p-1 text-gray-400 hover:text-gray-500"
          >
            <span class="sr-only">View notifications</span>
            <BellIcon class="h-6 w-6" aria-hidden="true" />
          </a>
        </span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useOrderStore } from "@/Orders/ordersStore";
import {
  MagnifyingGlassIcon,
  PlusIcon,
  BellIcon,
  ReceiptPercentIcon,
  BanknotesIcon,
} from "@heroicons/vue/24/outline";
const store = useOrderStore();
</script>
