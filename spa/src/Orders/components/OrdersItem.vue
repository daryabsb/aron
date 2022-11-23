<template>
  <!-- <div
    :class="[
      'relative max-h-16 flex items-center space-x-3 rounded-sm',
      'bg-aronium-700 border border-aronium-500 px-6 py-2 first:mt-1 my-2 mx-1 shadow-sm',
      'focus-within:ring-2 focus-within:ring-pink-700 focus-within:ring-offset-0',
      'focus-within:bg-pink-700 focus-within:bg-opacity-10',
      'hover:border-pink-500',
    ]"
  >
    <div class="flex-shrink-0">
      <img class="h-10 w-10 rounded-full" :src="item.product.image" alt="" />
    </div>

    <div class="min-w-0 flex-1">
      <a href="#" class="focus:outline-none text-aronium-white">
        <p class="flex text-sm font-medium">
          <span>{{ item.product.name }}</span>
          <span
            v-if="item.product.tax.rate"
            class="ml-6 shadow-sm px-6 shadow-aronium-500 text-aronium-danger font-semibold"
          >
            + TAX {{ item.product.tax.rate }}%
          </span>
        </p>
        <p class="truncate text-sm">
          {{ priceFormat(item.product.price) }}
          /
          <span
            :class="[
              item.discount
                ? 'line-through text-aronium-danger'
                : 'text-aronium-white',
            ]"
          >
            {{ priceFormat(item.totalWithTax()) }}
          </span>
          <span v-if="item.discount">
            {{ " " }}
            {{ priceFormat(item.orderItemTotal()) }}</span
          >
        </p>
      </a>
    </div>
    <div
      v-if="item.discount"
      class="p-2 h-9 w-9 rounded-full bg-aronium-danger relative"
    >
      <span class="absolute top-2 left-1 text-xs"
        >{{ item.discount }}{{ item.discountType == 0 ? "%" : "$" }}</span
      >
    </div>
    <div v-if="!isPayment" class="ml-4 flex flex-shrink-0 space-x-4">
      <button
        type="button"
        class="font-medium hover:text-pink-500 outline-none focus:ring-pink-500 ring-0"
        @click="addQty(item, -1)"
      >
        <MinusIcon class="h-5 w-5 flex-shrink-0" aria-hidden="true"></MinusIcon>
      </button>
      <span class="text-aronium-white" aria-hidden="true">{{
        item.quantity + " " + item.measurementUnit()
      }}</span>
      <button
        type="button"
        class="font-medium hover:text-pink-500 focus:outline-none focus:ring-2 focus:ring-pink-500 focus:ring-offset-2"
      >
        <PlusIcon
          class="h-5 w-5 flex-shrink-0"
          fill="white"
          aria-hidden="true"
          @click="addQty(item, 1)"
        ></PlusIcon>
      </button>
    </div>
  </div> -->

  <div
    :class="[
      checked
        ? 'border-transparent ring-1 ring-pink-500'
        : 'border-aronium-500',
      active ? 'border-pink-500 ring-1 ring-pink-400' : '',
      'flex justify-between items-center   rounded-sm m-1 shadow-sm focus:outline-none',
    ]"
  >
    <div class="relative flex items-center cursor-pointer">
      <CheckCircleIcon
        :class="[!false ? 'invisible' : '', 'h-5 w-5 text-pink-400 mr-2']"
        aria-hidden="true"
      />
      <span
        :class="['pointer-events-none absolute -inset-px rounded-sm']"
        aria-hidden="true"
      />
      <span class="flex flex-1">
        <span class="flex flex-col">
          <RadioGroupLabel
            as="span"
            class="block text-sm font-medium text-aronium-white"
            >{{ item.product.name }}
          </RadioGroupLabel>
          <RadioGroupDescription
            as="span"
            class="mt-1 flex items-center text-sm text-aronium-400"
          >
            <p class="truncate text-sm">
              {{ priceFormat(item.product.price) }}
              /
              <span
                :class="[
                  item.discount
                    ? 'line-through text-aronium-danger'
                    : 'text-aronium-white',
                ]"
              >
                {{ priceFormat(item.totalWithTax()) }}
              </span>
              <span v-if="item.discount">
                {{ " " }}
                {{ priceFormat(item.orderItemTotal()) }}</span
              >
            </p>
          </RadioGroupDescription>
        </span>
      </span>
    </div>
    <div v-if="!isPayment" class="w-16">
      <!-- Right buttons -->
      <nav aria-label="Pagination flex mx-1  items-center ">
        <span class="isolate flex flex-col justify-center items-center">
          <span
            class="relative inline-flex items-center -mb-2"
            @click="addQty(item, 1)"
          >
            <span class="sr-only">Next</span>
            <ChevronUpIcon
              class="text-aronium-white font-bold h-6 w-8 hover:text-pink-400"
              aria-hidden="true"
            />
          </span>
          <span class="text-aronium-white mx-2" aria-hidden="true">{{
            item.quantity + " " + item.measurementUnit()
          }}</span>
          <span
            class="relative inline-flex items-center -mt-2"
            @click="addQty(item, -1)"
          >
            <span class="sr-only">Previous</span>
            <ChevronDownIcon
              class="text-aronium-white font-bold h-6 w-8 hover:text-pink-400"
              aria-hidden="true"
            />
          </span>
        </span>
      </nav>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
// import { useActiveOrderStore } from "@/Orders/ordersStore/useActiveOrder";
import { defineProps } from "vue";
import { PlusIcon, MinusIcon } from "@heroicons/vue/20/solid";
import { useOrderItem } from "@/Orders/orderComposables/orderItemProperties";
import { useOrder } from "@/Orders/orderComposables/orderProperties";

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

const store = useOrderStore();
const useActiveOrder = store.useActiveOrder;
console.log("check inside active order", useActiveOrder);
const addQty = store.addQty;
const priceFormat = store.priceFormat;
const props = defineProps({
  orderitem: { type: Object },
  checked: { type: Boolean, default: false },
  active: { type: Boolean, default: false },
  isPayment: { type: Boolean, default: false },
});

const item = computed(() => useOrderItem(props.orderitem));
</script>
