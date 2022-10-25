<template>
  <div>
    <div class="sm:hidden">
      <label for="tabs" class="sr-only">Select a tab</label>
      <!-- Use an "onChange" listener to redirect the user to the selected tab URL. -->
      <select
        id="tabs"
        name="tabs"
        class="block w-full rounded-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500"
      >
        <option v-for="tab in productGroups" :key="tab.id" :selected="tab.id">{{
          tab.name
        }}</option>
      </select>
    </div>
    <!-- {{ productGroups }} -->
    <div class="hidden sm:block">
      <nav class="isolate flex rounded-sm shadow" aria-label="Tabs">
        <button
          class="relative min-w-0 flex-1 overflow-hidden bg-aronium-800 border border-aronium-500 mr-1 my-2 py-4 px-4 text-sm font-medium text-center hover:bg-aronium-600 focus:right-1 focus:right-pink-500 focus:z-10"
          :class="[
            openTab === 0
              ? 'text-pink-500'
              : 'text-aronium-white hover:text-poink-700',
          ]"
          :aria-current="openTab === 0 ? 'page' : undefined"
          @click="toggleTabs(0)"
        >
          <span>All Product</span>
          <span aria-hidden="true" />
          <!-- :class="[
              tab.current ? 'bg-indigo-500' : 'bg-transparent',
              'absolute inset-x-0 bottom-0 h-0.5',
            ]" -->
        </button>
        <button
          v-for="tab in productGroups"
          :key="tab.id"
          class="relative min-w-0 flex-1 overflow-hidden bg-aronium-800 border border-aronium-500 mr-1 my-2 py-4 px-4 text-sm font-medium text-center hover:bg-aronium-600 focus:z-10"
          :class="[
            tab.id === openTab
              ? 'text-pink-500'
              : 'text-aronium-white hover:text-pink-700',
          ]"
          :aria-current="tab.id === openTab ? 'page' : undefined"
          @click="toggleTabs(tab.id)"
        >
          <span>{{ tab.name }}</span>
          <span aria-hidden="true" />
          <!-- :class="[
              tab.current ? 'bg-indigo-500' : 'bg-transparent',
              'absolute inset-x-0 bottom-0 h-0.5',
            ]" -->
        </button>
      </nav>
      <div>
        <div
          v-if="products.length === 0"
          class="select-none bg-inherit flex flex-wrap content-center justify-center h-full opacity-25"
        >
          <div class="w-full text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-24 w-24 inline-block"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"
              />
            </svg>
            <p class="text-xl">
              YOU DON'T HAVE
              <br />
              ANY PRODUCTS TO SHOW
            </p>
          </div>
        </div>
        <div
          v-if="products.length === 0 && keyword.length > 0"
          class="select-none bg-blue-gray-100 rounded-3xl flex flex-wrap content-center justify-center h-full opacity-25"
        >
          <div class="w-full text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-24 w-24 inline-block"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
            <p class="text-xl">
              EMPTY SEARCH RESULT
              <br />
              "<span class="font-semibold">{{ keyword }}</span
              >"
            </p>
          </div>
        </div>
      </div>
      <pos-product-list :products="filteredProducts"></pos-product-list>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted, onBeforeMount } from "vue";
import getAllProductGroups from "@/stores/api/getAllProductGroups";
import { useFetch } from "@/stores/fetch";
import PosProductList from "@/components/pos/products/PosProductList.vue";

export default {
  components: {
    PosProductList,
  },
  setup() {
    const store = useFetch();
    // onBeforeMount(store.fetchProductData);
    const openTab = ref(0);
    const products = computed(() =>
      store.fetchProductsByGroupId(openTab.value)
    );
    onMounted(store.fetchProductsByGroupId(openTab.value));

    const keyword = ref("");

    console.log("products", products);
    console.log("products");
    const productGroups = computed(() =>
      store.productGroups.filter((g) => g.rank > 0)
    );

    const filteredProducts = computed(() => store.filteredProducts);

    // onMounted(store.fetchProductData);
    // products.value = store.products;

    const toggleTabs = (tabNumber) => {
      openTab.value = tabNumber;
    };

    return {
      keyword,
      products,
      productGroups,
      filteredProducts,
      openTab,
      toggleTabs,
    };
  },
};

// products.value = response.data;
// const groupsResponse = await fetch(
// "http://127.0.0.1:8000/api/product/groups/"
// );
// productGroups.value = groupsResponse.data;

// console.log(productGroups.value);
// const filteredProducts = computed(() =>
//   products.value.filter((p) => p.parent_group === openTab.value)
// );
// const tabs = [
//   { name: "My Account", href: "#", current: true },
//   { name: "Company", href: "#", current: false },
//   { name: "Team Members", href: "#", current: false },
//   { name: "Billing", hr, PosProductListef: "#", current: false },
// ];
</script>
