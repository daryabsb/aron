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
              <span>
                <span>
                  <i v-if="group.groups.length > 0" class="fa fa-plus"></i>
                </span>
              </span>
              {{ group.name }}
            </summary>
            <details
              v-for="child in group.groups"
              :key="child.id"
              class="list-square ml-8 mt-3 text-sm leading-6 text-slate-600 dark:text-slate-400"
            >
              <summary>
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
    const closed = ref(true);
    let idToOpen = ref(1);
    const isOpen = ref(true);
    const toggleref = ref(1);

    // const closeId = (id) =>
    //   computed(() =>
    //     toggleref.value === id ? ["fa", "fa-plus"] : ["fa", "fa-minus"]
    //   );
    const openIcon = ["open:before:fa", "open:before:fa-plus"];

    const closeId = computed(() =>
      toggleref.value === idToOpen.value
        ? ["fa", "fa-plus", "bg-pink-500"]
        : ["fa", "fa-minus", "bg-gray-700"]
    );

    const toggleById = (id) => {
      // idToOpen.value = id;
      toggleref.value = id;
      isOpen.value = !isOpen.value;
    };

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
      closed,
      onNodeExpanded,
      onUpdate,
      onNodeClick,
      dataModel,
      toggleById,
      closeId,
      openIcon,
      toggleref,
      isOpen,
      idToOpen,
    };
  },
};
</script>
