<template>
  <!-- Narrow sidebar -->
  <div
    class="hidden w-24 inset-0 overflow-y-auto bg-aronium-800 border-r border-aronium-500 md:block"
  >
    <div class="flex w-full flex-col items-center py-6">
      <div class="flex flex-shrink-0 items-center">
        <img
          class="h-8 w-auto"
          src="https://tailwindui.com/img/logos/mark.svg?color=white"
          alt="Your Company"
        />
      </div>
      <div id="sideNav" class="mt-6 w-full flex-1 space-y-1 px-2">
        <span
          v-for="item in sidebarNavigation"
          :key="item.name"
          @click="submit(item.submit)"
          :class="[
            item.current
              ? 'bg-aronium-900 text-white'
              : 'text-aronium-white hover:bg-aronium-700 hover:text-pink-400',
            'group w-full p-3 rounded-md flex flex-col items-center text-xs font-medium',
          ]"
          :aria-current="item.current ? 'page' : undefined"
        >
          <component :is="item.icon" :class="['h-6 w-6']" aria-hidden="true" />
          <span class="mt-2">{{ item.name }}</span>
        </span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { sidebarNavigation } from "@/composables/staticData";
const submit = (submit) => submit();
</script>
