<template>
  <ul class="tree-list" style="gap: 0px;">
    <li
      v-for="group in groups"
      :key="group.id"
      class="tree-row"
      style="gap: 0px; padding-left: 24px; --row-hover-background: #e0e0e0;"
    >
      <div class="tree-row-item">
        <div
          v-if="group.groups.length > 0"
          class="tree-row-item-icon-wrapper"
          @click="toggleIcon"
        >
          <!-- <custom-active-icon /> -->
          <i v-if="closed" class="fa-sharp fa-solid fa-minus"></i>
          <i v-else class="fa fa-plus"></i>
        </div>
        <!-- #checkbox="{ id, checked, node, indeterminate, toggleCheckbox }" --><!--  :indeterminate="indeterminate"
              @click="toggleCheckbox(id)" --><!-- <custom-checkbox class="mr-3" :checked="true" /> -->
        <input type="checkbox" name="checkbox" class="mr-3" />
        <span class="tree-row-txt">{{ group.name }}</span>
        <!-- <span class="child-count">{{ group.groups.length }}</span> -->
        <div class="delete-icon">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="feather feather-x"
          >
            <line x1="18" y1="6" x2="6" y2="18"></line>
            <line x1="6" y1="6" x2="18" y2="18"></line>
          </svg>
        </div>
      </div>
      <tree-list v-if="group.groups.length > 0" :groups="group.groups" />
      <!-- <ul
          v-if="group.groups.length > 0 && closed"
          class="tree-list"
          style="gap: 0px;"
        >
          <li
            v-for="child in group.groups"
            :key="child.id"
            class="tree-row hover:bg-gray-500 ml-6"
            style="gap: 0px; padding-left: 24px;"
          >
            <div class="tree-row-item">
              <span class="tree-row-txt">{{ child.name }}</span>
            </div>
          </li>
        </ul> -->
    </li>
  </ul>
</template>

<script>
import { ref } from "vue";
import TreeList from "@/components/utils/tree-list/TreeList.vue";
export default {
  components: {
    TreeList,
  },
  props: {
    groups: {
      type: Object,
      required: true,
    },
  },
  setup() {
    let closed = ref(true);

    const toggleIcon = () => {
      console.log(closed);
      closed.value = !closed.value;
      console.log(closed);
    };

    return {
      closed,
      toggleIcon,
    };
  },
};
</script>
