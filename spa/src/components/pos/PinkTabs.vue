<template>
  <div class="flex flex-wrap">
    <div class="w-full">
      <ul class="grid grid-cols-4 mb-0 list-none pt-3 pb-4">
        <li
          class="-mb-px mt-2 mr-2 last:mr-0 flex-auto text-center"
          v-for="tab in productGroups"
          :key="tab.id"
        >
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
        </li>

        <!-- <li class="-mb-px mr-2 last:mr-0 flex-auto text-center">
          <a
            class="text-xs font-bold uppercase px-5 py-3 shadow-lg cursor-pointer rounded block leading-normal"
            @click="toggleTabs(2)"
            v-bind:class="{
              'text-pink-600 bg-white': openTab !== 2,
              'text-white bg-pink-600': openTab === 2,
            }"
          >
            Groceries
          </a>
        </li>
        <li class="-mb-px mr-2 last:mr-0 flex-auto text-center">
          <a
            class="text-xs font-bold uppercase px-5 py-3 shadow-lg rounded block cursor-pointer leading-normal"
            @click="toggleTabs(3)"
            v-bind:class="{
              'text-pink-600 bg-white': openTab !== 3,
              'text-white bg-pink-600': openTab === 3,
            }"
          >
            Stationaries
          </a>
        </li> -->
      </ul>
      <div
        class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded"
      >
        <div class="px-4 py-5 flex-auto">
          <div class="tab-content tab-space">
            <div v-bind:class="{ hidden: openTab !== 1, block: openTab === 1 }">
              <p>
                Collaboratively administrate empowered markets via plug-and-play
                networks. Dynamically procrastinate B2C users after installed
                base benefits.
                <br />
                <br />
                Dramatically visualize customer directed convergence without
                revolutionary ROI.
              </p>
            </div>
            <div v-bind:class="{ hidden: openTab !== 2, block: openTab === 2 }">
              <p>
                Completely synergize resource taxing relationships via premier
                niche markets. Professionally cultivate one-to-one customer
                service with robust ideas.
                <br />
                <br />
                Dynamically innovate resource-leveling customer service for
                state of the art customer service.
              </p>
            </div>
            <div v-bind:class="{ hidden: openTab !== 3, block: openTab === 3 }">
              <p>
                Efficiently unleash cross-media information without cross-media
                value. Quickly maximize timely deliverables for real-time
                schemas.
                <br />
                <br />
                Dramatically maintain clicks-and-mortar solutions without
                functional solutions.
              </p>
            </div>
          </div>
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

    const productGroups = reactive([
      { id: 1, name: "All Products" },
      { id: 2, name: "Groceries" },
      { id: 3, name: "Stationaries" },
      { id: 4, name: "Kitchen" },
      { id: 5, name: "Homes" },
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
