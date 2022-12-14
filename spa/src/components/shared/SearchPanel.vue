<template>
  <TransitionRoot :show="open" as="template" @after-leave="query = ''" appear>
    <Dialog as="div" class="relative z-10" @close="$emit('close')">
      <TransitionChild
        as="template"
        enter="ease-out duration-300"
        enter-from="opacity-0"
        enter-to="opacity-100"
        leave="ease-in duration-200"
        leave-from="opacity-100"
        leave-to="opacity-0"
      >
        <div
          class="fixed inset-0 bg-aronium-900 bg-opacity-90 transition-opacity"
        />
      </TransitionChild>

      <div class="fixed inset-0 z-10 overflow-y-auto p-4 sm:p-6 md:p-20">
        <TransitionChild
          as="template"
          enter="ease-out duration-300"
          enter-from="opacity-0 scale-95"
          enter-to="opacity-100 scale-100"
          leave="ease-in duration-200"
          leave-from="opacity-100 scale-100"
          leave-to="opacity-0 scale-95"
        >
          <DialogPanel
            class="mx-auto h-full w-full transform divide-y divide-aronium-500 overflow-hidden rounded-sm bg-aronium-900 border border-aronium-500 z-50 shadow-2xl ring-1 ring-black ring-opacity-5 transition-all"
          >
            <Combobox v-slot="{ activeOption }" @update:modelValue="onSelect">
              <div class="relative">
                <MagnifyingGlassIcon
                  class="pointer-events-none absolute top-3.5 left-4 h-5 w-5 text-aronium-white"
                  aria-hidden="true"
                />
                <ComboboxInput
                  class="h-12 w-full border-0 bg-transparent pl-11 pr-4 text-aronium-white placeholder-aronium-500 focus:ring-0 sm:text-sm"
                  placeholder="Search..."
                  @change="query = $event.target.value"
                />
              </div>

              <ComboboxOptions
                v-if="query === '' || filteredProducts.length > 0"
                class="flex divide-x divide-aronium-500"
                as="div"
                static
                hold
              >
                <div
                  :class="[
                    'max-h-96 min-w-0 flex-auto scroll-py-4 overflow-y-auto px-6 py-4',
                    activeOption && 'sm:h-96',
                  ]"
                >
                  <h2
                    v-if="query === ''"
                    class="mt-2 mb-4 text-xs font-semibold text-aronium-white"
                  >
                    Recent searches
                  </h2>
                  <div hold class="-mx-2 text-sm text-aronium-white">
                    <ComboboxOption
                      v-for="person in query === '' ? recent : filteredProducts"
                      :key="person.id"
                      :value="person"
                      as="template"
                      v-slot="{ active }"
                    >
                      <div
                        :class="[
                          'group flex cursor-default select-none items-center rounded-sm p-2 hover:text-pink-700',
                          active && 'bg-aronium-100 text-pink-700',
                        ]"
                      >
                        <img
                          :src="person.imageUrl"
                          :alt="person.name"
                          class="h-6 w-6 flex-none rounded-full"
                        />
                        <span class="ml-3 flex-auto truncate">{{
                          person.name
                        }}</span>
                        <ChevronRightIcon
                          v-if="active"
                          class="ml-3 h-5 w-5 flex-none text-aronium-white"
                          aria-hidden="true"
                        />
                      </div>
                    </ComboboxOption>
                  </div>
                </div>

                <div
                  v-if="activeOption"
                  class="hidden h-96 w-1/2 flex-none flex-col divide-y divide-aronium-500 overflow-y-auto sm:flex"
                >
                  <div class="flex-none p-6 text-center">
                    <img
                      :src="activeOption.imageUrl"
                      alt=""
                      class="mx-auto h-16 w-16 rounded-full"
                    />
                    <h2 class="mt-3 font-semibold text-aronium-white">
                      {{ activeOption.name }}
                    </h2>
                    <p class="text-sm leading-6 text-aronium-white">
                      {{ activeOption.role }}
                    </p>
                  </div>
                  <div class="flex flex-auto flex-col justify-between p-6">
                    <dl
                      class="grid grid-cols-1 gap-x-6 gap-y-3 text-sm text-aronium-white"
                    >
                      <dt class="col-end-1 font-semibold text-aronium-white">
                        Phone
                      </dt>
                      <dd>{{ activeOption.phone }}</dd>
                      <dt class="col-end-1 font-semibold text-aronium-white">
                        URL
                      </dt>
                      <dd class="truncate">
                        <a
                          :href="activeOption.url"
                          class="text-pink-700 underline"
                        >
                          {{ activeOption.url }}
                        </a>
                      </dd>
                      <dt class="col-end-1 font-semibold text-aronium-white">
                        Email
                      </dt>
                      <dd class="truncate">
                        <a
                          :href="`mailto:${activeOption.email}`"
                          class="text-pink-700 underline"
                        >
                          {{ activeOption.email }}
                        </a>
                      </dd>
                    </dl>
                    <button
                      type="button"
                      class="mt-6 w-full rounded-md border border-transparent bg-pink-700 py-2 px-4 text-sm font-medium text-aronium-white shadow-sm hover:bg-pink-900 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
                    >
                      Send message
                    </button>
                  </div>
                </div>
              </ComboboxOptions>

              <div
                v-if="query !== '' && filteredProducts.length === 0"
                class="py-14 px-6 text-center text-sm sm:px-14"
              >
                <UsersIcon
                  class="mx-auto h-6 w-6 text-gray-400"
                  aria-hidden="true"
                />
                <p class="mt-4 font-semibold text-gray-900">No people found</p>
                <p class="mt-2 text-gray-500">
                  We couldn???t find anything with that term. Please try again.
                </p>
              </div>
            </Combobox>
          </DialogPanel>
        </TransitionChild>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script setup>
import { computed, ref } from "vue";
import { defineEmits } from "vue";
import { MagnifyingGlassIcon } from "@heroicons/vue/20/solid";
import { ChevronRightIcon, UsersIcon } from "@heroicons/vue/24/outline";
import {
  Combobox,
  ComboboxInput,
  ComboboxOptions,
  ComboboxOption,
  Dialog,
  DialogPanel,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";

defineEmits(["close"]);

const people = [
  {
    id: 1,
    name: "Leslie Alexander",
    phone: "1-493-747-9031",
    email: "lesliealexander@example.com",
    role: "Co-Founder / CEO",
    url: "https://example.com",
    profileUrl: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  {
    id: 2,
    name: "Dalia Sarajadin",
    phone: "1-493-747-9031",
    email: "lesliealexander@example.com",
    role: "Co-Founder / CEO",
    url: "https://example.com",
    profileUrl: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  {
    id: 3,
    name: "Nare Darya",
    phone: "1-493-747-9031",
    email: "lesliealexander@example.com",
    role: "Co-Founder / CEO",
    url: "https://example.com",
    profileUrl: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  {
    id: 4,
    name: "Zane Khan",
    phone: "1-493-747-9031",
    email: "lesliealexander@example.com",
    role: "Co-Founder / CEO",
    url: "https://example.com",
    profileUrl: "#",
    imageUrl:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
  },
  // More people...
];

const recent = [people[0], people[3], people[1], people[2]];

const open = ref(true);
const query = ref("");
const filteredProducts = computed(() =>
  query.value === ""
    ? []
    : people.filter((person) => {
        return person.name.toLowerCase().includes(query.value.toLowerCase());
      })
);

function onSelect(person) {
  // window.location = person.url;
  console.log(person);
}
</script>
