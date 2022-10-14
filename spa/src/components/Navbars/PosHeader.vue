<template>
  <div class="flex justify-between h-full pt-6">
    <div
      class="w-2/3 my-1 md:flex items-center justify-start divide-x divide-aronium-500 text-aronium-white font-light bg-aronium-800"
    >
      <ul class="flex text-sm mr-3">
        <li
          v-for="item in posHeaderItems"
          :key="item.id"
          class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
          @click="item.submit($emit, item.title)"
        >
          <div
            class="flex flex-col items-center border border-aronium-500 px-4 py-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="mb-1 text-xl"
              ><i :class="item.icon" aria-hidden="true"></i
            ></span>
            <span class="text-center">{{ item.title }}</span>
          </div>
        </li>
      </ul>

      <ul class="flex text-sm pl-3">
        <li
          class="block font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
          @click="saveSale"
        >
          <div
            class="flex flex-col items-center border border-aronium-500 px-6 py-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="text-3xl"
              ><h1 class="font-bold drop-shadow-lg">F9</h1></span
            >
            <span class="text-center text-sm font-semibold tracking-wider"
              >Save sale</span
            >
          </div>
        </li>
        <li
          class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
          @click="$emit('paymentModal')"
        >
          <div
            class="w-32 h-16 flex flex-col items-center bg-aronium-green py-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="text-3xl"
              ><h1 class="font-bold drop-shadow-lg">F8</h1></span
            >
            <span class="text-center text-sm font-semibold tracking-wider"
              >Payment</span
            >
          </div>
        </li>

        <li class="relative font-light mr-2 last:mr-0">
          <button
            :disabled="cart.length === 0"
            class="cursor-pointer hover:text-pink-700 w-32 h-16 flex flex-col items-center border border-aronium-500 py-1 disabled:opacity-30 disabled:hover:text-aronium-600 disabled:cursor-auto"
            @click="$emit('cashModal')"
          >
            <!-- @click="broadcastFunction(item)" -->

            <span class="text-3xl"
              ><h1 class="font-bold drop-shadow-lg">F9</h1></span
            >
            <span class="text-center text-sm font-semibold tracking-wider"
              >Cash</span
            >
          </button>
        </li>
      </ul>
    </div>
    <div class="flex items-center p-3">
      <user-dropdown></user-dropdown>

      <main-menu-popper></main-menu-popper>
    </div>
  </div>
</template>

<script>
import { posHeaderItems } from "@/composables/staticData";
import { useCart } from "@/store/composables";

import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";
// import MainMenuModal from "@/components/modals/MainMenuModal.vue";
import MainMenuPopper from "@/components/poppers/MainMenuPopper.vue";

// export default {
// components: {
//   CashPopper,
// },
// emits: ["open"],
// setup(props, context) {
export default {
  components: {
    UserDropdown,
    MainMenuPopper,
  },
  emits: ["cashModal", "paymentModal"],
  setup() {
    const cart = useCart;
    const broadcastFunction = (item) => {
      console.log(item);
    };
    const openModal = (e) => {
      console.log("e.keyCode: ", e.keyCode);
    };
    return {
      posHeaderItems,
      broadcastFunction,
      openModal,
      cart,
    };
  },
};
</script>
