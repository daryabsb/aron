<template>
  <div class="flex flex-wrap">
    <div class="w-full">
      <ul class="grid grid-cols-4 mb-0 list-none pt-3 pb-4">
        <li
          class="mt-2 mr-2 last:mr-0 flex-auto text-center"
          v-for="tab in productGroups"
          :key="tab.id"
        >
          <Transition>
            <a
              class="text-xs font-bold uppercase px-5 py-3 cursor-pointer shadow-lg rounded block leading-normal"
              @click="toggleTabs(tab.id)"
              :class="{
                'text-pink-600 bg-white': openTab !== tab.id,
                'text-white bg-pink-600': openTab === tab.id,
              }"
            >
              {{ tab.name }}
            </a>
          </Transition>
        </li>
      </ul>
      <div
        class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded"
      >
        <div class="px-4 py-5 flex-auto">
          <slot :productGroups="productGroups" :openTab="openTab"></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { reactive, ref } from "vue";
export default {
  name: "pink-tabs",
  setup() {
    let openTab = ref(1);

    const categories = [
      { id: 1, name: "Groceries" },
      { id: 2, name: "Stationaries" },
      { id: 3, name: "Kitchen" },
      { id: 4, name: "Homes" },
    ];

    const productGroups = reactive([
      { id: 0, name: "All Products" },
      ...categories,
    ]);

    const toggleTabs = (tabNumber) => (openTab.value = tabNumber);
    return {
      openTab,
      toggleTabs,
      productGroups,
    };
  },
};
</script>
