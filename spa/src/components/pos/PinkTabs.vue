<template>
  <div class="flex flex-wrap">
    <div class="w-full">
      <ul class="grid grid-cols-4 mb-0 list-none pt-3 pb-4">
        <li
          class="mt-2 mr-2 last:mr-0 flex-auto text-center"
          v-for="tab in productGroups"
          :key="tab.id"
        >
          <Transition>
            <a
              class="text-xs font-bold uppercase px-5 py-3 cursor-pointer shadow-lg rounded block leading-normal"
              @click="toggleTabs(tab.id)"
              :class="{
                'text-pink-600 bg-white': openTab !== tab.id,
                'text-white bg-pink-600': openTab === tab.id,
              }"
            >
              {{ tab.name }}
            </a>
          </Transition>
        </li>
      </ul>
      <div
        class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded"
      >
        <div class="px-4 py-5 flex-auto">
          <slot
            :productGroups="productGroups"
            :tabProducts="tabProducts"
            :openTab="openTab"
          ></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { reactive, ref, onMounted } from "vue";
import axios from "axios";
export default {
  name: "pink-tabs",
  setup() {
    let openTab = ref(0);
    let tabProducts = reactive([]);

    let productGroups = [];
    const getProductGroups = async () => {
      try {
        const response = await axios.get(
          "http://127.0.0.1:8000/api/product/groups/"
        );
        for (let product of response.data) {
          // categories.push({id:0,name"All Pro})
          productGroups.push(product);
        }
      } catch (error) {
        console.log(error);
      }
    };

    onMounted(getProductGroups);

    productGroups.unshift({ id: 0, name: "All Products" });

    const toggleTabs = async (tabNumber) => {
      openTab.value = tabNumber;
      let url;
      if (tabNumber === 0) {
        url = "http://127.0.0.1:8000/api/product/all/";
      } else {
        url = `http://127.0.0.1:8000/api/product/all/?group=${tabNumber}`;
      }
      try {
        const response = await axios.get(url);
        tabProducts.value = response.data;
        console.log("tabProducts",tabProducts.value);
      } catch (error) {
        console.log(error);
      }
    };
    return {
      openTab,
      toggleTabs,
      tabProducts,
      productGroups,
    };
  },
};
</script>
