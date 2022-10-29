<template>
  <div class="">
    <div
      class="overflow-auto scrollbar mt-5 px-3 grid phone:grid-cols-1 tablet:grid-cols-6 xl:grid-cols-8 gap-3"
    >
      <div
        v-if="id"
        class="col-span-1 rounded-sm bg-white px-4 py-5 shadow sm:p-6"
        @click="back"
      >
        <dt class="truncate text-sm font-medium text-gray-500">
          <ChevronDoubleLeftIcon />
        </dt>
      </div>

      <template
        v-for="item in id ? selectedGroup.groups : parents"
        :key="item.id"
      >
        <Suspense>
          <template #default>
            <div
              class="h-32 border border-aronium-500 w-full col-span-1 flex flex-col items-center justify-center rounded-sm shadow"
              @click="selectGroup(item.id)"
            >
              <div
                v-if="item.image"
                class="h-20 w-full flex justify-center items-center mb-2"
              >
                <img
                  class="object-contain h-20"
                  :src="item.image"
                  :alt="item.name"
                />
              </div>
              <div v-else class="flex justify-center items-center">
                {{ item.name }}
              </div>
              <div
                v-if="item.image"
                class="truncate text-sm font-medium text-gray-500"
              >
                {{ item.name }}
              </div>
            </div>
          </template>
          <template #fallback>
            Loading
          </template>
        </Suspense>
      </template>
      <template v-for="item in id ? selectedGroupProducts : []" :key="item.id">
        <div
          v-if="selectedGroupProducts.length > 0"
          class="relative col-span-1 shadow"
        >
          <product-single-item :product="item"></product-single-item>
        </div>
      </template>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, defineAsyncComponent } from "vue";
import { ChevronDoubleLeftIcon } from "@heroicons/vue/24/outline";
import productsGroupsAPI from "@/services/productsGroupsAPI";
import { usePos } from "@/stores/pos";

const pos = usePos();
const addToCart = pos.addToCart;

const ProductSingleItem = defineAsyncComponent(() =>
  import("./PosSingleProduct.vue")
);

import { useFetch } from "@/stores/fetch";
import { onMounted } from "@vue/runtime-core";
const store = useFetch();
onMounted(store.fetchGroups);
const productGroups = ref([]);
const selectedGroupProducts = ref([]);
// const productGroups = store.productGroups.length > 0 ? store.productGroups : [];

const loadProductGroups = async () => {
  try {
    const response = await productsGroupsAPI.getProductGroups();
    productGroups.value = response.data;
    // console.log("response.data", response.data);
    return response.data;
  } catch (error) {
    console.log(error);
  }
};

const loadProductsByGroupId = async () => {
  try {
    const response = await productsGroupsAPI.getProductsByGroupId(id.value);
    selectedGroupProducts.value = response.data;
  } catch (error) {
    console.log(error);
  }
};
const parents = computed(() =>
  productGroups.value.filter((group) => group.is_parent === true)
);
const selectedGroup = computed(() =>
  productGroups.value.find((group) => group.id === id.value)
);

console.log("selectedGroup", selectedGroup.value);
const back = () => {
  id.value = null;
};
loadProductGroups();

const id = ref(null);
const selectGroup = async (groupId) => {
  // if (id.value) id.value = 0;
  id.value = groupId;
  await loadProductGroups();
  await loadProductsByGroupId(groupId);
};
</script>
