<template>
  <PaymentPopper
    v-if="store.openPaymentModal"
    @close="togglePaymentModal"
    @cash-out="cashOut"
  />
  <CashPopper v-if="store.openCashModal" @close="toggleCashModal" />
  <search-panel
    v-if="store.searchModal"
    @close="toggleSearchModal"
  ></search-panel>
  <StoreOrderDiscount
    v-if="store.openOrderDiscountModal"
    @close="toggleOrderDiscountModal"
  />
  <div class="flex h-screen inset-0 hide-print">
    <!-- Narrow sidebar -->
    <div
      class="hidden w-24 inset-0 overflow-y-auto bg-aronium-800 border-r border-aronium-500 md:block"
    >
      <div class="flex w-full flex-col items-center py-6">
        <div class="flex flex-shrink-0 items-center">
          <img
            class="h-8 w-auto"
            src="https://tailwindui.com/img/logos/mark.svg?color=white"
            alt="Your Company"
          />
        </div>
        <div id="sideNav" class="mt-6 w-full flex-1 space-y-1 px-2">
          <span
            v-for="item in sidebarNavigation"
            :key="item.name"
            @click="item.submit"
            :class="[
              item.current
                ? 'bg-aronium-900 text-white'
                : 'text-aronium-white hover:bg-aronium-700 hover:text-pink-400',
              'group w-full p-3 rounded-md flex flex-col items-center text-xs font-medium',
            ]"
            :aria-current="item.current ? 'page' : undefined"
          >
            <component
              :is="item.icon"
              :class="['h-6 w-6']"
              aria-hidden="true"
            />
            <span class="mt-2">{{ item.name }}</span>
          </span>
        </div>
      </div>
    </div>

    <!-- Mobile menu -->
    <TransitionRoot as="template" :show="mobileMenuOpen">
      <Dialog
        as="div"
        class="relative z-20 md:hidden"
        @close="mobileMenuOpen = false"
      >
        <TransitionChild
          as="template"
          enter="transition-opacity ease-linear duration-300"
          enter-from="opacity-0"
          enter-to="opacity-100"
          leave="transition-opacity ease-linear duration-300"
          leave-from="opacity-100"
          leave-to="opacity-0"
        >
          <div class="fixed inset-0 bg-gray-600 bg-opacity-75" />
        </TransitionChild>

        <div class="fixed inset-0 z-40 flex">
          <TransitionChild
            as="template"
            enter="transition ease-in-out duration-300 transform"
            enter-from="-translate-x-full"
            enter-to="translate-x-0"
            leave="transition ease-in-out duration-300 transform"
            leave-from="translate-x-0"
            leave-to="-translate-x-full"
          >
            <DialogPanel
              class="relative flex w-full max-w-xs flex-1 flex-col bg-aronium-800 pt-5 pb-4"
            >
              <TransitionChild
                as="template"
                enter="ease-in-out duration-300"
                enter-from="opacity-0"
                enter-to="opacity-100"
                leave="ease-in-out duration-300"
                leave-from="opacity-100"
                leave-to="opacity-0"
              >
                <div class="absolute top-1 right-0 -mr-14 p-1">
                  <button
                    type="button"
                    class="flex h-12 w-12 items-center justify-center rounded-full focus:outline-none focus:ring-2 focus:ring-white"
                    @click="mobileMenuOpen = false"
                  >
                    <XMarkIcon class="h-6 w-6 text-white" aria-hidden="true" />
                    <span class="sr-only">Close sidebar</span>
                  </button>
                </div>
              </TransitionChild>
              <div class="flex flex-shrink-0 items-center px-4">
                <img
                  class="h-8 w-auto"
                  src="https://tailwindui.com/img/logos/mark.svg?color=white"
                  alt="Your Company"
                />
              </div>
              <div class="mt-5 h-0 flex-1 overflow-y-auto px-2">
                <nav class="flex h-full flex-col">
                  <div class="space-y-1">
                    <span
                      v-for="item in sidebarNavigation"
                      :key="item.name"
                      :ref="item.ref"
                      @click="item.submit"
                      :class="[
                        item.current
                          ? 'bg-aronium-900 text-white'
                          : 'text-aronium-white hover:bg-aronium-900 hover:text-pink-500',
                        'group py-2 px-3 rounded-md flex items-center text-sm font-medium',
                      ]"
                      :aria-current="item.current ? 'page' : undefined"
                    >
                      <component
                        :is="item.icon"
                        :class="['mr-3 h-6 w-6']"
                        aria-hidden="true"
                      />
                      <span>{{ item.name }}</span>
                    </span>
                  </div>
                </nav>
              </div>
            </DialogPanel>
          </TransitionChild>
          <div class="w-14 flex-shrink-0" aria-hidden="true">
            <!-- Dummy element to force sidebar to shrink to fit close icon -->
          </div>
        </div>
      </Dialog>
    </TransitionRoot>

    <!-- Content area -->
    <div class="flex flex-1 inset-0 flex-col overflow-hidden">
      <MainNav />
      <header class="w-full">
        <div
          class="relative z-10 flex h-16 flex-shrink-0 border-b border-aronium-500 bg-aronium-300 shadow-sm"
        >
          <button
            type="button"
            class="border-r border-gray-200 px-4 text-gray-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500 md:hidden"
            @click="mobileMenuOpen = true"
          >
            <span class="sr-only">Open sidebar</span>
            <Bars3BottomLeftIcon class="h-6 w-6" aria-hidden="true" />
          </button>
          <div class="flex flex-1 justify-between px-4 sm:px-6">
            <div class="flex flex-1">
              <form class="flex w-full md:ml-0" action="#" method="GET">
                <label for="search-field" class="sr-only"
                  >Search all files</label
                >
                <div
                  class="relative w-full text-gray-800 focus-within:text-aronium-900"
                >
                  <div
                    class="pointer-events-none absolute inset-y-0 left-0 flex items-center"
                  >
                    <MagnifyingGlassIcon
                      class="h-5 w-5 flex-shrink-0"
                      aria-hidden="true"
                    />
                  </div>
                  <input
                    name="search-field"
                    id="search-field"
                    class="h-full w-full border-transparent bg-transparent py-2 pl-8 pr-3 text-base text-aronium-900 placeholder-aronium-500 focus:border-transparent focus:placeholder-aronium-600 focus:outline-none focus:ring-0"
                    placeholder="Search"
                    type="search"
                  />
                </div>
              </form>
            </div>
            <div
              class="ml-2 py-2 flex items-center space-x-4 sm:ml-6 sm:space-x-6"
            >
              <button
                type="button"
                class="flex items-center md:h-full my-1 px-1 md:px-6 justify-center rounded-full md:rounded-sm bg-aronium-green p-1 text-aronium-900 shadow-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
              >
                <PlusIcon class="h-6 w-6" aria-hidden="true" />
                <span class="hidden md:block">Payment</span>
              </button>
              <!-- Profile dropdown -->
              <UserMenu />

              <button
                type="button"
                class="flex items-center justify-center rounded-full bg-indigo-600 p-1 text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
              >
                <PlusIcon class="h-6 w-6" aria-hidden="true" />
                <span class="sr-only">Add file</span>
              </button>
            </div>
          </div>
        </div>
      </header>

      <!-- Main content -->
      <div class="flex flex-1 items-stretch overflow-hidden scrollbar">
        <!-- Secondary column (hidden on smaller screens) -->
        <aside
          class="flex flex-col justify-between w-full md:w-112 border-r border-aronium-500"
        >
          <!-- Your content -->
          <div class="overflow-auto scrollbar">
            <router-view></router-view>
          </div>
          <div>
            <StoreTotalsCalculations />
          </div>
        </aside>

        <main
          class="hidden md:block flex-1 overflow-y-auto scrollbar pr-2 pl-1 py-2"
        >
          <!-- Primary column -->
          <section
            aria-labelledby="primary-heading"
            class="flex h-full min-w-0 flex-1 flex-col lg:order-last"
          >
            <h1 id="primary-heading" class="sr-only">Photos</h1>
            <!-- Your content -->
            <StoreGroupsList />
          </section>
        </main>
      </div>
    </div>
  </div>
  <div id="print-area" class="print-area">
    <InvoiceTemplate />
  </div>
  <!-- <StoreHeader />
<StoreSearch />
  -->
</template>

<script setup>
import { ref, onMounted, defineAsyncComponent } from "vue";
import { useRouter } from "vue-router";
import { useOrderStore } from "@/Orders/ordersStore";
import { loadUserData } from "@/Orders/orderComposables";

import { useUser } from "@/Users/userStore";
import { getEvt } from "@/Orders/orderComposables";
import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";
import MainNav from "@/components/Navbars/MainNav.vue";

import InvoiceTemplate from "@/Orders/components/Invoices/InvoiceTemplate.vue";
// import UserMenu from "@/Users/components/UserMenu.vue"

import {
  Dialog,
  DialogPanel,
  Menu,
  MenuButton,
  MenuItem,
  MenuItems,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import {
  Bars3BottomLeftIcon,
  CogIcon,
  HomeIcon,
  PhotoIcon,
  GiftIcon,
  PlusIcon,
  RectangleStackIcon,
  Squares2X2Icon,
  UserGroupIcon,
  XMarkIcon,
} from "@heroicons/vue/24/outline";
import { MagnifyingGlassIcon, CheckCircleIcon } from "@heroicons/vue/20/solid";

const store = useOrderStore();
const router = useRouter();

const discountButton = ref(null);

window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};

// onMounted(async () => {
//   await loadUserData();
// });

// const userStore = useUser();
// const user = userStore.user;
const UserMenu = defineAsyncComponent(() =>
  import("@/Users/components/UserMenu.vue")
);

const PaymentPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/PaymentPopper.vue")
);
const StoreTotalsCalculations = defineAsyncComponent(() =>
  import("@/Orders/components/StoreTotalsCalculations.vue")
);
const StoreOrderDiscount = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderDiscount.vue")
);
const CashPopper = defineAsyncComponent(() =>
  import("@/Orders/components/Modals/CashPopper.vue")
);
const selectItem = (itm) => {
  itm.isActive = !itm.isActive;
};
const SearchPanel = defineAsyncComponent(() =>
  import("@/components/shared/SearchPanel.vue")
);
const StoreSearch = defineAsyncComponent(() =>
  import("@/Orders/components/StoreSearch.vue")
);

// import StoreGroupsList from "@/Orders/components/StoreGroupsList.vue";
const StoreGroupsList = defineAsyncComponent(() =>
  import("@/Orders/components/StoreGroupsList.vue")
);
const toggleSearchModal = () => {
  store.searchModal = !store.searchModal;
};

const toggleCashModal = () => {
  store.openCashModal = false;
};
const toggleOrderDiscountModal = () => {
  store.openOrderDiscountModal = false;
};
const togglePaymentModal = () => {
  store.openPaymentModal = false;
  store.clearCash();
};
const cashOut = () => {
  togglePaymentModal();
  toggleCashModal();
};

//  New layout multi column
const sidebarNavigation = [
  {
    name: "Home",
    submit: () => router.push("/"),
    icon: HomeIcon,
    current: false,
  },
  {
    name: "Search",
    submit: () => (store.searchModal = true),
    icon: MagnifyingGlassIcon,
    current: false,
  },
  {
    id: "discount",
    name: "Discount",
    submit: () => {
      store.openOrderDiscountModal = true;
      sidebarNavigation[2].current = true;
    },
    ref: "discountButton",
    icon: GiftIcon,
    current: false,
  },
  {
    name: "Shared",
    submit: () => console.log("Hooray"),
    icon: UserGroupIcon,
    current: false,
  },
  {
    name: "Save",
    submit: () => console.log("Hooray"),
    icon: CheckCircleIcon,
    current: false,
  },
  {
    name: "Settings",
    submit: () => console.log("Hooray"),
    icon: CogIcon,
    current: false,
  },
];
const userNavigation = [
  { name: "Your Profile", href: "#" },
  { name: "Sign out", href: "/logout/" },
];

const mobileMenuOpen = ref(false);
</script>
