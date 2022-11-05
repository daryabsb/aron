<template>
  <div>
    <Popper arrow>
      <button
        class="mr-2 justify-center relative inline-flex items-center rounded-r-sm border border-aronium-500 bg-aronium-700 ml-2 px-4 py-2 text-sm font-medium text-aronium-white hover:bg-pink-500"
      >
        {{ aNumber || activeOrderNumber }}
      </button>
      <template #content="{ close }">
        <div
          class="bg-aronium-900 min-w-full text-aronium-white text-base z-50 py-2 list-none border border-aronium-500 min-w-48"
          @click="close"
        >
          <a
            v-for="item in $filters.reverse(cart)"
            :key="item.number"
            href="javascript:void(0);"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
            @click="submitActiveOrderNumber(item.number)"
          >
            {{ item.price }}
          </a>

          <a
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
            @click="close"
            >Close</a
          >
        </div>
      </template>
    </Popper>
    <!-- <Popper v-bind="$attrs" hover openDelay="200" closeDelay="100"> -->
  </div>
</template>

<script>
import { ref } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";

// import Popper from "vue3-popper";

// import image from "@/assets/img/team-1-800x800.jpg";

export default {
  components: {
    // Popper,
  },
  setup() {
    const store = useOrderStore();
    const changeActiveOrderNumber = store.changeActiveOrderNumber;
    const aNumber = ref("");
    const cart = store.cart;
    const activeOrderNumber = store.activeOrderNumber;
    const submitActiveOrderNumber = async (number) => {
      aNumber.value = number;
      changeActiveOrderNumber(number);
      // close();
    };
    return {
      submitActiveOrderNumber,
      activeOrderNumber,
      aNumber,
      cart,
    };
  },
};
</script>
