<script setup>
import { ref, computed } from "vue";
const moneys = [];
let cart = [];
const getItemsCount = ref(0);
const priceFormat = (price) => Number(price);

let cash = 0;
let receiptNo = null;
let receiptDate = null;
let change = 0;
let total = 0;

const addQty = (item, number) => item.quantity + number;
const addCash = (money) => console.log(money);
const submit = (e) => console.log(e);

const getTotalPrice = () => {
  return computed(
    cart.reduce((total, item) => total + item.qty * item.price, 0)
  );
};

const playSound = (src) => {
  const sound = new Audio(src);
  sound.src = src;
  sound.play();
  // sound.onended = () => delete sound;
};

const updateChange = () => computed((change = cash - getTotalPrice()));

const numberFormat = (number) => {
  return (number || "")
    .toString()
    .replace(/^0|\./g, "")
    .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
};

const beep = () => computed(playSound("sound/beep-29.mp3"));

const clearSound = () => computed(playSound("sound/button-21.mp3"));

const clear = () => {
  cash = 0;
  cart = [];
  receiptNo = null;
  receiptDate = null;
  updateChange();
  this.clearSound();
};
const submitable = () => computed(change >= 0 && cart.length > 0);
</script>

<template>
  <!-- right sidebar -->
  <div
    class="w-6/12 flex flex-col bg-blue-gray-50 h-full bg-white pr-4 pl-2 py-4"
  >
    <div class="bg-white rounded-3xl flex flex-col h-full shadow">
      <!-- empty cart -->
      <div
        v-if="cart.length === 0"
        class="flex-1 w-full p-4 opacity-25 select-none flex flex-col flex-wrap content-center justify-center"
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
      <div v-if="cart.length > 0" class="flex-1 flex flex-col overflow-auto">
        <div class="h-16 text-center flex justify-center">
          <div class="pl-8 text-left text-lg py-4 relative">
            <!-- cart icon -->
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 inline-block"
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
            <div
              v-if="getItemsCount() > 0"
              class="text-center absolute bg-cyan-500 text-white w-5 h-5 text-xs p-0 leading-5 rounded-full -right-2 top-3"
            >
              {{ getItemsCount() }}
            </div>
          </div>
          <div class="flex-grow px-8 text-right text-lg py-4 relative">
            <!-- trash button -->
            <button
              class="text-blue-gray-300 hover:text-pink-500 focus:outline-none"
              @click="clear()"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-6 w-6 inline-block"
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
              class="select-none mb-3 bg-blue-gray-50 rounded-lg w-full text-blue-gray-700 py-2 px-2 flex justify-center"
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
                <div class="w-28 grid grid-cols-3 gap-2 ml-2">
                  <button
                    class="rounded-lg text-center py-1 text-white bg-blue-gray-600 hover:bg-blue-gray-700 focus:outline-none"
                    @click="addQty(item, -1)"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-6 w-3 inline-block"
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
                    type="number"
                    class="bg-white rounded-lg text-center shadow focus:outline-none focus:shadow-lg text-sm"
                  />
                  <button
                    class="rounded-lg text-center py-1 text-white bg-blue-gray-600 hover:bg-blue-gray-700 focus:outline-none"
                    @click="addQty(item, 1)"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-6 w-3 inline-block"
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
        <div class="flex mb-3 text-lg font-semibold text-blue-gray-700">
          <div>TOTAL</div>
          <!-- <div class="text-right w-full">
              {{ priceFormat(getTotalPrice()) }}
            </div> -->
        </div>
        <div
          class="mb-3 text-blue-gray-700 px-3 pt-2 pb-3 rounded-lg bg-blue-gray-50"
        >
          <div class="flex text-lg font-semibold">
            <div class="flex-grow text-left">CASH</div>
            <div class="flex text-right">
              <div class="mr-2">Rp</div>
              <!-- <input
                  :value="numberFormat(cash)"
                  type="text"
                  class="w-28 text-right bg-white shadow rounded-lg focus:bg-white focus:shadow-lg px-2 focus:outline-none"
                  @keyup="updateCash($event.target.value)"
                /> -->
            </div>
          </div>
          <hr class="my-2" />
          <div class="grid grid-cols-3 gap-2 mt-2">
            <!--   <template v-for="money in moneys" :key="money">
                <button
                  class="bg-white rounded-lg shadow hover:shadow-lg focus:outline-none inline-block px-2 py-1 text-sm"
                  @click="addCash(money)"
                >
                  +<span>{{ numberFormat(money) }}</span>
                </button>
              </template> -->
          </div>
        </div>

        <div
          v-if="change > 0"
          class="flex mb-3 text-lg font-semibold bg-cyan-50 text-blue-gray-700 rounded-lg py-2 px-3"
        >
          <div class="text-cyan-800">CHANGE</div>
          <div class="text-right flex-grow text-cyan-600">
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
          class="flex justify-center mb-3 text-lg font-semibold bg-cyan-50 text-cyan-700 rounded-lg py-2 px-3"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6 inline-block"
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
            'bg-cyan-500 hover:bg-cyan-600': submitable(),
            'bg-blue-gray-200': !submitable(),
          }"
          :disabled="!submitable()"
          @click="submit()"
        >
          SUBMIT
        </button>
      </div>
      <!-- end of payment info -->
    </div>
  </div>
  <!-- end of right sidebar -->
</template>
