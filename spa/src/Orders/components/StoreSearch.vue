<script setup>
import { ref } from "vue";
import { updateKeyword } from "@/store/composables";
import { RadioGroup, RadioGroupLabel, RadioGroupOption } from "@headlessui/vue";
import { HashtagIcon, QrCodeIcon, TagIcon } from "@heroicons/vue/24/outline";
const memoryOptions = [
  { name: "barcode", icon: QrCodeIcon, inStock: true },
  { name: "code", icon: HashtagIcon, inStock: true },
  { name: "name", icon: TagIcon, inStock: true },
];

const mem = ref(memoryOptions[0]);

const keyword = ref("");
</script>
<template>
  <div class="h-11 border-b border-aronium-500">
    <!-- NEW SEARCH INPUT -->

    <div class="flex flex-nowrap">
      <RadioGroup v-model="mem">
        <RadioGroupLabel class="sr-only">
          Choose a memory option
        </RadioGroupLabel>
        <!-- <div class="grid grid-cols-3 gap-2 sm:grid-cols-6"> -->
        <div class="flex">
          <RadioGroupOption
            as="template"
            v-for="option in memoryOptions"
            :key="option.name"
            :value="option"
            :disabled="!option.inStock"
            v-slot="{ active, checked }"
          >
            <div
              class="h-10 px-4 border-0 rounded-none border-r border-aronium-500"
              :class="[
                option.inStock
                  ? 'cursor-pointer focus:outline-none'
                  : 'opacity-25 cursor-not-allowed',
                active ? 'ring-2 ring-offset-2 ring-indigo-500' : '',
                checked
                  ? 'bg-aronium-600   hover:bg-pink-700'
                  : 'bg-inherit   hover:bg-gray-50',
                'border rounded-md py-3 px-3 flex items-center justify-center text-sm font-medium uppercase sm:flex-1',
              ]"
            >
              <!-- <RadioGroupLabel as="span">{{ option.name }}</RadioGroupLabel> -->
              <RadioGroupLabel as="span">
                <component
                  :is="option.icon"
                  class="h-6 w-6"
                  aria-hidden="true"
                />
                <!-- <component :is="option.icon" class="text-aronium-white" /> -->
              </RadioGroupLabel>
            </div>
          </RadioGroupOption>
        </div>
      </RadioGroup>

      <input
        v-model="keyword"
        class="w-full border-0 placeholder:italic placeholder:text-aronium-600 placeholder:text-2sm h-10 bg-inherit p-3 sm:text-sm"
        placeholder="Search for anything..."
        type="text"
        @keyup="updateKeyword(keyword)"
      />

      <span class="flex items-center mx-2">
        <i class="fa fa-search"></i>
      </span>
      <span class="flex items-center mx-2">
        <i class="fa fa-keyboard"></i>
      </span>
    </div>
  </div>
  <!-- END NEW INPUT -->
</template>
