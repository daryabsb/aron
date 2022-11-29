<template>
  <div>
    <div class="border-b border-aronium-500 p-1 z-50">
      <StoreOrderTopButtons />
    </div>
    <div v-if="store.useActiveOrder" class="">
      <div class="flex flex-col space-y-2 flex-1 max-h-[90rem]">
        <Suspense>
          <RadioGroup ref="orderList" v-model="selectedOrderItem">
            <div class="border-b border-aronium-500 divide-y divide-aronium-500 overflow-y-auto scrollbar">
              <RadioGroupOption v-for="item in store.useActiveOrder.items" :key="item" as="template" :value="item">
                <div :class="[store.activeItem === item ? 'border-transparent ring-1 ring-pink-500'
                : 'border-aronium-500', 'flex justify-between items-center rounded-sm m-1'
                , ' shadow-sm focus:outline-none']">
                  <div class="relative flex items-center cursor-pointer">
                    <CheckCircleIcon :class="[
                      store.activeItem === item ? '' : 'invisible',
                      'h-5 w-5 text-pink-400 mx-2',
                    ]" aria-hidden="true" />

                    <span :class="[
                      'pointer-events-none absolute -inset-px rounded-sm',
                    ]" aria-hidden="true" />
                    <span class="flex flex-1">
                      <span class="flex flex-col">
                        <RadioGroupLabel as="span" class="block text-sm font-medium text-aronium-white">
                          {{
                              item.product.name
                          }}
                        </RadioGroupLabel>
                        <RadioGroupDescription as="span" class="mt-1 flex items-center text-sm text-aronium-400">
                          <p class="truncate text-sm">
                            {{ priceFormat(item.product.price) }}
                            /
                            <span :class="[
                              item.discount
                                ? 'line-through text-aronium-danger'
                                : 'text-aronium-white',
                            ]">
                              {{
                                  priceFormat(
                                    store.useActiveOrder.itemTotal(item)
                                  )
                              }}
                            </span>
                            <span v-if="item.discount">
                              {{ " " }}
                              {{
                                  priceFormat(
                                    store.useActiveOrder.itemTotalWithItemDiscount(
                                      item
                                    )
                                  )
                              }}
                            </span>
                          </p>
                        </RadioGroupDescription>
                      </span>
                    </span>
                  </div>
                  <div class="w-40 text-aronium-white">
                    <!-- Right buttons -->
                    <nav aria-label="Pagination flex mx-1  items-center ">
                      <span class="isolate flex flex-col justify-center items-center">
                        <span class="relative inline-flex items-center -mb-2" @click="addQty(item, 1)">
                          <span class="sr-only">Add</span>
                          <ChevronUpIcon class="text-aronium-400 font-semibold h-6 w-8 hover:text-pink-400"
                            aria-hidden="true" />
                        </span>
                        <span class="font-bold text-aronium-white mx-2" aria-hidden="true">{{
                            item.quantity + " " + item.product.measurement_unit
                        }}</span>
                        <span class="relative inline-flex items-center -mt-2" @click="addQty(item, -1)">
                          <span class="sr-only">Previous</span>
                          <ChevronDownIcon class="text-aronium-400 font-bold h-6 w-8 hover:text-pink-400"
                            aria-hidden="true" />
                        </span>
                      </span>
                    </nav>
                  </div>
                </div>
              </RadioGroupOption>
            </div>
          </RadioGroup>

          <template #fallback>
            <div class="flex-1 w-full p-4 select-none flex flex-col flex-wrap content-center justify-center">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-16 inline-block" fill="none" viewBox="0 0 24 24"
                stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
              </svg>
              <p>
                CART EMPTY
              </p>
            </div>
          </template>
        </Suspense>
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  ref,
  computed,
  watch,
  defineProps,
  onMounted,
  onBeforeUnmount,
  defineAsyncComponent,
} from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
import { useClick } from "@/composables/useClick";
import { useOrder } from "@/Orders/orderComposables/orderProperties";
import { useOrderItem } from "@/Orders/orderComposables/orderItemProperties";
import {
  RadioGroup,
  RadioGroupDescription,
  RadioGroupLabel,
  RadioGroupOption,
} from "@headlessui/vue";
import {
  CheckCircleIcon,
  ChevronDownIcon,
  ChevronUpIcon,
} from "@heroicons/vue/20/solid";

const props = defineProps({
  number: { type: String, required: true },
});

const store = useOrderStore();
const click = useClick();
const orderList = ref(null);

const activeOrderNumber = store.activeNumber;
// const useActiveOrder = computed(() => useOrder(store.useActiveOrder));
const addQty = store.addQty;
const priceFormat = store.priceFormat;

const StoreOrderTopButtons = defineAsyncComponent(() =>
  import("@/Orders/components/StoreOrderTopButtons.vue")
);

onMounted(async () => {
  store.activeNumber = props.number;
  store.activeItem = null
  if (store.cart.length === 0) {
    store.cart = JSON.parse(localStorage.getItem("cart"));
  }
  click.addListener((e) => {
    const nav = document.getElementById("sideNav")
    if (e.composedPath().includes(orderList.value.el)) {
      setItem()
    } else if (!e.composedPath().includes(nav)) {
      setNull()
      store.activeItem = null
    }
    // console.log(e.composedPath().includes(nav));
    // console.log(nav);
  });
});
const isActive = () => {
}
const setItem = () => {
  console.log("called");
  if (selectedOrderItem.value) {
    store.activeItem = selectedOrderItem.value
  }
}
const setNull = () => {
  console.log("called");
  if (!selectedOrderItem.value) {
    store.activeItem = null
  }
}
const selectedOrderItem = ref(null);
// watch(selectedOrderItem, () => store.setActiveItem(selectedOrderItem.value));
onBeforeUnmount(() => click.removeAllListeners())
</script>
