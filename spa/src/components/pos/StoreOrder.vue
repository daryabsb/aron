<template>
  <div class="flex flex-col flex-1">
    <div>
      <span class="w-full isolate flex items-stretch rounded-sm shadow-sm">
        <button
          type="button"
          class="relative inline-flex items-center rounded-l-sm border border-aronium-500 bg-aronium-700 mr-2 px-8 py-2 text-sm font-medium text-aronium-white hover:bg-pink-500 focus:z-10 fo"
        >
          Years
        </button>
        <button
          type="button"
          class="relative inline-flex items-center border border-aronium-500 bg-aronium-700 px-8 py-2 text-sm font-medium text-aronium-white hover:bg-pink-500 focus:z-10"
        >
          Months
        </button>
        <button
          type="button"
          class="grow justify-center relative inline-flex items-center rounded-r-sm border border-aronium-500 bg-aronium-700 ml-2 px-4 py-2 text-sm font-medium text-aronium-white hover:bg-pink-500"
        >
          Days
        </button>
      </span>
    </div>
    <order-items-list></order-items-list>
    <div class="mt-3">
      <div class="py-4 sm:gap-4 sm:py-5 text-aronium-white">
        <dd class="mt-1 text-sm sm:col-span-2 sm:mt-0">
          <ul role="list" class="rounded-sm border border-aronium-500">
            <li
              class="flex items-center justify-between py-3 pl-3 pr-4 text-sm"
            >
              <div class="flex w-0 flex-1 items-center">
                <span class="ml-2 w-0 flex-1 truncate">Sub total</span>
              </div>
              <div class="ml-4 flex flex-shrink-0 space-x-4">
                <span class="text-gray-300" aria-hidden="true">{{
                  numberFormat(priceFormat(200).value)
                }}</span>
              </div>
            </li>
            <li
              class="flex items-center justify-between py-3 pl-3 pr-4 text-sm"
            >
              <div class="flex w-0 flex-1 items-center">
                <span class="ml-2 w-0 flex-1 truncate">Tax</span>
              </div>
              <div class="ml-4 flex flex-shrink-0 space-x-4">
                <span class="text-gray-300" aria-hidden="true">0</span>
              </div>
            </li>
            <li
              class="flex items-center justify-between py-3 pl-3 pr-4 text-sm"
            >
              <div class="flex w-0 flex-1 items-center">
                <span class="ml-2 w-0 flex-1 truncate">Total</span>
              </div>
              <div class="ml-4 flex flex-shrink-0 space-x-4">
                <span class="text-gray-300" aria-hidden="true">{{
                  numberFormat(priceFormat(200).value)
                }}</span>
              </div>
            </li>
          </ul>
        </dd>
      </div>
    </div>
  </div>
</template>

<script setup>
import { PaperClipIcon, PlusIcon, MinusIcon } from "@heroicons/vue/20/solid";
import OrderItemsList from "@/components/pos/orders/OrderItemsList.vue";
import { numberFormat, priceFormat } from "@/store/composables";
</script>
