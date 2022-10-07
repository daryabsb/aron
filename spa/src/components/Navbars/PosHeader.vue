<template>
  <div
    class="w-full flex items-center justify-start text-aronium-white font-light bg-aronium-800 pt-1"
  >
    <ul class="flex text-sm h-12 mr-3">
      <li
        v-for="item in posHeaderItems"
        :key="item.id"
        class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
        @click="item.submit($emit, item.title)"
      >
        <div
          class="w-24 h-16 flex flex-col items-center border border-aronium-500 px-2 py-1 my-1"
        >
          <!-- @click="broadcastFunction(item)" -->
          <span class="mb-1 text-xl"
            ><i :class="item.icon" aria-hidden="true"></i
          ></span>
          <span class="text-center">{{ item.title }}</span>
        </div>
      </li>
    </ul>
    <div class="relative flex items-center justify-start">
      <div class="fixed top-3 h-16 border-r-2 border-aronium-500"></div>
    </div>
    <ul class="flex text-sm h-12 pl-3">
      <li
        class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0"
        @click="saveSale"
      >
        <div
          class="w-32 h-16 flex flex-col items-center border border-aronium-500 py-1 my-1"
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
        @click="saveSale"
      >
        <div
          class="w-32 h-16 flex flex-col items-center bg-aronium-green py-1 my-1"
        >
          <!-- @click="broadcastFunction(item)" -->
          <span class="text-3xl"
            ><h1 class="font-bold drop-shadow-lg">F10</h1></span
          >
          <span class="text-center text-sm font-semibold tracking-wider"
            >Payment</span
          >
        </div>
      </li>
      <Popper arrow>
        <li class="font-light mr-2 last:mr-0">
          <div
            class="hover:text-pink-700 w-32 h-16 flex flex-col items-center border border-aronium-500 py-1 my-1"
          >
            <!-- @click="broadcastFunction(item)" -->
            <span class="text-3xl"
              ><h1 class="font-bold drop-shadow-lg">F12</h1></span
            >
            <span class="text-center text-sm font-semibold tracking-wider"
              >Cash</span
            >
          </div>
        </li>
        <template #content="{ close }">
          <cash-popper @close="close"></cash-popper>
        </template>
      </Popper>
    </ul>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { posHeaderItems } from "@/composables/staticData";

import CashPopper from "@/components/poppers/CashPopper.vue";
// export default {
// components: {
//   CashPopper,
// },
// emits: ["open"],
// setup(props, context) {

const broadcastFunction = (item) => {
  // console.log(productsMenu);
  // item.submit(context, item.title);
  // emit("open", item.title);
};
const openModal = (e) => {
  console.log("e.keyCode: ", e.keyCode);
};

window.onkeydown = (evt) => {
  const getEvt = (key) => {
    key = key.toString();

    const myKeys = new Map();

    myKeys.set("119", (openPaymentModal.value = !openPaymentModal.value));
    myKeys.set("120", (openCashModal.value = !openCashModal.value));
    console.log(myKeys.get(key) || "None");
  };

  getEvt(evt.keyCode);
  // console.log(typeof evt.keyCode);
  return "119" || "Did not reach";
  // openModal(evt);
  // switch (evt.keyCode) {
  //   //ESC
  //   case 27:
  //     evt.preventDefault();
  //     console.log("esc");
  //     break;
  //   //F1
  //   case 112:
  //     evt.preventDefault();
  //     console.log("f1");
  //     break;
  //   default:
  //     return;
  // }
};

const openCashModal = ref(false);
const openPaymentModal = ref(false);

//   return { posHeaderItems, broadcastFunction, context };
// },
// };
</script>
