<template>
  <TransitionRoot as="template" :show="props.open">
    <Dialog as="div" class="relative z-10" @close="closePanel">
      <div class="fixed inset-0" />

      <div class="fixed inset-0 overflow-hidden">
        <div class="absolute inset-0 overflow-hidden">
          <div
            class="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10 sm:pl-16"
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
              <DialogPanel class="pointer-events-auto w-screen max-w-2xl">
                <form
                  class="flex h-full flex-col overflow-y-scroll bg-aronium-900 border border-aronium-500 shadow-xl"
                >
                  <div class="flex-1">
                    <!-- Header -->
                    <div
                      class="bg-aronium-800 border-b border-aronium-500 px-4 py-6 sm:px-6"
                    >
                      <div class="flex items-start justify-between space-x-3">
                        <div class="space-y-1">
                          <DialogTitle
                            class="text-lg font-medium text-aronium-white"
                            >{{ modalType }}</DialogTitle
                          >
                          <p class="text-sm text-aronium-white">
                            Get started by filling in the information below to
                            create your new project.
                          </p>
                        </div>
                        <div class="flex h-7 items-center">
                          <button
                            type="button"
                            class="text-aronium-white hover:text-pink-700"
                            @click="closePanel"
                          >
                            <span class="sr-only">Close panel</span>
                            <XMarkIcon class="h-6 w-6" aria-hidden="true" />
                          </button>
                        </div>
                      </div>
                    </div>

                    <!-- Divider container -->
                    <div
                      class="space-y-6 py-6 sm:space-y-0 sm:divide-y sm:divide-aronium-500 sm:py-0"
                    >
                      <!-- Project name -->
                      <div
                        class="space-y-1 px-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:space-y-0 sm:px-6 sm:py-5"
                      >
                        <div>
                          <label
                            for="project-name"
                            class="block text-sm font-medium text-aronium-white sm:mt-px sm:pt-2"
                            >Product name</label
                          >
                        </div>
                        <div class="sm:col-span-2">
                          <input
                            type="text"
                            name="project-name"
                            id="project-name"
                            class="block w-full rounded-sm border-aronium-500 shadow-sm focus:border-pink-700 focus:ring-pink-700 sm:text-sm"
                          />
                        </div>
                      </div>

                      <!-- Project description -->
                      <div
                        class="space-y-1 px-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:space-y-0 sm:px-6 sm:py-5"
                      >
                        <div>
                          <label
                            for="project-description"
                            class="block text-sm font-medium text-aronium-white sm:mt-px sm:pt-2"
                            >Description</label
                          >
                        </div>
                        <div class="sm:col-span-2">
                          <textarea
                            id="project-description"
                            name="project-description"
                            rows="3"
                            class="block w-full rounded-sm border-aronium-500 shadow-sm focus:border-pink-700 focus:ring-pink-700 sm:text-sm"
                          />
                        </div>
                      </div>

                      <!-- Team members -->
                      <div
                        class="space-y-2 px-4 sm:grid sm:grid-cols-3 sm:items-center sm:gap-4 sm:space-y-0 sm:px-6 sm:py-5"
                      >
                        <div>
                          <h3 class="text-sm font-medium text-aronium-white">
                            Team Members
                          </h3>
                        </div>
                        <div class="sm:col-span-2">
                          <div class="flex space-x-2">
                            <a
                              v-for="person in team"
                              :key="person.email"
                              :href="person.href"
                              class="flex-shrink-0 rounded-full hover:opacity-75"
                            >
                              <img
                                class="inline-block h-8 w-8 rounded-full"
                                :src="person.imageUrl"
                                :alt="person.name"
                              />
                            </a>

                            <button
                              type="button"
                              class="inline-flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-full border-2 border-dashed border-gray-200 bg-white text-gray-400 hover:border-gray-300 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                            >
                              <span class="sr-only">Add team member</span>
                              <PlusIcon class="h-5 w-5" aria-hidden="true" />
                            </button>
                          </div>
                        </div>
                      </div>

                      <!-- Privacy -->
                      <fieldset
                        class="space-y-2 px-4 sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:space-y-0 sm:px-6 sm:py-5"
                      >
                        <legend class="sr-only">Privacy</legend>
                        <div
                          class="text-sm font-medium text-aronium-white"
                          aria-hidden="true"
                        >
                          Privacy
                        </div>
                        <div class="space-y-5 sm:col-span-2">
                          <div class="space-y-5 sm:mt-0">
                            <div class="relative flex items-start">
                              <div class="absolute flex h-5 items-center">
                                <input
                                  id="public-access"
                                  name="privacy"
                                  aria-describedby="public-access-description"
                                  type="radio"
                                  class="h-4 w-4 border-gray-300 text-pink-600 focus:ring-pink-700"
                                  checked=""
                                />
                              </div>
                              <div class="pl-7 text-sm">
                                <label
                                  for="public-access"
                                  class="font-medium text-aronium-white"
                                  >Public access</label
                                >
                                <p
                                  id="public-access-description"
                                  class="text-gray-500"
                                >
                                  Everyone with the link will see this project
                                </p>
                              </div>
                            </div>
                            <div class="relative flex items-start">
                              <div class="absolute flex h-5 items-center">
                                <input
                                  id="restricted-access"
                                  name="privacy"
                                  aria-describedby="restricted-access-description"
                                  type="radio"
                                  class="h-4 w-4 border-gray-300 text-pink-600 focus:ring-pink-700"
                                />
                              </div>
                              <div class="pl-7 text-sm">
                                <label
                                  for="restricted-access"
                                  class="font-medium text-aronium-white"
                                  >Private to Project Members</label
                                >
                                <p
                                  id="restricted-access-description"
                                  class="text-gray-500"
                                >
                                  Only members of this project would be able to
                                  access
                                </p>
                              </div>
                            </div>
                            <div class="relative flex items-start">
                              <div class="absolute flex h-5 items-center">
                                <input
                                  id="private-access"
                                  name="privacy"
                                  aria-describedby="private-access-description"
                                  type="radio"
                                  class="h-4 w-4 border-gray-300 text-pink-600 focus:ring-pink-700"
                                />
                              </div>
                              <div class="pl-7 text-sm">
                                <label
                                  for="private-access"
                                  class="font-medium text-aronium-white"
                                  >Private to you</label
                                >
                                <p
                                  id="private-access-description"
                                  class="text-gray-500"
                                >
                                  You are the only one able to access this
                                  project
                                </p>
                              </div>
                            </div>
                          </div>
                          <hr class="border-gray-200" />
                          <div
                            class="space-between sm:space-between flex flex-col space-y-4 sm:flex-row sm:items-center sm:space-y-0"
                          >
                            <div class="flex-1">
                              <a
                                href="#"
                                class="group flex items-center space-x-2.5 text-sm font-medium text-aronium-white hover:text-pink-700"
                              >
                                <LinkIcon
                                  class="h-5 w-5 text-aronium-white group-hover:text-pink-700"
                                  aria-hidden="true"
                                />
                                <span>Copy link</span>
                              </a>
                            </div>
                            <div>
                              <a
                                href="#"
                                class="group flex items-center space-x-2.5 text-sm text-aronium-white hover:text-pink-700"
                              >
                                <QuestionMarkCircleIcon
                                  class="h-5 w-5 text-gray-400 group-hover:text-gray-500"
                                  aria-hidden="true"
                                />
                                <span>Learn more about sharing</span>
                              </a>
                            </div>
                          </div>
                        </div>
                      </fieldset>
                    </div>
                  </div>

                  <!-- Action buttons -->
                  <div
                    class="flex-shrink-0 border-t border-aronium-500 px-4 py-5 sm:px-6"
                  >
                    <div class="flex justify-end space-x-3">
                      <button
                        type="button"
                        class="rounded-md border border-gray-300 hover:border-pink-700 bg-white py-2 px-4 text-sm font-medium text-pink-700 hover:text-aronium-white shadow-sm hover:bg-pink-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                        @click="closePanel"
                      >
                        Cancel
                      </button>
                      <button
                        type="submit"
                        class="inline-flex justify-center rounded-md border border-transparent bg-pink-700 py-2 px-4 text-sm font-medium text-aronium-white shadow-sm hover:bg-aronium-white hover:text-pink-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                      >
                        Create
                      </button>
                    </div>
                  </div>
                </form>
              </DialogPanel>
            </TransitionChild>
          </div>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script setup>
import { ref, defineEmits, defineProps } from "vue";
import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import { XMarkIcon } from "@heroicons/vue/24/outline";
import {
  LinkIcon,
  PlusIcon,
  QuestionMarkCircleIcon,
} from "@heroicons/vue/20/solid";

import ProductsModalNewGroup from "@/components/modals/products/ProductsModalNewGroup.vue";
import ProductsModalNewProduct from "@/components/modals/products/ProductsModalNewProduct.vue";

import { useFetchProductGroupsDispatch } from "@/store/composables";
import useGetProductGroups from "@/composables/useGetProductGroups";

const props = defineProps({
  modalType: {
    type: String,
    required: true,
  },
  open: {
    type: Boolean,
    defaule: false,
  },
});

// const open = ref(props.openPanel);
const emit = defineEmits(["close"]);

useFetchProductGroupsDispatch();

const closePanel = () => {
  emit("close");
  open.value = false;
};

const team = [
  {
    name: "Tom Cook",
    email: "tom.cook@example.com",
    href: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  {
    name: "Whitney Francis",
    email: "whitney.francis@example.com",
    href: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  {
    name: "Leonard Krasner",
    email: "leonard.krasner@example.com",
    href: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  {
    name: "Floyd Miles",
    email: "floy.dmiles@example.com",
    href: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  {
    name: "Emily Selman",
    email: "emily.selman@example.com",
    href: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1502685104226-ee32379fefbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
];

// const open = ref(true);
</script>
