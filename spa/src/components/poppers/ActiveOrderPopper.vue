<template>
  <div>
    <Popper arrow>
      <button
        class="grow justify-center mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-6 py-1"
      >
        {{ activeOrderNumber || "---" }}
      </button>
      <template #content="{ close }">
        <div
          class="bg-inherit text-aronium-white text-base z-50 py-2 list-none border border-aronium-500 min-w-48"
        >
          <a
            v-for="item in cart"
            :key="item.number"
            href="javascript:void(0);"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
            @click="submitActiveOrderNumber"
          >
            {{ item.number }}
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
import { activeOrderNumber, useCart } from "@/store/composables";

// import Popper from "vue3-popper";

// import image from "@/assets/img/team-1-800x800.jpg";

export default {
  components: {
    // Popper,
  },
  setup() {
    const cart = useCart;
    const submitActiveOrderNumber = () => {
      close();
    };
    return {
      submitActiveOrderNumber,
      activeOrderNumber,
      cart,
    };
  },
};
</script>
