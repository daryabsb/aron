<template>
  <div
    class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-xl rounded-lg h-full"
  >
    <div class="px-6">
      <div class="flex flex-wrap justify-center">
        <div class="w-full px-4 flex justify-center">
          <div class="relative"></div>
        </div>
        <div class="w-full px-4 text-center">
          <div class="flex justify-center py-4 lg:pt-4 pt-8">
            <div class="mr-4 p-3 text-center">
              <span
                class="text-xl font-bold block uppercase tracking-wide text-blueGray-600"
              >
                22
              </span>
              <span class="text-sm text-blueGray-400">Friends</span>
            </div>
            <div class="mr-4 p-3 text-center">
              <span
                class="text-xl font-bold block uppercase tracking-wide text-blueGray-600"
              >
                10
              </span>
              <span class="text-sm text-blueGray-400">Photos</span>
            </div>
            <div class="lg:mr-4 p-3 text-center">
              <span
                class="text-xl font-bold block uppercase tracking-wide text-blueGray-600"
              >
                89
              </span>
              <span class="text-sm text-blueGray-400">Comments</span>
            </div>
          </div>
        </div>
      </div>
      <div class="text-md uppercase leading-normal mx-2 mt-12">
        <input v-model="searchText" type="text" />
        <tree
          :nodes="data"
          :search-text="searchText"
          :use-icon="true"
          :use-checkbox="true"
          :gap="0"
          :expand-row-by-default="true"
          use-row-delete
          show-child-count
          @node-expanded="onNodeExpanded"
          @update:nodes="onUpdate"
          @node-click="onNodeClick"
        />
        <h3 class="text-xl font-semibold leading-normal text-blueGray-700 mb-2">
          Jenna Stones
        </h3>
        <div
          class="text-sm leading-normal mt-0 mb-2 text-blueGray-400 font-bold uppercase"
        >
          <i class="fas fa-map-marker-alt mr-2 text-lg text-blueGray-400"></i>
          Los Angeles, California
        </div>
        <div class="mb-2 text-blueGray-600 mt-10">
          <i class="fas fa-briefcase mr-2 text-lg text-blueGray-400"></i>
          Solution Manager - Creative Tim Officer
        </div>
        <div class="mb-2 text-blueGray-600">
          <i class="fas fa-university mr-2 text-lg text-blueGray-400"></i>
          University of Computer Science
        </div>
      </div>
      <div class="mt-10 py-10 border-t border-blueGray-200 text-center">
        <div class="flex flex-wrap justify-center">
          <div class="w-full lg:w-9/12 px-4">
            <p class="mb-4 text-lg leading-relaxed text-blueGray-700">
              An artist of considerable range, Jenna the name taken by
              Melbourne-raised, Brooklyn-based Nick Murphy writes, performs and
              records all of his own music, giving it a warm, intimate feel with
              a solid groove structure. An artist of considerable range.
            </p>
            <a href="javascript:void(0);" class="font-normal text-emerald-500">
              Show more
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
export default {
  setup() {
    const data = ref([
      {
        id: 1,
        label: "Animal",
        gap: 0,
        nodes: [
          {
            id: 2,
            label: "Dog",
            gap: 0,
          },
          {
            id: 3,
            label: "Cat",
            gap: 0,
            nodes: [
              {
                id: 4,
                label: "Egyptian Mau Cat",
                gap: 0,
              },
              {
                id: 5,
                label: "Japanese Bobtail Cat",
                gap: 0,
              },
            ],
          },
        ],
      },
      {
        id: 6,
        label: "People",
        gap: 0,
      },
    ]);
    const onNodeExpanded = (node, state) => {
      console.log("state: ", state);
      console.log("node: ", node);
    };

    const onUpdate = (nodes) => {
      console.log("nodes:", nodes);
    };
    const onNodeClick = (node) => {
      console.log(node);
    };
    const toggle = (node) => {
      console.log(node);
    };
    return { data, toggle, onNodeExpanded, onUpdate, onNodeClick };
  },
};
</script>
