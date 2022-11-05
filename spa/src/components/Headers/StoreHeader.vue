<template>
  <div class="flex justify-between w-full h-full items-center">
    <div class="w-full phone:flex md:hidden text-aronium-white font-light">
      <Popper arrow>
        <a class="text-aronium-white block" href="#pablo">
          <div class="items-center flex">
            <span
              class="w-10 h-10 text-sm text-aronium-white inline-flex items-center justify-center"
            >
              <button class="ml-6 text-2xl">
                <i class="fa fa-bars"></i>
              </button>
            </span>
          </div>
        </a>

        <template #content="{ close }">
          <Transition mode="out-in">
            <div
              class="w-full bg-aronium-800 border-y border-l pl-6 pr-20 border-aronium-500 text-base z-50 float-left py-6 list-none text-left rounded shadow-lg"
            >
              <div class="h-fit w-full pr-2 mb-6">
                <div
                  class="flex justify-between w-full text-aronium-white py-6"
                >
                  <span class="cursor-pointer mr-4" @click="close"
                    ><i class="fa fa-arrow-left"></i
                  ></span>
                  <span>
                    <h1>POS1 - Darya Ibrahim</h1>
                  </span>
                  <!-- @click="close" -->
                </div>
              </div>
              <div class="flex flex-col justify-between">
                <ul class="my-6">
                  <li>
                    <a
                      href="javascript:void(0);"
                      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                    >
                      Action
                    </a>
                  </li>
                  <li>
                    <a
                      href="javascript:void(0);"
                      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                    >
                      Another action
                    </a>
                  </li>

                  <li>
                    <a
                      href="http://127.0.0.1:8000/logout/"
                      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                    >
                      Logout
                    </a>
                  </li>
                  <li class="cursor-pointer" @click="close">
                    <a
                      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                      >Close</a
                    >
                  </li>
                </ul>
              </div>
            </div>
          </Transition>
        </template>
      </Popper>
    </div>

    <div
      class="phone:hidden md:flex md:flex-nowrap w-full text-aronium-white font-light overflow-auto scrollbar"
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
            <span class="mb-1 sm:text-xl sm:px-8"
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
          @click="paymentModal"
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
        <!-- {{
          activeOrder.items.length === 0
        }} -->
        <li
          :disabled="activeOrder.items.length === 0"
          class="font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0 disabled:opacity-30 disabled:hover:text-aronium-600 disabled:cursor-auto"
          @click="cashModal"
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
import { useModals } from "@/stores/modals";
import { useOrderStore } from "@/Orders/ordersStore";
// const store = useOrderStore();
import {
  Bars3Icon,
  Bars2Icon,
  ChevronDoubleLeftIcon,
} from "@heroicons/vue/24/outline";
import UserDropdown from "@/components/Dropdowns/UserDropdown.vue";
import MainMenuPopper from "@/components/poppers/MainMenuPopper.vue";

export default {
  components: {
    UserDropdown,
    MainMenuPopper,
    Bars3Icon,
  },

  setup() {
    const store = useModals();
    const pos = useOrderStore();
    const cart = useCart;
    const activeOrder = pos.useActiveOrder;

    const broadcastFunction = (item) => {
      console.log(item);
    };
    const paymentModal = () => (store.openPaymentModal = true);
    const cashModal = () => (store.openCashModal = true);
    const orderDiscountModal = () => (store.openOrderDiscountModal = true);
    // const openModal = (e) => {
    //   console.log("e.keyCode: ", e.keyCode);
    // };
    const saveSale = () => console.log("Sale saved!");
    return {
      posHeaderItems,
      paymentModal,
      cashModal,
      orderDiscountModal,
      broadcastFunction,
      // openModal,
      saveSale,
      activeOrder,
      cart,
    };
  },
};
</script>
