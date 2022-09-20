<template>
    <div
        v-if="isShowModalReceipt"
        class="fixed w-full h-screen left-0 top-0 z-10 flex flex-wrap justify-center content-center p-24"
      >
        <div
          v-if="isShowModalReceipt"
          class="fixed glass w-full h-screen left-0 top-0 z-0"
          x-transition:enter="transition ease-out duration-100"
          x-transition:enter-start="opacity-0"
          x-transition:enter-end="opacity-100"
          x-transition:leave="transition ease-in duration-100"
          x-transition:leave-start="opacity-100"
          x-transition:leave-end="opacity-0"
          @click="closeModalReceipt()"
        ></div>
        <div
          v-if="isShowModalReceipt"
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
              <img
                src="img/receipt-logo.png"
                alt="Tailwind POS"
                class="mb-3 w-8 h-8 inline-block"
              />
              <h2 class="text-xl font-semibold">TAILWIND POS</h2>
              <p>CABANG KONOHA SELATAN</p>
            </div>
            <div class="flex mt-4 text-xs">
              <div class="flex-grow">
                No: <span>{{ receiptNo }}</span>
              </div>
              <div>{{ receiptDate }}</div>
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
                  <div v-for="(item, index) in cart" :key="index">
                    <tr>
                      <td class="py-2 text-center">{{ index + 1 }}</td>
                      <td class="py-2 text-left">
                        <span>{{ item.name }}</span>
                        <br />
                        <small>{{ priceFormat(item.price) }}</small>
                      </td>
                      <td class="py-2 text-center">{{ item.qty }}</td>
                      <td class="py-2 text-right">
                        {{ priceFormat(item.qty * item.price) }}
                      </td>
                    </tr>
                  </div>
                </tbody>
              </table>
            </div>
            <hr class="my-2" />
            <div>
              <div class="flex font-semibold">
                <div class="flex-grow">TOTAL</div>
                <div>{{ priceFormat(getTotalPrice()) }}</div>
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
              class="bg-cyan-500 text-white text-lg px-4 py-3 rounded-2xl w-full focus:outline-none"
              @click="printAndProceed()"
            >
              PROCEED
            </button>
          </div>
        </div>
      </div>
    </div>
</template>