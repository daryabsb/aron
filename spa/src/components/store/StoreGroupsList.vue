<template>
  <div>
    <div
      class="overflow-auto scrollbar mt-5 px-3 grid phone:grid-cols-1 tablet:grid-cols-6 grid-rows-6 xl:grid-cols-8 gap-3"
    >
      <div v-if="id" class="col-span-1 rounded-sm bg-white px-4 py-5 shadow sm:p-6">
        <dt class="truncate text-sm font-medium text-gray-500">
          <ChevronDoubleLeftIcon />
        </dt>
      </div>

      <template v-for="item in productGroups" :key="item.id">
        <div 
        class="col-span-1 flex flex-col justify-between rounded-sm bg-white px-4 py-2 shadow"
        @click="selectGroup(item.id)"
        >
          <div class="h-2/3" >
            <img 
            class="w-full object-fit"
            :src="item.image" 
            :alt="item.name"
            >
          </div>
          <div class="truncate text-sm font-medium text-gray-500">
            {{ item.name }}
          </div>
          
        </div>
      </template>
    </div>
  </div>
</template>

<script setup>
import{ref} from "vue";
import { ChevronDoubleLeftIcon } from "@heroicons/vue/24/outline";

import { useFetch } from "@/stores/fetch";
import { onMounted } from "@vue/runtime-core";
const store = useFetch();
onMounted(store.fetchGroups);

const productGroups = store.productGroups.length > 0 ? store.productGroups : [];

const id = ref(null)
const selectGroup=(groupId) => id.value = groupId;

</script>
