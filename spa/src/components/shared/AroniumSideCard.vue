<template>
  <div class="relative text-white flex flex-col bg-zinc-800 w-full h-full">
    <div class="px-4">
      <div
        class="text-sm leading-normal mt-0 text-blueGray-400 font-bold uppercase"
      >
        <div class="text-white max-w-lg mx-auto p-3">
          <details
            v-for="group in useGetAllProductGroups"
            :key="group.id"
            role="list"
            :class="openIcon"
          >
            <summary
              class="text-sm list-none leading-6 font-semibold select-none"
            >
              <span v-if="group.groups.length > 0">
                <i class="fa fa-plus"></i>
              </span>
              <span v-else class="ml-4">
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
              class="ml-4 text-sm leading-6"
            >
              <summary class="list-none">
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
import { ref, onMounted } from "vue";
import { useFetchAllProductGroupsDispatch } from "@/store/composables";
import useGetAllProductGroups from "@/composables/useGetAllProductGroups";
export default {
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
