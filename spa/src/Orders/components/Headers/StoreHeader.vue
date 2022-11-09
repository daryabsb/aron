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
          v-for="item in storeHeaderItems"
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
    <Popper arrow>
      <div
        class="h-full font-light hover:text-pink-700 cursor-pointer mr-2 last:mr-0 disabled:opacity-30 disabled:hover:text-aronium-600 disabled:cursor-auto"
      >
        <div
          class="py-4 inset-y-0 px-10 flex flex-col items-center border border-aronium-500"
        >
          <span class="text-center font-semibold">{{ activeNumber }}</span>
        </div>
      </div>
      <template #content="{ close }">
        <div
          class="bg-aronium-900 min-w-full text-aronium-white text-base z-50 py-2 list-none border border-aronium-500 min-w-48"
          @click="close"
        >
          <router-link
            v-for="order in $filters.reverse(cart)"
            v-slot="{ href, navigate, isActive }"
            :key="order.number"
            :to="`/store/order/${order.number}`"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
            @click="changeActiveOrderNumber(order.number)"
          >
            <a
              :href="href"
              class="text-sm py-2 font-normal block"
              :class="[
                isActive
                  ? 'text-pink-500 hover:text-pink-700'
                  : 'text-blueGray-700 hover:text-blueGray-500',
              ]"
              @click="navigate"
            >
              {{ order.number }}
            </a>
          </router-link>

          <router-link
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
            to="#"
            @click="close"
            >Close</router-link
          >
        </div>
      </template>
    </Popper>
    <!-- @click="broadcastFunction(item)" -->

    <div class="flex items-center p-3">
      <user-dropdown></user-dropdown>

      <main-menu-popper></main-menu-popper>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { useRoute } from "vue-router";
import { storeHeaderItems } from "@/Orders/orderStaticData";
import { useModals } from "@/stores/modals";
import { useOrderStore } from "@/Orders/ordersStore";

import UserDropdown from "@/Users/components/UserDropdown.vue";
import MainMenuPopper from "@/Orders/components/Modals/MainMenuPopper.vue";

const store = useModals();
const pos = useOrderStore();
const route = useRoute();
const cart = pos.cart;
const changeActiveOrderNumber = pos.changeActiveOrderNumber;
console.log(cart);
const activeOrder = pos.useActiveOrder;
const activeNumber = computed(() => route.params.number);

const paymentModal = () => (store.openPaymentModal = true);
const cashModal = () => (store.openCashModal = true);

const saveSale = () => console.log("Sale saved!");
</script>
