<template>
  <div>
    <Modal @close="$emit('close')" size="md">
      <template #title>
        <div>
          <div class="sm:hidden">
            <label for="tabs" class="sr-only">Select a tab</label>
            <!-- Use an "onChange" listener to redirect the user to the selected tab URL. -->
            <select id="tabs" name="tabs"
              class="block w-full rounded-md border-gray-300 py-2 pl-3 pr-10 text-base focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm">
              <option v-for="tab in tabs" :key="tab.id" :selected="tab.current" @click="toggleTab(tab.id)">{{ tab.name
              }}</option>
            </select>
          </div>
          <div class="hidden sm:block">
            <div class="border-b border-aronium-500">
              <nav class="-mb-px flex justify-center space-x-12" aria-label="Tabs">
                <span v-for="tab in tabs" :key="tab.id" :class="[
                  tab.current
                    ? 'border-pink-700 text-pink-700'
                    : 'border-transparent text-aronium-white hover:text-aronium-300 hover:border-aronium-300',
                  'whitespace-nowrap py-4 px-1 border-b font-normal text-md cursor-pointer',
                ]" @click="toggleTab(tab.id)">{{ tab.name }}</span>
              </nav>
            </div>
          </div>
        </div>
      </template>
      <template #content>
        <div class="flex flex-col items-center h-2/5 w-full p-2">
          <div class="p-5">
            <img src="/media/icons/cart.svg" class="w-16" alt="cart-icon" />
          </div>
          <!-- <keep-alive> -->
          <component :is="component" :disabled="activeItem" />
          <!-- </keep-alive> -->
          <!-- @close="$emit('close')" -->

          <!-- <NumericPad @calculatorValue="discountValue" /> -->
        </div>
      </template>
      <template #button>
        <button type="button"
          class="inline-flex leading-6 w-full justify-center rounded-sm border border-aronium-500 bg-aronium-900 px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-aronium-600 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:text-sm"
          @click="$emit('close')">
          Clear all discounts
        </button>
      </template>
    </Modal>
  </div>
</template>

<script setup>
import { ref, computed, watch, reactive, onMounted } from "vue";
import Modal from "@/components/shared/Modal.vue";

import { useOrderStore } from "@/Orders/ordersStore";

import StoreOrderDiscountCart from "@/Orders/components/StoreOrderDiscountCart.vue";
import StoreOrderDiscountCartItem from "@/Orders/components/StoreOrderDiscountCartItem.vue";

const store = useOrderStore();
const useActiveOrder = ref(store.useActiveOrder);

const activeItem = computed(() =>
  useActiveOrder.value.items.find((itm) => itm.isActive)
);
const tabs = ref([
  { id: 1, name: "Cart discount", href: "#", current: false },
  { id: 2, name: "Item discount", href: "#", current: false },
]);

const tabID = ref(1);
onMounted(() => {
  if (!activeItem.value) {
    tabID.value = 1;
    // tabs.value[0].current = true;
  } else {
    tabID.value = 2;
    // tabs.value[1].current = true;
  }
});

watch(
  () => tabID,
  () => {
    tabs.value.forEach((tab) => (tab.current = !tab.current));
  }
);

const toggleTab = (ID) => {
  const selectedTab = tabs.value.find((tab) => tab.id == ID);
  selectedTab.current = true;
  tabID.value = ID;
};

const component = computed(() =>
  tabID.value == 1 ? StoreOrderDiscountCart : StoreOrderDiscountCartItem
);

// const emit = defineEmits(["close"]);
</script>
