<template>
  <!-- <draggable class="dragArea" tag="div" :list="nodes"> -->
  <div
    v-for="node in nodes"
    :key="node.name"
    :style="{ 'margin-left': `${depth * 20}px` }"
    class="node"
  >
    <span class="type" @click="nodeClicked(node)">{{
      isExpanded(node) ? "&#9660;" : "&#9658;"
    }}</span>
    <span class="type">&#9671;</span>
    <span>{{ node.name }}</span>
    <TreeBrowser
      v-if="isExpanded(node) && node.children"
      :nodes="node.children"
      :depth="depth + 1"
      @onClick="(node) => $emit('onClick', node)"
    />
  </div>
  <!-- </draggable> -->
</template>

<script>
import { ref } from "vue";
import Draggable from "vue3-draggable";

export default {
  name: "TreeBrowser",
  props: {
    nodes: Array,
    depth: {
      type: Number,
      default: 0,
    },
  },
  emits: ["onClick"],
  setup() {
    const expanded = ref([]);

    const isExpanded = (node) => expanded.value.indexOf(node) !== -1;

    const nodeClicked = (node) => {
      if (!isExpanded(node)) {
        expanded.value.push(node);
      } else {
        expanded.value.splice(expanded.value.indexOf(node));
      }
    };

    return { expanded, isExpanded, nodeClicked };
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
