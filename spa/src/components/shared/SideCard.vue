<template>
  <div
    class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-xl rounded-lg h-full"
  >
    <div class="px-4">
      <div class="flex flex-wrap justify-center">
        <div class="w-full text-left">
          <div class="rounded-t bg-white mb-0 px-2 pt-6 pb-3">
            <div class="flex justify-between">
              <h6 class="text-blueGray-700 px-3 text-xl font-bold">
                Product Groups
              </h6>

              <!-- <input
                v-model="searchText"
                class="border border-solid rounded shadow py-1 my-2"
                type="text"
              /> -->
            </div>
            <div class="flex justify-center py-2 lg:pt-4 pt-8">
              <div class="mr-2 p-1 text-center">
                <span
                  class="text-sm font-bold block uppercase tracking-wide text-blueGray-600"
                >
                  22
                </span>
                <span class="text-xs text-blueGray-400">Friends</span>
              </div>
              <div class="mr-2 p-1 text-center">
                <span
                  class="text-sm font-bold block uppercase tracking-wide text-blueGray-600"
                >
                  10
                </span>
                <span class="text-xs text-blueGray-400">Photos</span>
              </div>
              <div class="lg:mr-2 p-1 text-center">
                <span
                  class="text-sm font-bold block uppercase tracking-wide text-blueGray-600"
                >
                  89
                </span>
                <span class="text-xs text-blueGray-400">Comments</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div
        class="text-sm leading-normal mt-0 mb-2 text-blueGray-400 font-bold uppercase"
      >
        <input
          v-model="searchText"
          class="border border-solid w-full py-1 my-2"
          type="text"
        />
        <div class="tree" data-v-62a5b360="">
          <tree-comp :groups="useGetAllProductGroups"></tree-comp>
        </div>
        <hr />

        <div class="max-w-lg mx-auto p-8">
          <details
            v-for="group in useGetAllProductGroups"
            :key="group.id"
            class="open:bg-white dark:open:bg-slate-900 open:plus-1 open:ring-black/5 dark:open:ring-white/10 open:shadow-lg p-2 rounded-lg"
          >
            <summary
              class="text-sm leading-6 text-slate-900 dark:text-white font-semibold select-none"
            >
              {{ group.name }}
            </summary>
            <ul
              class="ml-8 mt-3 text-sm leading-6 text-slate-600 dark:text-slate-400"
            >
              <li v-for="child in group.groups" :key="child.id">
                {{ child.name }}
              </li>
            </ul>
          </details>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref, onMounted } from "vue";
import { useFetchAllProductGroupsDispatch } from "@/store/composables";
import useGetAllProductGroups from "@/composables/useGetAllProductGroups";
import TreeComp from "@/components/utils/tree-list/TreeList.vue";
export default {
  components: {
    TreeComp,
  },
  setup() {
    const searchText = ref("");

    onMounted(useFetchAllProductGroupsDispatch);

    const dataModel = ref([
      {
        id: "static-node1",
        label: "My First Node",
        children: [],
      },
      {
        id: "static-node2",
        label: "My Second Node",
        children: [
          {
            id: "static-subnode1",
            label: "This is a subnode",
            children: [],
          },
          {
            id: "static-subnode2",
            label: "This is another subnode",
            children: [
              {
                id: "static-subsubnode1",
                label: "An even deeper node",
                children: [],
              },
            ],
          },
        ],
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
    return {
      searchText,
      useGetAllProductGroups,
      toggle,
      onNodeExpanded,
      onUpdate,
      onNodeClick,
      dataModel,
    };
  },
};
</script>
