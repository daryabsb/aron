<script>
import { ref, computed, onUpdated, onMounted, onBeforeMount } from "vue";
import { useFetch } from "@/stores/fetch";
// import useFilteredProducts from "@/composables/useFilteredProducts";
import {
  updateKeyword,
  filteredProducts,
  priceFormat,
  addToCart,
  tabProducts,
} from "@/store/composables";

/* COMPONENTS */
// import ProductsGroupTabs from "@/components/pos/ProductsGroupTabs.vue";
import GroupTree from "@/components/imported/GroupTree.vue";
import PosProductList from "@/components/pos/products/PosProductList.vue";
import Grid from "@/components/shared/Grid.vue";
// import StoreProductWidget from "@/components/pos/products/StoreProductWidget.vue";

export default {
  components: {
    // ProductsGroupTabs,
    GroupTree,
    // StoreProductWidget,
  },
  async setup() {
    const fetchStore = useFetch();
    onMounted(fetchStore.fetchGroups);

    const keyword = ref("");
    const activeGroup = ref(0);

    const submitItem = (item) => {
      console.log(item);
      activeGroup.value = item.id;
    };

    onUpdated(() => {
      console.log("updating: " + activeGroup.value);
    });

    const nodeWasClicked = (node) => {
      console.log(node.name);
    };

    const filteredGroups = ref(fetchStore.filteredGroups);
    const childGroups = ref(fetchStore.childGroups);
    return {
      addToCart,
      updateKeyword,
      filteredProducts,
      keyword,
      priceFormat,
      tabProducts,
      activeGroup,
      submitItem,
      filteredGroups,
      childGroups,
      nodeWasClicked,
    };
  },
};
</script>
<template>
  <!-- store menu -->
  <div class="flex flex-nowrap mt-1">
    <!-- SEARCH INPUT IN STORE -->
    <div class="flex flex-wrap items-start overflow-auto p-2">
      <GroupTree :nodes="filteredGroups" @on-click="nodeWasClicked" />
    </div>
    <!-- v-if="selectedGroup" -->
    <div class="grid grid-cols-2 border border-aronium-500 ml-3 h-full m-3 p-2">
      <div
        v-for="item in filteredProducts"
        :key="item.id"
        class="flex flex-wrap mx-1 overflow-hidden min-w-max"
      >
        <!-- @click="nodeClicked(item)" -->
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
            <div class="relative">
              <p class="text-sm font-medium">
                {{ priceFormat(180) }}
              </p>
              <p
                v-if="item.stock_quantity"
                class="m-2 text-sm text-aronium-green"
              >
                {{ item.stock_quantity }}
              </p>
              <p v-else class="m-2 text-sm text-aronium-danger">
                Out of Stock
              </p>
            </div>
          </div>
        </div>

        <!-- @on-cick="(item) => $emit('onClick', item)" -->
      </div>
    </div>
  </div>
  <!-- end of store menu -->
</template>
