<script>
import { useStore } from "vuex";
import { CLEAR, UPDATE_CASH } from "@/store/constants";
import {
  priceFormat,
  submitable,
  addCash,
  getItemsCount,
  useCash,
  useChange,
  useCart,
  updateChange,
  addQty,
  getTotalPrice,
  submit,
} from "@/store/composables";
export default {
  setup() {
    const store = useStore();
    const moneys = store.state.moneys;
    // console.log("useCash", useCash.value);

    // GETTERS from COMPOSABLES
    const cart = useCart;
    const cash = useCash;
    const change = useChange;

    // const addCash = (amount) => store.commit(UPDATE_CHANGE, amount);
    const updateCash = (value) => store.commit(UPDATE_CASH, value);
    const clear = () => store.commit(CLEAR);

    const selectItem = (e) => console.log(e);

    return {
      cart,
      change,
      moneys,
      cash,
      addQty,
      getTotalPrice,
      getItemsCount,
      addCash,
      updateCash,
      clear,
      submitable,
      priceFormat,
      updateChange,
      selectItem,
      submit,
    };
  },
};
</script>

<template>
  <!-- right sidebar -->
  <div
    class="w-6/12 flex flex-col bg-blue-gray-50 h-full bg-white m-3 p-4 rounded-lg"
  >
    <div class="bg-white rounded-lg flex flex-col h-full shadow">
      <!-- empty cart -->
      <div
        v-if="cart.length === 0"
        class="bg-blue-gray-50 flex-1 w-full p-4 opacity-25 select-none flex flex-col flex-wrap content-center justify-center"
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
      <div class="flex-1 flex flex-col overflow-auto">
        <div class="h-16 text-center flex justify-center">
          <div class="pl-8 text-left text-lg py-4 relative">
            <!-- cart icon -->
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 inline-block text-pink-700"
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

            <h1 class="text-pink-700 inline-block font-semibold ml-3">
              {{ getItemsCount() }}
            </h1>

            <div
              v-if="getItemsCount > 0"
              class="text-center absolute bg-pink-500 text-white w-5 h-5 text-xs p-0 leading-5 rounded-full -right-2 top-3"
            ></div>
          </div>
          <div class="flex-grow px-8 text-right text-lg py-4 relative">
            <!-- trash button -->
            <button
              class="text-pink-300 hover:text-pink-700 focus:outline-none"
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
        <div class="flex-1 w-full px-4 overflow-auto">
          <template v-for="item in cart" :key="item.id">
            <div
              class="select-none mb-3 bg-blue-gray-50 border-pink-300 rounded-lg w-full text-blue-gray-700 py-2 px-2 flex justify-center"
              @click="selectItem(item)"
            >
              <img
                :src="item.image"
                alt=""
                class="rounded-lg h-10 w-10 bg-white shadow mr-2"
              />
              <div class="flex-grow">
                <h5 class="text-sm">{{ item.name }}</h5>
                <p class="text-xs block">{{ priceFormat(item.price) }}</p>
              </div>
              <div class="py-1">
                <div class="grid-flow-col gap-2">
                  <button
                    class="h-8 w-8 mr-1 mb-1 rounded-lg text-center text-white bg-pink-300 hover:bg-pink-700 focus:outline-none"
                    @click="addQty(item, -1)"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-8 w-8 inline-block"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M20 12H4"
                      />
                    </svg>
                  </button>
                  <input
                    v-model="item.qty"
                    type="text"
                    class="h-8 w-12 bg-white rounded-lg text-center shadow border-pink-300 focus:border-pink-700 focus:shadow-lg"
                  />
                  <button
                    class="h-8 w-8 mb-1 ml-1 rounded-lg text-center text-white bg-pink-300 hover:bg-pink-700 focus:outline-none"
                    @click="addQty(item, 1)"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-8 w-8 inline-block"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M12 6v6m0 0v6m0-6h6m-6 0H6"
                      />
                    </svg>
                  </button>
                </div>
              </div>
            </div>
          </template>
        </div>
      </div>
      <!-- end of cart items -->

      <!-- payment info -->
      <div class="select-none h-auto w-full text-center pt-3 pb-4 px-4">
        <div class="flex mb-3 text-lg font-semibold text-pink-700">
          <div>TOTAL</div>
          <div class="text-right w-full">
            {{ priceFormat(getTotalPrice().value) }}
          </div>
        </div>
        <div
          class="mb-3 text-blue-gray-700 px-3 pt-2 pb-3 rounded-lg bg-blue-gray-50"
        >
          <div class="flex text-lg font-semibold">
            <div class="flex-grow text-left">CASH</div>
            <div class="flex text-right">
              <input
                :value="cash"
                :placeholder="cash"
                type="text"
                class="h-8 text-right border-none shadow rounded-lg focus:bg-white focus:shadow-lg px-2 focus:outline-none"
                @keyup="updateCash($event.target.value)"
              />
              <div class="m-1">IQD</div>
            </div>
          </div>
          <hr class="my-2" />
          <div class="grid grid-cols-3 gap-2 mt-2">
            <template v-for="money in moneys" :key="money">
              <button
                class="bg-white rounded-lg shadow hover:shadow-lg focus:outline-none inline-block px-2 py-1 text-sm m-1"
                @click="addCash(money)"
              >
                +<span>
                  {{ money }}
                </span>
              </button>
            </template>
          </div>
        </div>
        <div
          v-if="change > 0"
          class="flex mb-3 text-lg font-semibold bg-pink-50 text-blue-gray-700 rounded-lg py-2 px-3"
        >
          <div class="text-pink-700">CHANGE</div>
          <div class="text-right flex-grow text-pink-700">
            {{ priceFormat(change) }}
          </div>
        </div>
        <div
          v-if="change < 0"
          class="flex mb-3 text-lg font-semibold bg-pink-100 text-blue-gray-700 rounded-lg py-2 px-3"
        >
          <div class="text-right flex-grow text-pink-600">
            {{ priceFormat(change) }}
          </div>
        </div>
        <div
          v-if="change == 0 && cart.length > 0"
          class="flex justify-center mb-3 text-lg font-semibold bg-pink-50 text-pink-700 rounded-lg py-2 px-3"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-8 w-8 inline-block"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M14 10h4.764a2 2 0 011.789 2.894l-3.5 7A2 2 0 0115.263 21h-4.017c-.163 0-.326-.02-.485-.06L7 20m7-10V5a2 2 0 00-2-2h-.095c-.5 0-.905.405-.905.905 0 .714-.211 1.412-.608 2.006L7 11v9m7-10h-2M7 20H5a2 2 0 01-2-2v-6a2 2 0 012-2h2.5"
            />
          </svg>
        </div>
        <button
          class="text-white rounded-2xl text-lg w-full py-3 focus:outline-none"
          :class="{
            'bg-pink-500 hover:bg-pink-600': submitable(),
            'bg-blue-gray-200': !submitable(),
          }"
          :disabled="!submitable()"
          @click="submit($event)"
        >
          SUBMIT
        </button>
      </div>
      <!-- end of payment info -->
    </div>
  </div>
  <!-- end of right sidebar -->
</template>
