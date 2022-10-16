<script>
import { ref, computed } from "vue";
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
  getItemTotalPrice,
  submit,
  isShowModalReceipt,
  activeOrderNumber,
  useActiveOrder,
  createCart,
} from "@/store/composables";
import ModalReceipt from "@/components/pos/ModalReceipt.vue";
import ActiveOrderPopper from "@/components/poppers/ActiveOrderPopper.vue";
import Button from "@/components/shared/Button.vue";

export default {
  components: {
    ActiveOrderPopper,
    ModalReceipt,
    Button,
  },
  setup() {
    const store = useStore();
    const moneys = store.state.moneys;
    const ID = ref(0);
    const orderID = computed(() => (ID.value > 0 ? ID : "---"));

    // GETTERS from COMPOSABLES
    const cart = useCart;
    const cash = useCash;
    const change = useChange;

    // const addCash = (amount) => store.commit(UPDATE_CHANGE, amount);
    const updateCash = (value) => store.commit(UPDATE_CASH, value);
    const clear = () => store.commit(CLEAR);

    const selectItem = (item) => (ID.value = item.id);

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
        class="capitalize mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-6 py-1"
        disabled
        @click="startWithSampleData()"
      >
        <span class="mr-3">
          <i class="fa fa-times fa-sm"></i>
        </span>
        delete
      </button>

      <button
        class="capitalize mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-6 py-1"
        @click="add()"
      >
        quantity
      </button>

      <active-order-popper></active-order-popper>
      <button
        class="capitalize mr-1 border border-aronium-500 font-light flex bg-inherit hover:bg-aronium-700 px-5 py-1"
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
              @click="selectItem(item.product)"
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
          </template>
        </div>
      </div>
      <!-- end of cart items -->

      <!-- payment info -->

      <!-- <div class="select-none h-auto w-full text-center pt-3 pb-4 px-4"> -->
      <!-- <div class="flex mb-3 text-lg font-semibold text-pink-400">
          <div>TOTAL</div>
          <div class="text-right w-full">
            {{ priceFormat(getTotalPrice().value) }}
          </div>
        </div> -->
      <!-- <div
          class="mb-3 text-blue-gray-700 px-3 pt-2 pb-3 rounded-lg bg-blue-gray-50"
        > -->
      <!-- <div class="flex text-lg font-semibold">
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
          <hr class="my-2" /> -->
      <!-- <div class="grid grid-cols-3 gap-2 mt-2">
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
          </div> -->
      <!-- </div> -->
      <!-- <div
          v-if="change > 0"
          class="flex mb-3 text-lg font-semibold bg-pink-50 text-blue-gray-700 rounded-lg py-2 px-3"
        >
          <div class="text-pink-700">CHANGE</div>
          <div class="text-right flex-grow text-pink-700">
            {{ priceFormat(change) }}
          </div>
        </div> -->
      <!-- <div
          v-if="change < 0"
          class="flex mb-3 text-lg font-semibold bg-pink-100 text-blue-gray-700 rounded-lg py-2 px-3"
        >
          <div class="text-right flex-grow text-pink-600">
            {{ priceFormat(change) }}
          </div>
        </div> -->
      <!-- <div
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
        </div> -->

      <!-- <button
          class="text-white rounded-2xl text-lg w-full py-3 focus:outline-none"
          :class="{
            'bg-pink-500 hover:bg-pink-600': submitable(),
            'bg-gray-400': !submitable(),
          }"
          :disabled="!submitable()"
          @click="submit($event)"
        >
          SUBMIT
        </button> -->
      <!-- </div> -->
      <!-- end of payment info -->
    </div>
    <div class="flex flex-col p-2 mt-2 h-56 border-t border-aronium-600">
      <div class="w-full flex justify-between text-aronium-white">
        <span class="text-sm">Subtotal</span>
        <span class="text-2sm">{{ priceFormat(getTotalPrice().value) }}</span>
      </div>
      <div class="mb-1 pt-2 w-full flex justify-between text-aronium-white">
        <span class="text-sm">Tax</span>
        <span class="text-2sm">0</span>
      </div>
      <hr class="border-dashed" />
      <div class="w-full flex justify-between text-aronium-white my-1">
        <span class="text-lg text-pink-400 uppercase">Total</span>
        <span class="text-lg text-pink-400">{{
          priceFormat(getTotalPrice().value)
        }}</span>
      </div>
      <hr class="border-dashed" />
      <!-- <div class="w-full flex justify-between text-aronium-white">
        <span class="text-sm">Cash</span>
        <span class="text-2sm">{{ priceFormat(cash) }}</span>
      </div> -->

      <!-- <hr class="border-1" />
      <div class="w-full flex justify-between text-aronium-white">
        <span class="text-sm">Change</span>
        <span
          class="text-2sm text-aroium-danger"
          :class="change < 0 ? 'text-aronium-danger' : 'text-inherit'"
          >{{ priceFormat(change) }}</span
        >
      </div> -->

      <div class="flex items-start p-1 h-16 border-t mt-3 border-aronium-600">
        <Button
          class="w-1/3 mb-3 capitalize mr-1 items-center justify-center border border-aronium-700 font-light flex bg-inherit hover:bg-aronium-700 px-4 py-1"
          variant="red"
          @click="clear()"
        >
          <span class="mr-3">
            <i class="fa fa-trash fa-sm"></i>
          </span>
          void order
        </Button>
        <Button
          class="w-1/3 mb-3 capitalize mr-1 items-center justify-center border border-aronium-700 font-light flex bg-inherit hover:bg-aronium-700 px-4 py-1"
          variant="transRed"
          @click="clear()"
        >
          <span class="mr-3">
            <i class="fa fa-lock fa-lg"></i>
          </span>
          Lock
        </Button>
        <Button
          class="w-1/3 mb-3 capitalize mr-1 items-center justify-center border border-aronium-700 font-light flex bg-inherit hover:bg-aronium-700 px-4 py-1"
          variant="transGreen"
          @click="clear()"
        >
          <span class="mr-1">
            <i class="fa fa-repeat fa-lg"></i>
          </span>
          Repeat round
        </Button>
      </div>
    </div>
    <!-- modal receipt -->
    <modal-receipt v-show="isShowModalReceipt"></modal-receipt>
  </div>
  <!-- end of right sidebar -->
</template>
