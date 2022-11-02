<template>
  <div class="flex flex-wrap">
    <div class="w-full">
      <ul class="flex flex-row justify-start mb-0 list-none pb-4">
        <li
          class="mt-2 mr-2 last:mr-0 flex-auto text-center border border-aronium-600"
        >
          <Transition>
            <a
              class="text-xs font-bold uppercase px-5 py-3 cursor-pointer block"
              :class="{
                'text-pink-600 ': openTab !== 0,
                'text-white bg-pink-600': openTab === 0,
              }"
              @click="toggleTabs(0)"
            >
              All Products
            </a>
          </Transition>
        </li>
        <li
          v-for="tab in useGetProductGroups"
          :key="tab.id"
          :class="
            tab.rank > 0 && tab.rank < 5
              ? 'mt-2 mr-2 last:mr-0 flex-auto text-center border border-aronium-600'
              : ''
          "
        >
          <!-- class="mt-2 mr-2 last:mr-0 flex-auto text-center" -->
          <Transition>
            <a
              v-if="tab.rank > 0 && tab.rank < 5 && tab.groups.length === 0"
              class="text-xs font-bold uppercase px-5 py-3 cursor-pointer block"
              :class="{
                'text-pink-600': openTab !== tab.id,
                'text-white bg-pink-600': openTab === tab.id,
              }"
              @click="toggleTabs(tab.id)"
            >
              {{ tab.name }}
            </a>
          </Transition>
        </li>
      </ul>
      <div
        class="relative flex flex-col min-w-0 break-words text-aronium-white w-full mb-6"
      >
        <div class="px-4 py-5">
          <slot
            :product-groups="useGetProductGroups"
            :open-tab="openTab"
          ></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
import {
  useFetchProductGroupsDispatch,
  filteredTabProductsByGroupId,
  tabProducts,
} from "@/store/composables";
import useGetProductGroups from "@/composables/useGetProductGroups";
export default {
  name: "PinkTabs",
  setup() {
    let openTab = ref(0);

    onMounted(useFetchProductGroupsDispatch);

    const toggleTabs = (tabNumber) => {
      openTab.value = tabNumber;
      try {
        filteredTabProductsByGroupId(tabNumber);
      } catch (error) {
        console.log(error);
      }
    };

    return {
      openTab,
      toggleTabs,
      tabProducts,
      useGetProductGroups,
    };
  },
};
</script>
