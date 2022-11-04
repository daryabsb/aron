<template>
  <div class="flex justify-between h-full items-center">
    <div
      class="laptop:flex w-auto md:flex items-center justify-start divide-x divide-aronium-500 text-aronium-white font-light bg-aronium-800"
    >
      <ul class="flex text-sm mr-3">
        <li
          v-for="item in posHeaderItems"
          :key="item.id"
          class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
          @click="item.submit($emit, item.title)"
        >
          <div
            class="flex flex-col items-center border border-aronium-500 py-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="mb-1 text-xl px-8"
              ><i :class="item.icon" aria-hidden="true"></i
            ></span>
            <span class="text-center xl:w-20">{{ item.title }}</span>
          </div>
        </li>
      </ul>
      <!-- <Teleport to="#modal"> -->

      <!-- </Teleport> -->

      <ul class="flex text-sm mr-3">
        <li
          class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
          @click="saveSale"
        >
          <div
            class="px-8 flex flex-col items-center border border-aronium-500 py-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="mb-1 text-xl"
              ><h1 class="font-bold drop-shadow-lg">F7</h1></span
            >
            <span class="text-center xl:w-20">Save sale</span>
          </div>
        </li>
        <li
          class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
          @click="$emit('paymentModal')"
        >
          <div
            class="px-10 flex flex-col items-center border border-aronium-500 py-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="mb-1 text-xl"
              ><h1 class="font-bold drop-shadow-lg">F8</h1></span
            >
            <span class="text-center xl:w-20">Payment</span>
          </div>
        </li>
        <li
          :disabled="cart.length === 0"
          class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0 disabled:opacity-30 disabled:hover:text-aronium-600 disabled:cursor-auto"
          @click="$emit('cashModal')"
        >
          <div
            class="px-10 flex flex-col items-center border border-aronium-500 py-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="mb-1 text-xl"
              ><h1 class="font-bold drop-shadow-lg">F9</h1></span
            >
            <span class="text-center xl:w-20">Cash</span>
          </div>
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
import { ref } from "vue";
import { posHeaderItems } from "@/composables/staticData";
import { useCart } from "@/store/composables";

import UserDropdown from "@/Users/components/UserDropdown.vue";
// import MainMenuModal from "@/components/modals/MainMenuModal.vue";
import MainMenuPopper from "@/Pos/components/Modals/MainMenuPopper.vue";

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
    const saveSale = () => console.log("Sale saved!");
    return {
      posHeaderItems,
      broadcastFunction,
      openModal,
      saveSale,
      cart,
    };
  },
};
</script>
