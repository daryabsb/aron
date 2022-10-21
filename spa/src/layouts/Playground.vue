<script setup>
import { ref, computed, onUpdated, onMounted, onBeforeMount } from "vue";
import { priceFormat } from "@/store/composables";
import { useFetch } from "@/stores/fetch";
import Grid from "@/components/shared/Grid.vue";

const fetchStore = useFetch();
const activeGroup = ref(0);
onMounted(fetchStore.fetchGroups);
const filteredGroups = ref(fetchStore.filteredGroups);
console.log(fetchStore.childGroups(1));
const submitItem = (item) => {
      console.log(item);
      isOpen.value = item.id;
      activeGroup.value = item.id;
    };
    const isOpen=ref(0)
</script>
<template>
  <div class="h-screen flex items-center justify-center bg-aronium-900">
    <div class="bg-aronium-800 borde border-aronium-500 shadlow-xl h-2/3 w-2/3">
     <div class="grid grid-flow-col"
    
     >
<div
 v-for="item in filteredGroups"
        :key="item.id"
>
<details
      :open="isOpen === item.id"
      
       
        class="h-64 flex"
       
      >
        <summary
          role="button"
          class="h-full w-48 select-none cursor-pointer transition-shadow overflow-hidden border-2 border-solid border-aronium-500 rounded-sm bg-aronium-900 hover:shadow-xl"
          :title="item.name"
          @click="submitItem(item)"
        >
          <!-- {{ isActive === item.id }} -->
          <div
            v-if="activeGroup === item.id"
            class="flex items-start justify-start h-3/4 w-48 overflow-hidden"
          >
            <i class="fa fa-arrow-left fa-2xl"></i>
          </div>
          <div
            v-else
            class="flex items-center justify-center h-3/4 w-48 overflow-hidden"
            :class="item.image ? 'h-3/4 w-48' : 'hidden'"
          >
            <img
              :src="item.image"
              :alt="item.name"
              class="h-full w-full object-contain object-center lg:h-full lg:w-full"
            />
          </div>
          <div class="px-3 mt-2 flex justify-between text-aronium-white">
            <div class="relative">
              <h3 class="text-sm">
                <a href="#">
                  <span aria-hidden="true" class="absolute inset-0" />
                  {{ item.name }}
                </a>
              </h3>
              <p class="mt-1 text-sm">Green</p>
            </div>
            <p class="text-sm font-medium">
              {{ priceFormat(180) }}
            </p>
          </div>
        </summary>

        <div class="block text-center h-1/4 pt-2 text-sm py-3">
                <p class="block truncate mr-1">
                 Vegetables
                </p>
                <p
                  class="text-aronium-white p-3 text-left nowrap font-semibold"
                >
                  {{ priceFormat(180) }}
                </p>
              </div>
      </details>

</div>
      
     </div>
    </div>
  </div>
</template>
