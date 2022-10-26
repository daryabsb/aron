<script>
import { ref, computed, onMounted, createApp } from "vue";
import { useStore } from "vuex";
import { usePos } from "@/stores/pos";
import { CLEAR, UPDATE_CASH } from "@/store/constants";
import {
  priceFormat,
  submitable,
  addCash,
  getItemsCount,
  getTotalPrice,
  useCash,
  useChange,
  updateChange,
  getItemTotalPrice,
  submit,
  isShowModalReceipt,
} from "@/store/composables";
import ModalReceipt from "@/components/pos/ModalReceipt.vue";
import ActiveOrderPopper from "@/components/poppers/ActiveOrderPopper.vue";
import OrderItem from "@/components/pos/orders/OrderItem.vue";

export default {
  components: {
    ActiveOrderPopper,
    ModalReceipt,
    OrderItem,
  },
  async setup() {
    const store = usePos();
    const createCart = store.createCart;
    const addQty = store.addQty;
    const clear = store.clear;
    const selectItem = (item) => (ID.value = item.id);
    const moneys = store.useMoneys;

    const activeOrderNumber = store.activeNumber;
    const useActiveOrder = store.useActiveOrder;
    const subTotalBeforeTax = store.subTotalBeforeTax;
    const ID = ref(0);
    const orderID = computed(() => (ID.value > 0 ? ID : "---"));
    const cart = store.cart;
    const cash = store.cash;
    const change = store.change;

    const updateCash = store.updateCash;

    const getIdNumber = () => console.log("ID Number is 5");

    return {
      cart,
      change,
      moneys,
      cash,
      orderID,
      ID,
      addQty,
      getTotalPrice,
      getItemTotalPrice,
      subTotalBeforeTax,
      getItemsCount,
      addCash,
      updateCash,
      clear,
      submitable,
      priceFormat,
      updateChange,
      selectItem,
      submit,
      getIdNumber,
      isShowModalReceipt,
      activeOrderNumber,
      useActiveOrder,
      createCart,
    };
  },
};
</script>

<template>
  <!-- right sidebar -->
  <div
    class="h-full w-full mx-1 flex flex-col bg-aronium-900 border border-aronium-500"
  >
    <div class="flex justify-center items-center p-1 h-18 bg-aronium-900">
      <button
        class="capitalize mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-4 py-1"
        disabled
        @click="startWithSampleData()"
      >
        <span class="mr-3">
          <i class="fa fa-times fa-sm"></i>
        </span>
        delete
      </button>

      <button
        class="capitalize mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-4 py-1"
        @click="add()"
      >
        quantity
      </button>

      <active-order-popper></active-order-popper>
      <button
        class="grow justify-center capitalize mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-4 py-1"
        @click="createCart()"
      >
        New Order
      </button>
      <!-- <button
        class="grow justify-center mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-6 py-1"
        @click="getIdNumber()"
      >
        {{ activeOrderNumber || "---" }}
      </button> -->
    </div>

    <div class="text-aronium-white flex flex-col h-full overflow-auto">
      <!-- empty cart -->
      <!-- <pre>{{ useActiveOrder }}</pre> -->
      <div
        v-if="useActiveOrder.items.length === 0"
        class="flex-1 w-full p-4 select-none flex flex-col flex-wrap content-center justify-center"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-16 inline-block"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"
          />
        </svg>
        <p>
          CART EMPTY
        </p>
      </div>

      <!-- cart items -->
      <!-- v-if="cart.length > 0" -->
      <div class="flex-1 flex flex-col overflow-hidden h-full">
        <!-- v-if="cart.length > 0" -->
        <div class="hidden h-16 text-center justify-center">
          <div
            class="text-aronium-white hover:text-pink-700 pl-8 text-left text-lg py-4 relative"
          >
            <!-- cart icon -->
            <i class="fa fa-cart h-8 inline-block"></i>

            <h1 class="inline-block font-semibold ml-3">
              <!-- {{ useActiveOrder.value.items.length }} -->
            </h1>

            <div
              v-if="useActiveOrder.items.length > 0"
              class="text-center absolute bg-pink-500 text-white w-5 h-5 text-xs p-0 leading-5 rounded-full -right-2 top-3"
            ></div>
          </div>
          <div class="flex-grow px-8 text-right text-lg py-4 relative">
            <!-- trash button -->
            <button
              class="hover:text-pink-700 focus:outline-none"
              @click="clear()"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-8 w-8"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                />
              </svg>
            </button>
          </div>
        </div>

        <div class="flex-1 w-full overflow-auto">
          <template v-for="item in useActiveOrder.items" :key="item.id">
            <div
              class="bg-aronium-700 border-y border-aronium-500 shadow w-full px-2 md:py-0 xl:py-1 flex justify-center"
              :class="
                item.id === ID
                  ? 'bg-aronium-sky-600  text-aronium-50 text-shadow-lg'
                  : 'bg-inherit'
              "
            >
              <!-- <img
                :src="item.image"
                alt=""
                class="rounded-sm h-8 w-8 bg-transparent shadow mr-2"
              /> -->
              <div class="flex-grow">
                <h5
                  class="relative text-sm subpixel-antialiased tracking-wider font-semibold w-32"
                >
                  <span>{{ item.product.name }}</span>
                  <div
                    v-if="item.product.discount"
                    class="flex absolute right-0 top-0 w-6 h-6 text-sm font-semibold text-center text-aronium-danger"
                  >
                    <span>-</span>
                    <span>{{ item.product.discount }}</span>
                    <span>{{ item.product.discountType }}</span>
                  </div>
                </h5>

                <p class="text-xs block mt-1 opacity-75">
                  <span
                    >#{{ item.id }} :
                    {{ priceFormat(getItemTotalPrice(item).value) }}</span
                  >
                  <!-- <span>#{{ item.id }} : {{ item }}</span> -->
                  <!-- <span>#{{ item.id }} : {{ getItemTotalPrice(item) }}</span> -->
                </p>
              </div>

              <div>
                <div class="flex items-center">
                  <button
                    class="flex flex-row items-center justify-center text-sm h-8 w-8 m-1 rounded-sm text-center text-aronium-white bg-inherit border border-aronium-700 shadow-sm hover:bg-pink-700 focus:outline-none"
                    @click="addQty(item, -1)"
                  >
                    <i class="fa fa-minus"></i>
                  </button>
                  <input
                    v-model="item.quantity"
                    type="text"
                    class="h-8 border-0 w-11 mr-1 text-center text-aronium-white bg-inherit"
                  />

                  <button
                    class="flex items-center justify-center text-sm h-8 w-8 mr-1 rounded-sm text-center text-aronium-white bg-inherit border border-aronium-700 shadow-sm hover:bg-pink-700 focus:outline-none"
                    @click="addQty(item, 1)"
                  >
                    <i class="fa fa-plus"></i>
                  </button>
                </div>
              </div>
            </div>
            <!-- NEW OrderItem -->
            <order-item
              :item="item"
              @click="selectItem(item.product)"
            ></order-item>
          </template>
        </div>
      </div>

      <!-- end of cart items -->
    </div>
    <div class="flex flex-col p-2 mt-2 h-56 border-t border-aronium-600">
      <div class="w-full flex justify-between text-aronium-white">
        <span class="text-sm">Subtotal</span>
        <span class="text-2sm">{{ priceFormat(subTotalBeforeTax) }}</span>
      </div>
      <div class="mb-1 pt-2 w-full flex justify-between text-aronium-white">
        <span class="text-sm">Tax</span>
        <span class="text-2sm">{{ useActiveOrder.tax }}</span>
      </div>
      <hr class="border-dashed" />

      <div class="w-full flex justify-between text-aronium-white my-1 py-1">
        <span class="text-lg text-pink-400 uppercase">Total</span>
        <span class="text-lg text-pink-400">{{
          priceFormat(useActiveOrder.total)
        }}</span>
      </div>

      <div class="flex items-start p-1 h-12 border-t mt-1 border-aronium-600">
        <button
          class="flex flex-col w-1/3 h-12 text-sm capitalize mr-1 items-center justify-center font-light bg-aronium-danger hover:bg-red-600 hover:shadow-lg px-4 py-1"
          @click="clear"
        >
          <span class="text-xl">
            <i class="fa fa-trash fa-sm"></i>
          </span>
          void order
        </button>
        <button
          class="flex flex-col w-1/3 h-12 text-sm capitalize mr-1 items-center justify-center font-light bg-aronium-800 hover:bg-aronium-700 hover:shadow-lg px-4 py-1"
          @click="clear()"
        >
          <span>
            <i class="fa fa-lock fa-lg"></i>
          </span>
          Lock
        </button>
        <button
          class="flex flex-col w-1/3 h-12 text-sm capitalize mr-1 items-center justify-center font-light bg-aronium-800 hover:bg-aronium-700 hover:shadow-lg px-4 py-1"
          @click="clear()"
        >
          <span>
            <i class="fa fa-repeat fa-lg"></i>
          </span>
          Repeat round
        </button>
      </div>
    </div>
    <!-- modal receipt -->
    <modal-receipt v-show="isShowModalReceipt"></modal-receipt>
  </div>
  <!-- end of right sidebar -->
</template>
