<template>
  <!-- Top navigation -->
  <div class="bg-gray-900">
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
        <a href="#" class="text-sm font-medium text-white hover:text-gray-100"
          >Sign in</a
        >
        <a href="#" class="text-sm font-medium text-white hover:text-gray-100"
          >Create an account</a
        >
      </div>
    </div>
  </div>
</template>

<script setup>
import { ChevronDownIcon } from "@heroicons/vue/20/solid";
const currencies = ["CAD", "USD", "AUD", "EUR", "GBP"];
</script>
