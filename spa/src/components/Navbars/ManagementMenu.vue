<template>
  <TransitionRoot as="template" :show="managementMenuOpen">
    <Dialog
      as="div"
      class="relative z-50"
      @click="$emit('update:managementMenuOpen', false)"
    >
      <div class="fixed inset-0" />

      <div class="fixed inset-0 overflow-hidden">
        <div class="absolute inset-0 overflow-hidden">
          <div
            class="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10"
          >
            <TransitionChild
              as="template"
              enter="transform transition ease-in-out duration-500 sm:duration-700"
              enter-from="translate-x-full"
              enter-to="translate-x-0"
              leave="transform transition ease-in-out duration-500 sm:duration-700"
              leave-from="translate-x-0"
              leave-to="translate-x-full"
            >
              <DialogPanel class="pointer-events-auto w-screen max-w-md">
                <div
                  class="flex h-full flex-col divide-y divide-aronium-500 text-aronium-white bg-aronium-800 border-l border-aronium-500 shadow-lg"
                >
                  <div
                    class="flex min-h-0 flex-1 flex-col overflow-y-scroll py-6"
                  >
                    <div class="px-4 sm:px-6">
                      <div class="flex items-start justify-between">
                        <DialogTitle class="text-lg font-medium"
                          >POS-1 - {{ user.name }}
                        </DialogTitle>
                        <div class="ml-3 flex h-7 items-center">
                          <button
                            type="button"
                            class="hover:text-gray-500"
                            @click="$emit('update:managementMenuOpen', false)"
                          >
                            <span class="sr-only">POS - 1 </span>
                            <XMarkIcon class="h-6 w-6" aria-hidden="true" />
                          </button>
                        </div>
                      </div>
                    </div>
                    <div class="relative mt-6 flex-1 px-4 sm:px-6">
                      <!-- Replace with your content -->
                      <div class="h-full" aria-hidden="true">
                        <!-- border-2 border-dashed border-gray-200 -->

                        <!-- MANAGEMENT IN MENU -->
                        <div class="mt-8">
                          <div class="flex items-center">
                            <h4
                              class="flex-shrink-0 pr-4 text-aronium-500 text-sm uppercase"
                            >
                              Admin Tasks
                            </h4>
                            <div class="flex-1 border-t-2 border-aronium-500" />
                          </div>
                          <ul role="list" class="mt-8 space-y-5">
                            <li
                              class="text-sm hover:text-pink-400 cursor-pointer"
                            >
                              <router-link
                                to="/management"
                                class="flex items-start"
                              >
                                <div class="flex-shrink-0">
                                  <WrenchScrewdriverIcon class="h-5 w-5" />
                                </div>
                                <p class="ml-3 text-md">
                                  Management
                                </p>
                              </router-link>
                            </li>
                          </ul>
                        </div>
                        <!-- TRANSACTIONS IN MENU -->
                        <div class="mt-8">
                          <div class="flex items-center">
                            <h4
                              class="flex-shrink-0 pr-4 text-aronium-500 text-sm uppercase"
                            >
                              Transactions
                            </h4>
                            <div class="flex-1 border-t-2 border-aronium-500" />
                          </div>
                          <ul role="list" class="mt-8 space-y-5">
                            <li
                              class="flex items-start text-sm hover:text-pink-400 cursor-pointer"
                            >
                              <div class="flex-shrink-0">
                                <DocumentCheckIcon class="h-5 w-5" />
                              </div>
                              <p class="ml-3 text-md">
                                View sales history
                              </p>
                            </li>
                            <li
                              class="flex items-start text-sm hover:text-pink-400 cursor-pointer"
                            >
                              <div class="flex-shrink-0">
                                <ArrowDownTrayIcon class="h-5 w-5" />
                              </div>
                              <p class="ml-3 text-md">
                                Cash In / Out
                              </p>
                            </li>
                            <li
                              class="flex items-start text-sm hover:text-pink-400 cursor-pointer"
                            >
                              <div class="flex-shrink-0">
                                <LockClosedIcon class="h-5 w-5" />
                              </div>
                              <p class="ml-3 text-md">
                                End of day
                              </p>
                            </li>
                          </ul>
                        </div>
                        <!-- TRANSACTIONS IN MENU -->
                        <div class="mt-8">
                          <div class="flex items-center">
                            <h4
                              class="flex-shrink-0 pr-4 text-aronium-500 text-sm uppercase"
                            >
                              User
                            </h4>
                            <div class="flex-1 border-t-2 border-aronium-500" />
                          </div>
                          <ul role="list" class="mt-8 space-y-5">
                            <li
                              class="flex items-start text-sm hover:text-pink-400 cursor-pointer"
                            >
                              <div class="flex-shrink-0">
                                <DocumentCheckIcon class="h-5 w-5" />
                              </div>
                              <p class="ml-3 text-md">
                                User info
                              </p>
                            </li>
                            <li
                              class="flex items-start text-sm hover:text-pink-400 cursor-pointer"
                            >
                              <div class="flex-shrink-0">
                                <ArrowDownTrayIcon class="h-5 w-5" />
                              </div>
                              <p class="ml-3 text-md">
                                Signout
                              </p>
                            </li>
                          </ul>
                        </div>
                        <!-- FEEDBACK -->
                        <div class="mt-8">
                          <div class="flex items-center">
                            <div class="flex-1 border-t-2 border-aronium-500" />
                          </div>
                          <ul role="list" class="mt-8 space-y-5">
                            <li
                              class="flex items-start text-sm hover:text-pink-400 cursor-pointer"
                            >
                              <div class="flex-shrink-0">
                                <MegaphoneIcon class="h-5 w-5" />
                              </div>
                              <p class="ml-3 text-md">
                                Feedback
                              </p>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <!-- /End replace -->
                    </div>
                  </div>

                  <div class="flex flex-shrink-0 justify-around px-4 py-4">
                    <span class="isolate inline-flex rounded-md shadow-sm">
                      <button
                        type="button"
                        class="relative inline-flex items-center px-8 py-2 text-sm font-medium hover:bg-gray-50 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
                      >
                        <AdjustmentsVerticalIcon
                          class="h-6 w-6"
                          aria-hidden="true"
                        />
                      </button>
                      <button
                        type="button"
                        class="relative -ml-px inline-flex items-center px-8 py-2 text-sm font-medium hover:bg-gray-50 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
                      >
                        <ArrowsPointingOutIcon
                          class="h-6 w-6"
                          aria-hidden="true"
                        />
                      </button>
                      <button
                        type="button"
                        class="relative -ml-px inline-flex items-center px-8 py-2 text-sm font-medium hover:bg-gray-50 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
                        @click="$emit('update:managementMenuOpen', false)"
                      >
                        <PowerIcon class="h-6 w-6" aria-hidden="true" />
                      </button>
                    </span>
                  </div>
                </div>
              </DialogPanel>
            </TransitionChild>
          </div>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script setup>
import { defineProps } from "vue";
import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import {
  XMarkIcon,
  AdjustmentsVerticalIcon,
  ArrowsPointingOutIcon,
  PowerIcon,
  WrenchScrewdriverIcon,
  DocumentCheckIcon,
  ArrowDownTrayIcon,
  LockClosedIcon,
  MegaphoneIcon,
} from "@heroicons/vue/24/outline";
import { useUser } from "@/Users/userStore";
import { storeToRefs } from "pinia";
const { user } = storeToRefs(useUser());
defineProps({
  managementMenuOpen: { type: Boolean, default: false },
});
</script>
