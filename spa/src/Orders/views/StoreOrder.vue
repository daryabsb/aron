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

    <!-- Content area -->
    <div class="flex flex-1 inset-0 flex-col overflow-hidden">
      <MainNav />
      <header class="w-full">
        <div
          class="relative z-10 flex h-16 flex-shrink-0 border-b border-aronium-500 bg-aronium-300 shadow-sm"
        >
          <!-- Main Searchbar -->
          <SearchBarVue />
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
import SearchBarVue from "@/Orders/components/Headers/SearchBar.vue";

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

onMounted(store.loadPaymentTypes);

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
</script>
