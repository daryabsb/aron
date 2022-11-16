<template>
  <div>
    <PurpleCalculator v-if="isCalculator" />
    <CashPopper v-if="isCashModal" @close="cashModal" />
    <PaymentPopper v-if="isPayment" @close="paymentModal" @cash-out="cashOut" />
    <search-panel v-if="isSearchModal" @close="searchModal"></search-panel>
    <StoreOrderDiscount v-if="isDiscount" @close="orderDiscountModal" />

    <TransitionRoot as="template" :show="true">
      <TransitionChild
        as="template"
        enter="ease-out duration-2000"
        enter-from="opacity-0"
        enter-to="opacity-100"
        leave="ease-in duration-2000"
        leave-from="opacity-100"
        leave-to="opacity-0"
      >
        <div class="relative overflow-hidden">
          <main>
            <div
              class="bg-aronium-500 pt-10 sm:pt-16 lg:overflow-hidden lg:pt-8 lg:pb-14 sm:my-64"
            >
              <div class="mx-auto min-w-7xl lg:px-8">
                <div class="lg:grid lg:grid-cols-2 lg:gap-8">
                  <div
                    class="mx-auto w-full px-24 sm:max-w-2xl sm:px-6 sm:text-center lg:flex lg:flex-col lg:items-center lg:px-0 lg:text-left"
                  >
                    <div class="lg:p-24">
                      <!-- :to="{ name: 'StoreOrderCreate', params: { create: true } }" -->
                      <h1
                        class="inline-flex items-center rounded-sm font-semibold cursor-pointer bg-black p-1 pr-2 text-white hover:text-aronium-500 sm:text-base lg:text-sm xl:text-base"
                        @click="addNewOrder"
                      >
                        <span
                          class="rounded-sm bg-pink-700 px-3 py-0.5 text-sm font-semibold leading-5 text-white"
                          >Keep the changes</span
                        >
                        <span class="ml-4 text-sm">Go to store page</span>
                        <ChevronRightIcon
                          class="ml-2 h-5 w-5 text-gray-500"
                          aria-hidden="true"
                        />
                        <span v-if="spin">
                          <div
                            class="relative w-10 h-10 animate-spin rounded-full bg-gradient-to-r from-purple-400 via-blue-500 to-red-400"
                          >
                            <div
                              class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-6 h-6 bg-black rounded-full border-2 border-white"
                            ></div>
                          </div>
                        </span>
                      </h1>

                      <div class="w-[45rem] mt-10 sm:mt-12">
                        <form action="#" class="sm:mx-auto sm:max-w-xl lg:mx-0">
                          <div class="sm:flex">
                            <div class="min-w-0 flex-1">
                              <label for="email" class="sr-only"
                                >Find order</label
                              >
                              <input
                                id="search-orders"
                                type="text"
                                placeholder="Enter a name or an order number"
                                class="block w-full rounded-md border-0 px-4 py-3 text-base text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-indigo-300 focus:ring-offset-2 focus:ring-offset-gray-900"
                              />
                            </div>
                            <div class="mt-3 sm:mt-0 sm:ml-3">
                              <button
                                type="submit"
                                class="block w-full rounded-md bg-indigo-500 py-3 px-4 font-medium text-white shadow hover:bg-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-300 focus:ring-offset-2 focus:ring-offset-gray-900"
                              >
                                Start free trial
                              </button>
                            </div>
                          </div>
                          <div
                            class="bg-aronium-800 px-16 overflow-hidden overflow-x-auto shadow sm:rounded-sm mt-3"
                          >
                            <table class="divide-y divide-aronium-500">
                              <thead>
                                <tr>
                                  <p
                                    class="my-3 text-sm text-aronium-300 sm:my-4"
                                  >
                                    Pending orders:
                                  </p>
                                  <!--     <th
                                class="bg-gray-50 px-6 py-3 text-left text-sm font-semibold text-gray-900"
                                scope="col"
                              >
                                Transaction
                              </th>
                              <th
                                class="bg-gray-50 px-6 py-3 text-right text-sm font-semibold text-gray-900"
                                scope="col"
                              >
                                Amount
                              </th>
                              <th
                                class="hidden bg-gray-50 px-6 py-3 text-left text-sm font-semibold text-gray-900 md:block"
                                scope="col"
                              >
                                Status
                              </th>
                              <th
                                class="bg-gray-50 px-6 py-3 text-right text-sm font-semibold text-gray-900"
                                scope="col"
                              >
                                Date
                              </th> -->
                                </tr>
                              </thead>

                              <tbody
                                v-if="cart.length > 0"
                                class="divide-y divide-aronium-500 text-aronium-white"
                              >
                                <tr
                                  v-for="order in cart
                                    .filter((o) => !o.status)
                                    .slice(0, 5)"
                                  :key="order.id"
                                >
                                  <td
                                    class="w-full max-w-0 whitespace-nowrap px-2 py-2 text-sm"
                                  >
                                    <div class="flex">
                                      <!-- :href="order.href" -->

                                      <router-link
                                        :to="`/store/order/${order.number}`"
                                        class="group inline-flex space-x-2 truncate text-sm"
                                        @click="openOrder(order)"
                                      >
                                        <BanknotesIcon
                                          class="h-5 w-5 flex-shrink-0 group-hover:text-gray-500"
                                          aria-hidden="true"
                                        />
                                        <p
                                          class="truncate group-hover:text-gray-900"
                                        >
                                          {{ order.number }}
                                        </p>
                                      </router-link>
                                    </div>
                                  </td>

                                  <td
                                    class="whitespace-nowrap px-6 py-4 text-right text-sm"
                                  >
                                    <time :datetime="order.datetime">{{
                                      $filters.dateMoment(order.created)
                                    }}</time>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                            <!-- Pagination -->
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <div class="mt-12 -mb-16 sm:-mb-48 lg:relative lg:m-0">
                    <div
                      class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 lg:max-w-none lg:px-0"
                    >
                      <!-- Illustration taken from Lucid Illustrations: https://lucid.pixsellz.io/ -->
                      <img
                        class="w-full lg:absolute lg:inset-y-0 lg:left-0 lg:h-full lg:w-auto lg:max-w-none"
                        src="https://tailwindui.com/img/component-images/cloud-illustration-indigo-400.svg"
                        alt=""
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- More main page content here... -->
          </main>
        </div>
      </TransitionChild>
    </TransitionRoot>
  </div>
</template>
<script setup>
import {
  ref,
  watchEffect,
  computed,
  onMounted,
  defineAsyncComponent,
} from "vue";
import { TransitionChild, TransitionRoot } from "@headlessui/vue";

import { useOrderStore } from "@/Orders/ordersStore";
import { loadUserData } from "@/Orders/orderComposables";

import { useModals } from "@/stores/modals";
import { getEvt } from "@/Orders/orderComposables";
import { useRouter } from "vue-router";

import { BanknotesIcon } from "@heroicons/vue/24/outline";
import { ChevronRightIcon } from "@heroicons/vue/20/solid";
const { activeNumber, generateNumber, createCart, clearCash } = useOrderStore();
const orders = useOrderStore();
const router = useRouter();

onMounted(async () => {
  if (orders.cart.length === 0) await loadUserData();
});
const cart = computed(() => orders.cart);
const spin = ref(false);
const addNewOrder = async () => {
  spin.value = true;
  const number = await generateNumber("order");
  console.log("generated", number.created_number);
  const order = await createCart(`${number.created_number}`);
  orders.activeNumber = await number.created_number;
  // orders.activeOrder = order.activeOrder;
  setTimeout(() => {
    // console.log(`/store/order/${number.value}`);
    console.log("your code to be executed after 3 second");
    spin.value = false;
    router.push(`/store/order/${number.created_number}`);
    console.log(`/store/order/${number.created_number}`);
  }, 1000);
};
const openOrder = (order) => {
  setTimeout(() => {
    router.push(`/store/order/${order.number}`);
  }, 3000);
};

const StoreOrderDiscount = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderDiscount.vue")
);

const SearchPanel = defineAsyncComponent(() =>
  import("@/components/shared/SearchPanel.vue")
);
const CashPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/CashPopper.vue")
);
const PurpleCalculator = defineAsyncComponent(() =>
  import("@/components/shared/calculator/NumericPadPurple.vue")
);
const PaymentPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/PaymentPopper.vue")
);
const store = useModals();

window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};

const isSearchModal = store.isSearchModal;
const isPayment = ref(store.isPaymentModal);
const isCashModal = ref(store.isCashModal);
const isDiscount = ref(store.isStoreOrderDiscount);
const isCalculator = ref(store.isCalculatorModal);
const searchModal = () => {
  store.searchModal = !store.searchModal;
};
const cashModal = () => {
  store.openCashModal = false;
};

const orderDiscountModal = () => {
  store.openOrderDiscountModal = false;
};
const paymentModal = () => {
  store.openPaymentModal = false;
  clearCash();
};
const cashOut = () => {
  paymentModal();
  cashModal();
};
const navigation = [
  { name: "Product", href: "#" },
  { name: "Features", href: "#" },
  { name: "Marketplace", href: "#" },
  { name: "Company", href: "#" },
];
</script>
