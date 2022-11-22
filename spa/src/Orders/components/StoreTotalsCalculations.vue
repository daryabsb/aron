<template>
  <dl
    class="flex flex-col divide-y-2 divide-dashed divide-aronium-500 overflow-hidden bg-aronium-900 shadow-sm border-t-2 pb-3 border-pink-500"
  >
    <div class="flex items-center justify-between py-2 phone:p-2">
      <dt class="text-xl font-normal text-aronium-white">
        Subtotal
      </dt>
      <dd class="mt-1 flex items-baseline justify-between lg:flex">
        <div
          class="flex items-baseline text-aronium-green-400 text-2xl font-semibold text-aronium-white"
        >
          {{ priceFormat(useActiveOrder.subTotalBeforeTax()) }}
        </div>
      </dd>
    </div>
    <div class="flex items-center justify-between py-2 phone:p-2">
      <dt class="text-lg font-normal text-aronium-white">
        Tax
      </dt>
      <dd class="mt-1 flex items-baseline justify-between lg:flex">
        <div
          class="flex items-baseline text-orange-400 shadow-md text-xl font-semibold text-aronium-white"
        >
          {{ priceFormat(useActiveOrder.totalTax()) }}
        </div>
      </dd>
    </div>
    <div class="flex items-center justify-between py-2 phone:p-2">
      <dt class="text-xl font-normal text-aronium-white h-6">
        Total
      </dt>
      <dd class="mt-1 flex items-baseline justify-between lg:flex">
        <div
          :class="[
            isDiscount
              ? 'line-through text-aronium-danger'
              : 'text-aronium-green-400 font-semibold',
            'flex items-baseline text-2xl ',
          ]"
        >
          {{ priceFormat(useActiveOrder.subTotalWithTax()) }}
        </div>
      </dd>
    </div>
    <div
      v-if="isDiscount"
      class="flex items-center justify-between py-2 phone:p-2"
    >
      <dt class="text-lg font-normal text-aronium-white h-6" />
      <dd class="mt-1 flex items-baseline justify-between lg:flex">
        <div
          class="flex items-baseline text-aronium-green-400 text-2xl font-semibold text-aronium-white"
        >
          {{ priceFormat(useActiveOrder.total) }}
        </div>
      </dd>
    </div>
  </dl>
</template>

<script setup>
import { computed, watchEffect } from "@vue/runtime-core";
import { useOrderStore } from "@/Orders/ordersStore";
import { useOrder } from "@/Orders/orderComposables/orderProperties";

const store = useOrderStore();
const priceFormat = store.priceFormat;

const useActiveOrder = computed(() => useOrder(store.useActiveOrder));
watchEffect(() => useActiveOrder);
const isDiscount = computed(() => useActiveOrder.value.discount);
</script>
