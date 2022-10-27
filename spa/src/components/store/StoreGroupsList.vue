<template>
  <div>
    <div
      class="overflow-auto scrollbar h-[38rem] mt-5 px-3 grid grid-flow-auto phone:grid-cols-1 tablet:grid-cols-3 xl:grid-cols-6 gap-3"
    >
      <div class="col-span-1 rounded-sm bg-white px-4 py-5 shadow sm:p-6">
        <dt class="truncate text-sm font-medium text-gray-500">
          <ChevronDoubleLeftIcon />
        </dt>
      </div>

      <template v-for="item in productGroups" :key="item.id">
        <div class="col-span-1 rounded-sm bg-white px-4 py-5 shadow sm:p-6">
          <dt class="truncate text-sm font-medium text-gray-500">
            {{ item.name }}
          </dt>
          <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900">
            {{ item.stat }}
          </dd>
        </div>
      </template>
    </div>
  </div>
</template>

<script setup>
import { ChevronDoubleLeftIcon } from "@heroicons/vue/24/outline";

import { useFetch } from "@/stores/fetch";
import { onMounted } from "@vue/runtime-core";
const store = useFetch();
onMounted(store.fetchGroups);

const productGroups = store.productGroups.length > 0 ? store.productGroups : [];
console.log(productGroups);
const stats = [
  { id: 1, name: "Total Subscribers", stat: "71,897" },
  { id: 2, name: "Avg. Open Rate", stat: "58.16%" },
  { id: 3, name: "Avg. Click Rate", stat: "24.57%" },
  { id: 4, name: "Total Subscribers", stat: "71,897" },
  { id: 4, name: "Avg. Open Rate", stat: "58.16%" },
  { id: 5, name: "Avg. Click Rate", stat: "24.57%" },
  { id: 6, name: "Total Subscribers", stat: "71,897" },
  { id: 7, name: "Avg. Open Rate", stat: "58.16%" },
  { id: 8, name: "Avg. Click Rate", stat: "24.57%" },
  { id: 9, name: "Total Subscribers", stat: "71,897" },
  { id: 10, name: "Avg. Open Rate", stat: "58.16%" },
  { id: 11, name: "Avg. Click Rate", stat: "24.57%" },
  { id: 12, name: "Total Subscribers", stat: "71,897" },
  { id: 13, name: "Avg. Open Rate", stat: "58.16%" },
  { id: 14, name: "Avg. Click Rate", stat: "24.57%" },
  { id: 15, name: "Avg. Click Rate", stat: "24.57%" },
  { id: 16, name: "Total Subscribers", stat: "71,897" },
  { id: 17, name: "Avg. Open Rate", stat: "58.16%" },
  { id: 18, name: "Avg. Click Rate", stat: "24.57%" },
  { id: 19, name: "Total Subscribers", stat: "71,897" },
  { id: 20, name: "Avg. Open Rate", stat: "58.16%" },
  { id: 21, name: "Avg. Click Rate", stat: "24.57%" },
];
</script>
