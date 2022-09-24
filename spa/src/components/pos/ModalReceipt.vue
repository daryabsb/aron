<template>
  <div
    v-show="isShowModalReceipt"
    class="fixed w-full h-screen left-0 top-0 z-10 flex flex-wrap justify-center content-center p-24"
  >
    <transition>
      <div
        v-show="isShowModalReceipt"
        class="fixed glass w-full h-screen left-0 top-0 z-0"
        x-transition:enter="transition ease-out duration-100"
        x-transition:enter-start="opacity-0"
        x-transition:enter-end="opacity-100"
        x-transition:leave="transition ease-in duration-100"
        x-transition:leave-start="opacity-100"
        x-transition:leave-end="opacity-0"
      ></div>
      <!-- @click="closeModalReceipt()" -->
    </transition>
    <Transition>
      <div
        v-show="isShowModalReceipt"
        class="w-96 rounded-3xl bg-white shadow-xl overflow-hidden z-10"
        x-transition:enter="transition ease-out duration-100"
        x-transition:enter-start="opacity-0 transform scale-90"
        x-transition:enter-end="opacity-100 transform scale-100"
        x-transition:leave="transition ease-in duration-100"
        x-transition:leave-start="opacity-100 transform scale-100"
        x-transition:leave-end="opacity-0 transform scale-90"
      >
        <div
          id="receipt-content"
          class="text-left w-full text-sm p-6 overflow-auto"
        >
          <div class="text-center">
            <!-- src="img/receipt-logo.png" -->
            <img
              src="http://127.0.0.1:8000/media/img/logo.svg"
              alt="ARON POS"
              class="mb-3 w-8 h-8 inline-block"
            />
            <h2 class="text-xl font-semibold">ARON MARKET</h2>
            <p>PASHA CITY - RAPARRIN - SLEMANI</p>
          </div>
          <div class="flex mt-4 text-xs">
            <div class="flex-grow">
              No: <span>{{ receiptNo }}</span>
            </div>
            <div>{{ $filters.dateMoment(receiptDate) }}</div>
          </div>
          <hr class="my-2" />
          <div>
            <table class="w-full text-xs">
              <thead>
                <tr>
                  <th class="py-1 w-1/12 text-center">#</th>
                  <th class="py-1 text-left">Item</th>
                  <th class="py-1 w-2/12 text-center">Qty</th>
                  <th class="py-1 w-3/12 text-right">Subtotal</th>
                </tr>
              </thead>
              <tbody>
                <template v-for="(item, index) in cart" :key="index">
                  <tr>
                    <td class="py-2 text-center">{{ index + 1 }}</td>
                    <td class="py-2 text-left">
                      <span>{{ item.name }}</span>
                      <br />
                      <small
                        >{{ priceFormat(item.price) }}
                        {{ item.currency }}</small
                      >
                    </td>
                    <td class="py-2 text-center">
                      {{ item.qty }} {{ item.measurement }}
                    </td>
                    <td class="py-2 text-right">
                      {{ priceFormat(item.qty * item.price) }}
                    </td>
                  </tr>
                </template>
              </tbody>
            </table>
          </div>
          <hr class="my-2" />
          <div>
            <div class="flex font-semibold">
              <div class="flex-grow">TOTAL</div>
              <div>{{ priceFormat(getTotalPrice().value) }}</div>
            </div>
            <div class="flex text-xs font-semibold">
              <div class="flex-grow">PAY AMOUNT</div>
              <div>{{ priceFormat(cash) }}</div>
            </div>
            <hr class="my-2" />
            <div class="flex text-xs font-semibold">
              <div class="flex-grow">CHANGE</div>
              <div>{{ priceFormat(change) }}</div>
            </div>
          </div>
        </div>
        <div class="p-4 w-full">
          <button
            class="bg-pink-500 text-white text-lg px-4 py-3 rounded-2xl w-full focus:outline-none"
            @click="printAndProceed()"
          >
            PROCEED
          </button>
        </div>
      </div>
    </Transition>
    <div id="print-area" class="print-area"></div>
  </div>
</template>

<script>
import { ref } from "vue";
import {
  useCash,
  useChange,
  useCart,
  clear,
  isShowModalReceipt,
  priceFormat,
  getTotalPrice,
  closeModalReceipt,
  receiptNo,
  receiptDate,
} from "@/store/composables";
export default {
  setup() {
    let time = ref(null);
    let activeMenu = "pos";
    let firstTime = false;

    // GETTERS from COMPOSABLES
    const cart = useCart;
    const cash = useCash;
    const change = useChange;

    const printAndProceed = () => {
      const receiptContent = document.getElementById("receipt-content");
      console.log("receiptContent", receiptContent.innerHTML);
      const titleBefore = document.title;
      const printArea = document.getElementById("print-area");
      printArea.innerHTML = receiptContent.innerHTML;
      document.title = receiptNo;

      window.print();
      // isShowModalReceipt();
      closeModalReceipt();

      printArea.innerHTML = "";
      document.title = titleBefore;

      // TODO save sale data to database

      clear();
    };
    return {
      cart,
      change,
      cash,
      clear,
      time,
      activeMenu,
      firstTime,
      isShowModalReceipt,
      receiptNo,
      receiptDate,
      closeModalReceipt,
      printAndProceed,
      priceFormat,
      getTotalPrice,
      print,
    };
  },
  render: {},
};
</script>
