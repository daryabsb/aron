<template>
  <div id="app">
    <router-view v-slot="{ Component }">
      <TransitionRoot as="template" :show="true">
        <TransitionChild
          as="template"
          enter="ease-out duration-2000"
          enter-from="opacity-0"
          enter-to="opacity-100"
          leave="ease-in duration-2000"
          leave-from="opacity-100"
          leave-to="opacity-0"
        >
          <Dialog>
            <component :is="Component" />
          </Dialog>
        </TransitionChild>
      </TransitionRoot>
    </router-view>
  </div>
  <!-- PRINT_AREA -->
</template>

<script setup>
import { Dialog, TransitionChild, TransitionRoot } from "@headlessui/vue";
</script>
