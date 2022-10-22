<template>
  <!-- <draggable class="dragArea" tag="div" :list="nodes"> -->
  <!-- <draggable v-model="nodes"> -->
  <div
    v-for="item in nodes"
    :key="item.id"
    class="flex flex-wrap mx-1 overflow-hidden"
    @click="nodeClicked(item)"
  >
    <!-- :style="{ 'margin-left': `${depth * 20}px` }" -->
    <!-- <span class="type" @click="nodeClicked(node)">{{
      isExpanded(node) ? "&#9660;" : "&#9658;"
    }}</span> -->
    <!-- <span class="type">&#9671;</span> -->
    <div
      class="w-42 h-64 m-1 block select-none cursor-pointer bg-aronium-900 hover:shadow-xl transition-shadow border-2 border-solid border-aronium-500 rounded-sm"
    >
      <div class="flex items-center justify-center h-3/4 w-48">
        <img
          v-if="item.image"
          :src="item.image"
          :alt="item.name"
          class="object-cover"
          :class="item.image ? 'w-full h-full' : 'hidden'"
        />
        <span v-else>{{ item.name }}</span>
      </div>
      <div
        class="h-1/4 py-2 px-3 flex flex-wrap justify-between text-aronium-white"
      >
        <div class="relative">
          <h3 class="text-sm">
            <a href="#">
              <span aria-hidden="true" class="absolute inset-0" />
              {{ item.name }}
            </a>
          </h3>
          <p class="m-2 text-sm">{{ item.color }}</p>
        </div>
        <p class="text-sm font-medium">
          {{ priceFormat(180) }}
        </p>
      </div>
    </div>

    <group-tree
      v-if="isExpanded(item) && item.groups"
      :nodes="item.groups"
      :depth="depth + 1"
    />
    <!-- @on-cick="(item) => $emit('onClick', item)" -->
  </div>
  <!-- </draggable> -->
  <!-- </draggable> -->
</template>

<script>
import { ref } from "vue";
import Draggable from "vue3-draggable";
import { priceFormat } from "@/store/composables";

export default {
  name: "GroupTree",
  props: {
    nodes: { type: Array, required: true },
    depth: {
      type: Number,
      default: 0,
    },
  },
  emits: ["on-click"],
  setup() {
    const expanded = ref([]);

    const isExpanded = (item) => expanded.value.indexOf(item) !== -1;

    const nodeClicked = (item = {}, id = 0) => {
      if (item) {
        console.log(
          "item",
          item.groups.length > 0 ? item.groups : "This item is child"
        );
        if (!isExpanded(item)) {
          expanded.value.push(item);
        } else {
          expanded.value.splice(expanded.value.indexOf(item));
        }
      }
      if (id) console.log(id);
    };

    return { expanded, isExpanded, nodeClicked, priceFormat };
  },
};
</script>

<style scoped>
.node {
  text-align: left;
  font-size: 18px;
}

.type {
  margin-right: 10px;
}
</style>
