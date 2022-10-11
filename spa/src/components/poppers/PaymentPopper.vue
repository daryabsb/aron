<template>
  <div
    class="absolute left-0 top-0 h-full py-12 flex items-center bg-opacity-90 bg-opacity-85 text-aronium-white bg-aronium-900 z-10"
  >
    <!-- ITEMS AT PAYMENT MODAL -->
    <div class="h-4/5 w-full flex border border-aronium-500">
      <div
        v-if="isShowItems"
        class="h-full w-1/5 text-center bg-transparent text-aronium-white"
      >
        <!-- <div class="w-full h-full bg-aronium-700 border-r border-aronium-500"> -->
        <div
          class="h-16 w-full text-left bg-aronium-900 p-2 border-b border-r border-aronium-500"
        >
          <h1 class="text-2xl font-light tracking-wider">Items</h1>
        </div>
        <div
          class="w-full h-full bg-aronium-700 border-b border-r border-aronium-500 text-left p-3"
        >
          <!-- ITEMS HERE -->
          <div v-for="item in cart" :key="item.id">
            <div
              class="bg-aronium-700 border-b mb-2 border-aronium-500 shadow w-full px-2 md:py-0 xl:py-1 flex justify-center"
              :class="
                item.id === ID
                  ? 'bg-aronium-sky-600  text-aronium-50 text-shadow-lg'
                  : 'bg-inherit'
              "
              @click="selectItem(item)"
            >
              <!-- <img
                :src="item.image"
                alt=""
                class="rounded-sm h-8 w-8 bg-transparent shadow mr-2"
              /> -->
              <div class="flex-grow">
                <h5
                  class="text-sm subpixel-antialiased tracking-wider font-semibold"
                >
                  {{ item.name }}
                </h5>
              </div>

              <div>
                <div class="flex items-center">
                  {{ priceFormat(item.price) }}
                </div>
              </div>
            </div>
          </div>
          <!-- ITEMS END -->
        </div>
        <!-- </div> -->
      </div>

      <div
        class="relative text-center bg-transparent text-aronium-white"
        :class="isShowItems ? 'w-4/5' : 'w-full'"
      >
        <div
          class="h-16 w-full flex justify-between text-left bg-aronium-900 p-2 border-b border-aronium-500"
        >
          <h1 class="text-2xl">Actions</h1>
          <span @click="showItems">
            <i :class="isShowItems ? 'fa fa-times' : 'fa fa-circle'"></i>
          </span>
        </div>
        <payment-popper-discount
          :id="ID"
          :item="cartItem"
        ></payment-popper-discount>
        <div
          class="w-full h-full bg-aronium-700 border-b border-r border-aronium-500 text-left p-3"
        >
          <div
            class="relative flex items-center justify-between w-full h-12 bg-inherit"
          >
            <div class="flex items-center h-full">
              <button
                class="bg-aronium-danger py-4 px-12"
                @click="$emit('close')"
              >
                <span><i class="fa fa-times"></i></span>
                Cancel
              </button>
            </div>
            <div class="flex items-center h-full">
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 px-12 mr-1"
                @click="$emit('close')"
              >
                <span class="mr-2"><i class="fa fa-percent"></i></span>
                Discount
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 px-12 mr-1"
                @click="$emit('close')"
              >
                <span class="mr-2"><i class="fa fa-layer-group"></i></span>
                Rounds
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 px-12"
                @click="$emit('close')"
              >
                <span class="mr-2"><i class="fa fa-user"></i></span>
                Customer
              </button>
            </div>
          </div>
          <div class="flex">
            <div class="flex flex-col items-start h-full w-30 mt-3 mr-3">
              <h1 class="mb-3 text-xl font-light">Payment Type</h1>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('cashOut')"
              >
                <!-- :disabled="submitable()" -->
                Cash
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('cashOut')"
              >
                Credit Card
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('close')"
              >
                Debit Card
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('close')"
              >
                Check
              </button>
              <button
                class="flex bg-aronium-inherit border border-aronium-500 w-44 justify-center py-4 text-sm my-1"
                @click="$emit('close')"
              >
                Voucher
              </button>
              <button
                class="flex g-aronium-inherit border border-aronium-500 w-44 justify-center text-sm py-4 my-1"
                @click="$emit('close')"
              >
                Gift Card
              </button>
              <!-- Add Icon to this -->
              <button
                class="flex bg-aronium-inherit border border-aronium-500 py-4 w-44 justify-center text-sm my-1"
                @click="$emit('close')"
              >
                Split Payment
              </button>
            </div>
            <div class="flex flex-col items-start h-full w-full mt-3 leading-9">
              <h1 class="mb-3 text-xl font-light">Payment</h1>
              <div class="flex justify-between w-full">
                Total:
                <span
                  class="font-semibold text-2xl text-aronium-sky-500 ml-auto"
                  >{{ priceFormat(getTotalPrice().value * 1.05) }}</span
                >
              </div>
              <!-- Number is : {{ number }}<br />
              <a href="#" @click="showKeypad = !showKeypad"
                ><h4>Toggle Keypad</h4></a
              > -->

              <div class="relative flex justify-start w-full">
                Total:
                <input
                  v-model="cash"
                  type="text"
                  class="grow font-semibold text-3xl bg-inherit text-end focus:ring-0 border-0 border-b border-aronium-500 focus:border-aronium-sky-500"
                  ref="input"
                />
                <span class="absolute left-12 top-2 text-xl">
                  <i class="fa fa-pencil"></i>
                </span>
              </div>
              <div class="flex justify-between w-full text-aronium-danger">
                Change:
                <span
                  class="font-semibold text-2xl text-aronium-sky-500 ml-auto"
                  >{{ priceFormat(change) }}</span
                >
              </div>
              <div class="flex justify-around w-full h-full bottom-0">
                <!-- MONEY -->
                <!-- <div class="grid grid-cols-3 gap-2 mt-2">
                  <div v-for="money in moneys" :key="money">
                    <button
                      class="bg-inherit rounded-lg shadow hover:shadow-lg focus:outline-none inline-block px-2 py-1 text-sm m-1"
                      @click="addCashValue(money)"
                    >
                      +<span>
                        {{ money }}
                      </span>
                    </button>
                  </div>
                </div> -->
                <moneys></moneys>

                <calculator></calculator>

                <!-- <div class="flex flex-col justify-between w-72 h-80">
                  <div class="h-20 border border-aronium-500">
                    <span>{{ number }}</span>
                  </div>
                  <numericpad
                    :on-input="onInput"
                    :on-delete="onDelete"
                    :on-reset="onReset"
                    :show="showKeypad"
                  />
                </div> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref, reactive } from "vue";

import {
  priceFormat,
  addQty,
  addCash,
  useCash,
  useCart,
  useMoneys,
  getTotalPrice,
  useChange,
  submitable,
  submit,
} from "@/store/composables";

import Calculator from "@/components/shared/calculator/Calculator.vue";
import Moneys from "@/components/Cards/Moneys.vue";
import PaymentPopperDiscount from "@/components/poppers/PaymentPopperDiscount.vue";
export default {
  components: {
    Calculator,
    Moneys,
    PaymentPopperDiscount,
  },
  emits: ["close", "cashOut"],
  setup(props, context) {
    // Numeric pad
    const number = ref("");
    const maxLength = ref(6);
    const showKeypad = ref(true);
    const onInput = (key) => {
      const myKeys = {
        10: parseInt(","),
        11: 0,
        12: parseInt("."),
      };
      key = myKeys[key] || key;
      if (key === 11) key = 0;
      // number.value = (number.value + key).slice(0, maxLength.value);
      number.value = (number.value + key).slice(0, maxLength.value);

      console.log(number.value);
    };
    const onDelete = () => {
      number.value = number.value.slice(0, number.value.length - 1);
    };
    const onReset = () => {
      number.value = "";
    };

    const cart = useCart;
    const cash = useCash;
    const change = useChange;
    const isShowItems = ref(true);
    const moneys = useMoneys;
    const inputMoney = ref(0);

    const cashValue = ref(0);
    // const cashValue = computed(() => parseInt(number.value) + inputMoney.value);

    const addCashValue = (value) => {
      cashValue.value = value;
      addCash(value);
    };

    const showItems = () => (isShowItems.value = !isShowItems.value);

    const ID = ref(null);
    const cartItem = reactive({ id: 0, name: "" });
    const selectItem = (item) => {
      if (cartItem.id === 0) {
        let { id, name } = item;
        console.log("id", id);

        cartItem.id = id;
        ID.value = id;
        // item.value.id =
        // item.value.name = JSON.parse(JSON.stringify(cartItem.name));
        cartItem.name = name;
      } else {
        console.log("check if null", cartItem.id === 0);
        ID.value = null;
        cartItem.id = 0;
        cartItem.name = "";
      }
      return cartItem;
    };

    const payTheBill = () => context.emit("cashOut");

    return {
      // Numeric pad
      number,
      maxLength,
      showKeypad,
      onInput,
      onDelete,
      onReset,
      inputMoney,

      isShowItems,
      showItems,
      priceFormat,
      addQty,
      cart,
      cash,
      moneys,
      addCash,
      addCashValue,
      cashValue,
      getTotalPrice,
      change,
      submitable,
      submit,

      ID,
      cartItem,
      selectItem,

      payTheBill,
    };
  },
};
</script>
