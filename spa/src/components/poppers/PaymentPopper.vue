<template>
  <div
    class="absolute left-0 top-0 h-full py-12 flex items-center bg-opacity-90 bg-opacity-85 text-aronium-white bg-aronium-900 z-10"
  >
    <!-- ITEMS AT PAYMENT MODAL -->
    <div class="h-4/5 w-full flex border border-aronium-500">
      <div
        v-if="isShowItems"
        class="h-full w-1/5 text-center bg-transparent text-aronium-white"
      >
        <!-- <div class="w-full h-full bg-aronium-700 border-r border-aronium-500"> -->
        <div
          class="h-16 w-full text-left bg-aronium-900 p-2 border-b border-r border-aronium-500"
        >
          <h1 class="text-2xl font-light tracking-wider">Items</h1>
        </div>
        <div
          class="w-full h-full bg-aronium-700 border-b border-r border-aronium-500 text-left p-3"
        >
          <!-- ITEMS HERE -->
          <div v-for="item in cart" :key="item.id">
            <div
              class="bg-aronium-700 border-b mb-2 border-aronium-500 shadow w-full px-2 md:py-0 xl:py-1 flex justify-center"
            >
              <!-- <img
                :src="item.image"
                alt=""
                class="rounded-sm h-8 w-8 bg-transparent shadow mr-2"
              /> -->
              <div class="flex-grow">
                <h5
                  class="text-sm subpixel-antialiased tracking-wider font-semibold"
                >
                  {{ item.name }}
                </h5>
              </div>

              <div>
                <div class="flex items-center">
                  {{ priceFormat(item.price) }}
                </div>
              </div>
            </div>
          </div>
          <!-- ITEMS END -->
        </div>
        <!-- </div> -->
      </div>

      <div
        class="text-center bg-transparent text-aronium-white"
        :class="isShowItems ? 'w-4/5' : 'w-full'"
      >
        <div
          class="h-16 w-full flex justify-between text-left bg-aronium-900 p-2 border-b border-aronium-500"
        >
          <h1 class="text-2xl">Actions</h1>
          <span @click="$emit('close')">
            <i class="fa fa-times"></i>
          </span>
        </div>
        <div
          class="w-full h-full bg-aronium-700 border-b border-r border-aronium-500 text-left p-3"
        >
          <div class="flex items-center justify-between w-full h-24 bg-inherit">
            <button class="bg-aronium-danger py-4 px-16">
              <span><i class="fa fa-times"></i></span>
              Cancel
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import { priceFormat, addQty, useCart } from "@/store/composables";
export default {
  emits: ["close"],
  setup() {
    const cart = useCart;
    const isShowItems = ref(true);

    const showItems = () => (isShowItems.value = !isShowItems.value);

    return {
      isShowItems,
      showItems,
      priceFormat,
      addQty,
      cart,
    };
  },
};
</script>
