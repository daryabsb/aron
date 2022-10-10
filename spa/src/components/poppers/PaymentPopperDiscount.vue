<template>
  <div class="absolute h-full w-full z-20 bg-aronium-800">
    <div
      class="flex justify-center items-end w-full h-12 border-b border-aronium-500"
    >
      <button
        class="h-12 text-lg mx-2 px-6 border-b-2"
        :class="
          tabID === 1
            ? 'text-aronium-sky  border-aronium-sky'
            : 'text-aronium-white border-transparent'
        "
        @click="cartDiscount"
      >
        Cart discount
      </button>
      <button
        class="h-12 text-lg mx-2 px-6 border-b-2"
        :class="
          tabID === 2
            ? 'text-aronium-sky  border-aronium-sky'
            : 'text-aronium-white border-transparent'
        "
        @click="itemDiscount"
      >
        Item discount
      </button>
    </div>
    .
    <div v-if="tabID === 1" class="h-full w-full p-2">
      This is Cart discount
    </div>
    <div v-if="tabID === 2" class="h-full w-full p-2">
      This is Item discount
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
export default {
  name: "PaymentPopperDiscount",
  components: {},
  setup() {
    const isActive = ref(false);
    const tabID = ref(1);
    const discount = ref("");
    const cartDiscount = () => {
      tabID.value = 1;
    };
    const itemDiscount = () => {
      tabID.value = 2;
    };

    return {
      isActive,
      tabID,
      cartDiscount,
      itemDiscount,
    };
  },
};
</script>
