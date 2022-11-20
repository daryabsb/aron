<template>
  <div
    class="animate-pulse max-h-16 justify-between flex items-center space-x-3 rounded-sm border border-aronium-500 bg-aronium-700 px-6 py-2 mb-1 shadow-sm"
  >
    <div class="flex items-center">
      <div class="flex-shrink-0 mr-3">
        <div class="h-10 w-10 rounded-full bg-aronium-500 block" />
      </div>
      <div>
        <div class="h-2.5 bg-aronium-500 rounded-full w-24 mb-2.5"></div>
        <div class="w-32 h-2 bg-aronium-500 rounded-full"></div>
      </div>
    </div>

    <div class="h-2.5 bg-aronium-500 rounded-full dark:bg-gray-700 w-16"></div>
  </div>
</template>

<script setup>
import { PlusIcon, MinusIcon } from "@heroicons/vue/20/solid";
</script>
