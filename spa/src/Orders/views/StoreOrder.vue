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
  <Suspense>
    <StoreOrderDiscount
      v-if="store.openOrderDiscountModal"
      @close="toggleOrderDiscountModal"
    />
    <template #fallback>
      <div>
        Loading...
      </div>
    </template>
  </Suspense>
  <div class="flex h-screen inset-0 hide-print">
    <!-- Narrow sidebar -->
    <NarrowSideBar />

    <!-- Mobile menu -->
    <MobileMenu v-model:mobileMenuOpen="mobileMenuOpen" />

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
            <div class="mx-4 flex items-center space-x-4 sm:mx-6 sm:space-x-6">
              <nav aria-label="Global" class="flex space-x-10">
                <span
                  class="flex items-center md:w-28 md:h-full py-2 px-1 md:px-2 justify-center rounded-full md:rounded-sm bg-aronium-800 p-1 text-aronium-white shadow-sm hover:bg-gray-700 cursor-pointer"
                >
                  <PlusIcon class="h-6 w-8" />
                  <span class="hidden md:block">
                    Save slae
                  </span>
                </span>
                <span
                  class="flex items-center md:w-28 md:h-full py-2 px-1 md:px-2 justify-center rounded-full md:rounded-sm bg-aronium-800 p-1 text-aronium-white shadow-sm hover:bg-gray-700 cursor-pointer"
                >
                  <ReceiptPercentIcon class="h-6 w-8" />
                  <span class="hidden md:block">
                    Payment
                  </span>
                </span>
                <span
                  class="flex items-center md:w-28 md:h-full py-2 px-1 md:px-2 justify-center rounded-full md:rounded-sm bg-aronium-800 p-1 text-aronium-white shadow-sm hover:bg-gray-700 cursor-pointer"
                >
                  <BanknotesIcon class="h-6 w-8" />
                  <span class="hidden md:block">
                    Cash
                  </span>
                </span>
              </nav>
              <div class="flex items-center space-x-8">
                <span class="inline-flex">
                  <a
                    href="#"
                    class="-mx-1 rounded-full bg-white p-1 text-gray-400 hover:text-gray-500"
                  >
                    <span class="sr-only">View notifications</span>
                    <BellIcon class="h-6 w-6" aria-hidden="true" />
                  </a>
                </span>
              </div>
            </div>

            <!-- <div
              class="ml-2 py-2 flex items-center space-x-4 sm:ml-6 sm:space-x-6"
            >
              <button
                type="button"
                class="flex items-center md:h-full my-1 px-1 md:px-6 justify-center rounded-full md:rounded-sm bg-aronium-green p-1 text-aronium-900 shadow-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
              >
                <PlusIcon class="h-6 w-6" aria-hidden="true" />
                <span class="hidden md:block">Payment</span>
              </button>
            
              <UserMenu />

              <button
                type="button"
                class="flex items-center justify-center rounded-full bg-indigo-600 p-1 text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
              >
                <PlusIcon class="h-6 w-6" aria-hidden="true" />
                <span class="sr-only">Add file</span>
              </button>
            </div> -->
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
            <router-view v-slot="{ Component }">
              <transition name="fade">
                <component :is="Component" />
              </transition>
            </router-view>
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
import NarrowSideBar from "@/components/Navbars/NarrowSideBar.vue";
import MainNav from "@/components/Navbars/MainNav.vue";

import InvoiceTemplate from "@/Orders/components/Invoices/InvoiceTemplate.vue";
import MobileMenu from "@/components/Navbars/MobileMenu.vue";
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
  Bars3BottomRightIcon,
  CogIcon,
  HomeIcon,
  PhotoIcon,
  GiftIcon,
  PlusIcon,
  RectangleStackIcon,
  Squares2X2Icon,
  BellIcon,
  UserGroupIcon,
  XMarkIcon,
  ReceiptPercentIcon,
  BanknotesIcon,
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
  store.activeItem = null;
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
