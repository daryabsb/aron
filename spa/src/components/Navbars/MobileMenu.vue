<template>
  <TransitionRoot as="template" :show="mobileMenuOpen">
    <Dialog
      as="div"
      class="relative z-50 md:hidden"
      @close="$emit('update:mobileMenuOpen', false)"
    >
      <TransitionChild
        as="template"
        enter="transition-opacity ease-linear duration-300"
        enter-from="opacity-0"
        enter-to="opacity-100"
        leave="transition-opacity ease-linear duration-300"
        leave-from="opacity-100"
        leave-to="opacity-0"
      >
        <div class="fixed inset-0 bg-gray-600 bg-opacity-75" />
      </TransitionChild>

      <div class="fixed inset-0 flex">
        <TransitionChild
          as="template"
          enter="transition ease-in-out duration-300 transform"
          enter-from="-translate-x-full"
          enter-to="translate-x-0"
          leave="transition ease-in-out duration-300 transform"
          leave-from="translate-x-0"
          leave-to="-translate-x-full"
        >
          <DialogPanel
            class="relative flex w-full max-w-xs flex-1 flex-col bg-aronium-800 pt-5 pb-4 z-50"
          >
            <TransitionChild
              as="template"
              enter="ease-in-out duration-300"
              enter-from="opacity-0"
              enter-to="opacity-100"
              leave="ease-in-out duration-300"
              leave-from="opacity-100"
              leave-to="opacity-0"
            >
              <div class="absolute top-1 right-0 -mr-14 p-1">
                <button
                  type="button"
                  class="flex h-12 w-12 items-center justify-center rounded-full focus:outline-none focus:ring-2 focus:ring-white"
                  @click="$emit('update:mobileMenuOpen', false)"
                >
                  <XMarkIcon class="h-6 w-6 text-white" aria-hidden="true" />
                  <span class="sr-only">Close sidebar</span>
                </button>
              </div>
            </TransitionChild>
            <div class="flex flex-shrink-0 items-center px-4">
              <img
                class="h-8 w-auto"
                src="https://tailwindui.com/img/logos/mark.svg?color=white"
                alt="Your Company"
              />
            </div>
            <div class="mt-5 h-0 flex-1 overflow-y-auto px-2">
              <nav class="flex h-full flex-col">
                <div class="space-y-1">
                  <span
                    v-for="item in sidebarNavigation"
                    :key="item.name"
                    @click="
                      item.submit(
                        $router,
                        $emit('update:mobileMenuOpen', false)
                      )
                    "
                    :class="[
                      'text-aronium-white hover:bg-aronium-900 hover:text-pink-500',
                      'group py-2 px-3 rounded-md flex items-center text-sm font-medium',
                    ]"
                    :aria-current="item.current ? 'page' : undefined"
                  >
                    <component
                      :is="item.icon"
                      :class="['mr-3 h-6 w-6']"
                      aria-hidden="true"
                    />
                    <span>{{ item.name }}</span>
                  </span>
                </div>
              </nav>
            </div>
          </DialogPanel>
        </TransitionChild>
        <div class="w-14 flex-shrink-0" aria-hidden="true">
          <!-- Dummy element to force sidebar to shrink to fit close icon -->
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script setup>
import { defineProps } from "vue";
import { sidebarNavigation } from "@/composables/staticData";
import {
  Dialog,
  DialogPanel,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import { XMarkIcon } from "@heroicons/vue/24/outline";
defineProps({
  mobileMenuOpen: { type: Boolean, default: false },
});
// const submit = async (submit, emit) => {
//   await emit();
//   await submit();
// };
// const mobileMenuOpen = ref(false);
</script>
