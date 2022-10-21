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
import PinkTabs from "@/components/pos/PinkTabs.vue";
import PosProductList from "@/components/pos/products/PosProductList.vue";
import Grid from "@/components/shared/Grid.vue";
// import StoreProductWidget from "@/components/pos/products/StoreProductWidget.vue";

export default {
  components: {
    // ProductsGroupTabs,
    PosProductList,
    PinkTabs,
    Grid,
    // StoreProductWidget,
  },
  async setup() {
    const fetchStore = useFetch();
    onMounted(fetchStore.fetchGroups);
    // onMounted();

    // onMounted(async () => {
    //   await fetchStore.fetchGroups;
    // });

    const keyword = ref("");
    const activeGroup = ref(0);

    const submitItem = (item) => {
      console.log(item);
      activeGroup.value = item.id;
    };

    onUpdated(() => {
      console.log("updating: " + activeGroup.value);
    });

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
    };
  },
};
</script>
<template>
  <!-- store menu -->
  <div class="flex flex-col bg-transparent h-full w-full">
    <!-- SEARCH INPUT IN STORE -->
    <div class="h-full overflow-hidden p-2">
      <div
        v-if="filteredProducts != undefined"
        class="h-full overflow-y-auto px-2"
      >
        <!-- CATEGORY TABS START -->
        <!-- <products-group-tabs></products-group-tabs> -->

        <!-- <div
          v-if="filteredProducts.length === 0"
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
        </div> -->
        <!-- v-if="filteredProducts.length === 0 && keyword.length > 0" -->
        <!-- <div
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
        </div> -->

        <div class="flex flex-wrap">
          <!-- {{ isActive }} -->
          <!-- <pre>{{ productGroups[0].id }}</pre> -->
          <grid rows="4" cols="6" gap="2">
            <Suspense>
              <template #default>
                <div
                  v-for="item in filteredGroups"
                  :key="item.id"
                  class="h-64"
                  :class="
                    activeGroup === item.id
                      ? `col-span-${item.groups.length}`
                      : 'col-span-1'
                  "
                >
                  <div
                    role="button"
                    class="h-full w-48 select-none cursor-pointer transition-shadow overflow-hidden border-2 border-solid border-aronium-500 rounded-sm bg-aronium-900 hover:shadow-xl"
                    :title="item.name"
                    @click="submitItem(item)"
                  >
                    <!-- {{ isActive === item.id }} -->
                    <div
                      v-if="activeGroup === item.id"
                      class="flex items-center justify-center h-3/4 w-48 overflow-hidden"
                    >
                      <i class="fa fa-arrow-left fa-2xl"></i>
                    </div>
                    <div
                      v-else
                      class="flex items-center justify-center h-3/4 w-48 overflow-hidden"
                      :class="item.image ? 'h-3/4 w-48' : 'hidden'"
                    >
                      <img
                        :src="item.image"
                        :alt="item.name"
                        class="h-full w-full object-contain object-center lg:h-full lg:w-full"
                      />
                    </div>
                    <div class="px-3 mt-2 flex justify-between">
                      <div class="relative">
                        <h3 class="text-sm">
                          <a href="#">
                            <span aria-hidden="true" class="absolute inset-0" />
                            {{ item.name }}
                          </a>
                        </h3>
                        <p class="mt-1 text-sm">Green</p>
                      </div>
                      <p class="text-sm font-medium">
                        {{ priceFormat(180) }}
                      </p>
                    </div>
                  </div>
                  {{ item.id }}

                  <!-- <div class="block text-center h-1/4 pt-2 text-sm py-3">
                <p v-if="group.image" class="block truncate mr-1">
                  {{ group.name }}
                </p>
                <p
                  class="text-aronium-white p-3 text-left nowrap font-semibold"
                >
                  {{ priceFormat(180) }}
                </p>
              </div> -->
                </div>
              </template>
              <template #fallback>
                <div class="h-64 p-1 bg-aronium-white animate-pulse">
                  <div
                    class="h-full select-none cursor-pointer transition-shadow overflow-hidden border-2 border-solid border-aronium-500 rounded-sm bg-aronium-900 hover:shadow-xl"
                  >
                    <div
                      class="flex items-center justify-center h-3/4 w-48 overflow-hidden bg-aronium-500"
                    >
                      <span class="text-6xl">
                        <i class="fa fa-cart-circle-arrow-down"></i>
                        <i class="fa-solid fa-cart-shopping"></i>
                      </span>
                    </div>
                  </div>
                </div>
              </template>
            </Suspense>

            <!-- </div> -->
            <!-- <div v-else>WAIT FOR IT</div> -->
          </grid>
        </div>

        <hr class="my-10" />
        <pink-tabs v-slot="{ productGroups, openTab }">
          <div class="tab-content tab-space">
            <div
              v-for="content in productGroups"
              :key="content.id"
              :class="{
                hidden: openTab !== content.id,
                block: openTab === content.id,
              }"
            >
              <pos-product-list :products="filteredProducts">
              </pos-product-list>

              <!-- <div class="grid grid-cols-4 gap-3">
                <template v-for="product in tabProducts" :key="product.id">
                  <store-product-widget
                    :product="product"
                  ></store-product-widget>
                </template>
              </div> -->
            </div>
          </div>
        </pink-tabs>
        <!-- CATEGORY TABS END -->

        <!-- <div class="grid grid-cols-4 gap-4 pb-3">
          <template v-for="product in tabProducts" :key="product.id">
            <store-product-widget :item="product" />
          </template>
        </div> -->
      </div>
    </div>
  </div>
  <!-- end of store menu -->
</template>
