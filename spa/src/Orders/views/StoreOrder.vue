<template>

  <PaymentPopper v-if="store.openPaymentModal" @close="togglePaymentModal" @cash-out="cashOut" />
  <CashPopper v-if="store.openCashModal" @close="toggleCashModal" />
  <search-panel v-if="store.searchModal" @close="toggleSearchModal"></search-panel>
  <StoreOrderDiscount v-if="store.openOrderDiscountModal" @close="toggleOrderDiscountModal" />
  <div class="flex h-screen">
    <!-- Narrow sidebar -->
    <div class="hidden w-28 overflow-y-auto bg-indigo-700 md:block">
      <div class="flex w-full flex-col items-center py-6">
        <div class="flex flex-shrink-0 items-center">
          <img class="h-8 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=white" alt="Your Company" />
        </div>
        <div class="mt-6 w-full flex-1 space-y-1 px-2">
          <a v-for="item in sidebarNavigation" :key="item.name" :href="item.href" :class="[
            item.current
              ? 'bg-indigo-800 text-white'
              : 'text-indigo-100 hover:bg-indigo-800 hover:text-white',
            'group w-full p-3 rounded-md flex flex-col items-center text-xs font-medium',
          ]" :aria-current="item.current ? 'page' : undefined">
            <component :is="item.icon" :class="[
              item.current
                ? 'text-white'
                : 'text-indigo-300 group-hover:text-white',
              'h-6 w-6',
            ]" aria-hidden="true" />
            <span class="mt-2">{{ item.name }}</span>
          </a>
        </div>
      </div>
    </div>

    <!-- Mobile menu -->
    <TransitionRoot as="template" :show="mobileMenuOpen">
      <Dialog as="div" class="relative z-20 md:hidden" @close="mobileMenuOpen = false">
        <TransitionChild as="template" enter="transition-opacity ease-linear duration-300" enter-from="opacity-0"
          enter-to="opacity-100" leave="transition-opacity ease-linear duration-300" leave-from="opacity-100"
          leave-to="opacity-0">
          <div class="fixed inset-0 bg-gray-600 bg-opacity-75" />
        </TransitionChild>

        <div class="fixed inset-0 z-40 flex">
          <TransitionChild as="template" enter="transition ease-in-out duration-300 transform"
            enter-from="-translate-x-full" enter-to="translate-x-0"
            leave="transition ease-in-out duration-300 transform" leave-from="translate-x-0"
            leave-to="-translate-x-full">
            <DialogPanel class="relative flex w-full max-w-xs flex-1 flex-col bg-indigo-700 pt-5 pb-4">
              <TransitionChild as="template" enter="ease-in-out duration-300" enter-from="opacity-0"
                enter-to="opacity-100" leave="ease-in-out duration-300" leave-from="opacity-100" leave-to="opacity-0">
                <div class="absolute top-1 right-0 -mr-14 p-1">
                  <button type="button"
                    class="flex h-12 w-12 items-center justify-center rounded-full focus:outline-none focus:ring-2 focus:ring-white"
                    @click="mobileMenuOpen = false">
                    <XMarkIcon class="h-6 w-6 text-white" aria-hidden="true" />
                    <span class="sr-only">Close sidebar</span>
                  </button>
                </div>
              </TransitionChild>
              <div class="flex flex-shrink-0 items-center px-4">
                <img class="h-8 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=white"
                  alt="Your Company" />
              </div>
              <div class="mt-5 h-0 flex-1 overflow-y-auto px-2">
                <nav class="flex h-full flex-col">
                  <div class="space-y-1">
                    <a v-for="item in sidebarNavigation" :key="item.name" :href="item.href" :class="[
                      item.current
                        ? 'bg-indigo-800 text-white'
                        : 'text-indigo-100 hover:bg-indigo-800 hover:text-white',
                      'group py-2 px-3 rounded-md flex items-center text-sm font-medium',
                    ]" :aria-current="item.current ? 'page' : undefined">
                      <component :is="item.icon" :class="[
                        item.current
                          ? 'text-white'
                          : 'text-indigo-300 group-hover:text-white',
                        'mr-3 h-6 w-6',
                      ]" aria-hidden="true" />
                      <span>{{ item.name }}</span>
                    </a>
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
    <div class="flex flex-1 flex-col overflow-hidden">
      <header class="w-full">
        <div class="relative z-10 flex h-16 flex-shrink-0 border-b border-gray-200 bg-white shadow-sm">
          <button type="button"
            class="border-r border-gray-200 px-4 text-gray-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500 md:hidden"
            @click="mobileMenuOpen = true">
            <span class="sr-only">Open sidebar</span>
            <Bars3BottomLeftIcon class="h-6 w-6" aria-hidden="true" />
          </button>
          <div class="flex flex-1 justify-between px-4 sm:px-6">
            <div class="flex flex-1">
              <form class="flex w-full md:ml-0" action="#" method="GET">
                <label for="search-field" class="sr-only">Search all files</label>
                <div class="relative w-full text-gray-400 focus-within:text-gray-600">
                  <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center">
                    <MagnifyingGlassIcon class="h-5 w-5 flex-shrink-0" aria-hidden="true" />
                  </div>
                  <input name="search-field" id="search-field"
                    class="h-full w-full border-transparent py-2 pl-8 pr-3 text-base text-gray-900 placeholder-gray-500 focus:border-transparent focus:placeholder-gray-400 focus:outline-none focus:ring-0"
                    placeholder="Search" type="search" />
                </div>
              </form>
            </div>
            <div class="ml-2 flex items-center space-x-4 sm:ml-6 sm:space-x-6">
              <!-- Profile dropdown -->
              <Menu as="div" class="relative flex-shrink-0">
                <div>
                  <MenuButton
                    class="flex rounded-full bg-white text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                    <span class="sr-only">Open user menu</span>
                    <img class="h-8 w-8 rounded-full"
                      src="https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=8&w=256&h=256&q=80"
                      alt="" />
                  </MenuButton>
                </div>
                <transition enter-active-class="transition ease-out duration-100"
                  enter-from-class="transform opacity-0 scale-95" enter-to-class="transform opacity-100 scale-100"
                  leave-active-class="transition ease-in duration-75" leave-from-class="transform opacity-100 scale-100"
                  leave-to-class="transform opacity-0 scale-95">
                  <MenuItems
                    class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                    <MenuItem v-for="item in userNavigation" :key="item.name" v-slot="{ active }">
                    <a :href="item.href" :class="[
                      active ? 'bg-gray-100' : '',
                      'block px-4 py-2 text-sm text-gray-700',
                    ]">{{ item.name }}</a>
                    </MenuItem>
                  </MenuItems>
                </transition>
              </Menu>

              <button type="button"
                class="flex items-center justify-center rounded-full bg-indigo-600 p-1 text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
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
          class="flex flex-col justify-between w-full md:w-112 overflow-y-auto scrollbar border-r border-aronium-500">
          <!-- Your content -->

          <router-view></router-view>
          <div>
            <StoreTotalsCalculations />
          </div>
        </aside>

        <main class="hidden md:block flex-1 overflow-y-auto scrollbar pr-2 pl-1 py-2">
          <!-- Primary column -->
          <section aria-labelledby="primary-heading" class="flex h-full min-w-0 flex-1 flex-col lg:order-last">
            <h1 id="primary-heading" class="sr-only">Photos</h1>
            <!-- Your content -->
            <StoreGroupsList />
          </section>
        </main>
      </div>
    </div>
  </div>

  <!-- <StoreHeader />
<StoreSearch />
  -->
</template>

<script setup>
import { ref, defineAsyncComponent } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
import { getEvt } from "@/Orders/orderComposables";
import StoreHeader from "@/Orders/components/Headers/StoreHeader.vue";

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
  PlusIcon,
  RectangleStackIcon,
  Squares2X2Icon,
  UserGroupIcon,
  XMarkIcon,
} from "@heroicons/vue/24/outline";
import { MagnifyingGlassIcon } from "@heroicons/vue/20/solid";

const store = useOrderStore();

window.onkeydown = (evt) => {
  return getEvt(evt.key)();
};

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
  { name: "Home", href: "#", icon: HomeIcon, current: false },
  { name: "All Files", href: "#", icon: Squares2X2Icon, current: false },
  { name: "Photos", href: "#", icon: PhotoIcon, current: true },
  { name: "Shared", href: "#", icon: UserGroupIcon, current: false },
  { name: "Albums", href: "#", icon: RectangleStackIcon, current: false },
  { name: "Settings", href: "#", icon: CogIcon, current: false },
];
const userNavigation = [
  { name: "Your Profile", href: "#" },
  { name: "Sign out", href: "#" },
];

const mobileMenuOpen = ref(false);
</script>
