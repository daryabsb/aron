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

              <span>{{ useGetAllProductGroups.length }}</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="text-sm leading-normal mt-0 text-blueGray-400 font-bold uppercase"
      >
        <input
          v-model="searchText"
          class="border border-solid w-full py-1 my-2"
          type="text"
        />

        <div class="max-w-lg mx-auto p-3">
          <details
            v-for="group in useGetAllProductGroups"
            :key="group.id"
            role="list"
            class="open:before:fa-minus before:fa-plus dark:open:bg-slate-900 dark:open:ring-white/10 p-2 rounded-lg"
            :class="openIcon"
          >
            <summary
              class="text-sm list-none leading-6 text-slate-900 dark:text-white font-semibold select-none"
            >
              <span v-if="group.groups.length > 0">
                <i class="fa fa-plus"></i>
              </span>
              <span class="ml-4" v-else>
                <input
                  :id="group.id"
                  v-model="selectedGroups"
                  :value="group.id"
                  type="checkbox"
                  :name="group.name"
                />
              </span>

              {{ group.name }}
            </summary>
            <details
              v-for="child in group.groups"
              :key="child.id"
              class="list-square ml-4 mt-3 text-sm leading-6 text-slate-600 dark:text-slate-400"
            >
              <summary
                class="text-sm list-none leading-6 text-slate-900 dark:text-white font-semibold select-none"
              >
                <input
                  :id="child.id"
                  v-model="selectedGroups"
                  :value="child.id"
                  type="checkbox"
                  :name="child.name"
                />
                {{ child.name }}
              </summary>
            </details>
          </details>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref, computed, onMounted } from "vue";
import { useFetchAllProductGroupsDispatch } from "@/store/composables";
import useGetAllProductGroups from "@/composables/useGetAllProductGroups";
import TreeComp from "@/components/utils/tree-list/TreeList.vue";
export default {
  components: {
    TreeComp,
  },
  setup() {
    const searchText = ref("");
    const selectedGroups = ref([]);

    const openIcon = ["open:before:fa", "open:before:fa-plus"];

    onMounted(useFetchAllProductGroupsDispatch);

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
      closed,
      onNodeExpanded,
      onUpdate,
      onNodeClick,
      selectedGroups,
      openIcon,
    };
  },
};
</script>
