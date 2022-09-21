<script>
import { ref } from "vue";
import { useStore } from "vuex";
import useFilteredProducts from "@/composables/useFilteredProducts";
import { ADD_TO_CART, ADD_KEYWORD } from "@/store/constants";
import { updateKeyword, priceFormat } from "@/store/composables";
import ProductsGroupTabs from "@/components/pos/ProductsGroupTabs.vue";
export default {
  components: { ProductsGroupTabs },
  setup() {
    const store = useStore();
    // const updateChange = () => store.commit(UPDATE_CHANGE);

    // const keyword = computed(() => store.getters.GET_KEYWORD);
    const keyword = ref("");
    // console.log("keyword", keyword);
    const addToCart = (product) => store.dispatch(ADD_TO_CART, product);

    return {
      addToCart,
      updateKeyword,
      useFilteredProducts,
      keyword,
      priceFormat,
    };
  },
};
</script>
<template>
  <!-- store menu -->
  <div class="flex flex-col bg-blue-gray-50 h-full w-full py-4">
    <div class="flex px-2 flex-row relative">
      <div
        class="absolute left-3 top-3 m-2 p-2 rounded-full bg-pink-500 text-white"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-5 w-5"
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
      </div>
      <input
        v-model="keyword"
        type="text"
        class="bg-white rounded-lg border-none shadow text-lg w-full h-12 pl-16 focus:outline-pink-500 focus:shadow-lg"
        placeholder="Barcode, Name, Picture, anything at all ..."
        @keyup="updateKeyword(keyword)"
      />
    </div>
    <div class="h-full overflow-hidden mt-4">
      <div class="h-full overflow-y-auto px-2">
        <!-- CATEGORY TABS START -->
        <products-group-tabs></products-group-tabs>

        <!-- CATEGORY TABS END -->
        <div
          v-if="useFilteredProducts().length === 0"
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
          v-if="useFilteredProducts().length === 0 && keyword.length > 0"
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
        <div class="grid grid-cols-4 gap-4 pb-3">
          <div v-for="product in useFilteredProducts()" :key="product.id">
            <div
              role="button"
              class="select-none cursor-pointer transition-shadow overflow-hidden rounded-2xl bg-white shadow hover:shadow-lg"
              title="Cucumber"
              @click="addToCart(product)"
            >
              <img :src="product.image" :alt="product.name" />
              <div class="flex pb-3 px-3 text-sm -mt-3">
                <p class="flex-grow truncate mr-1">{{ product.name }}</p>
                <p class="nowrap font-semibold">
                  {{ priceFormat(product.price) }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end of store menu -->
</template>
