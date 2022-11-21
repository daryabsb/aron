<template>
  <dl
    class="grid grid-cols-1 h-24 divide-y divide-aronium-500 overflow-hidden rounded-lg bg-aronium-900 shadow md:grid-cols-4 md:divide-y-0 md:divide-x"
  >
    <div class="md:px-8 py-2 phone:p-2">
      <dt class="text-base font-normal text-aronium-white">
        Total before tax
      </dt>
      <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
        <div
          class="flex items-baseline text-green-700 text-2xl font-semibold text-aronium-white"
        >
          {{ priceFormat(useActiveOrder.subTotalBeforeTax()) }}
        </div>
      </dd>
    </div>
    <div class="md:px-8 py-2 phone:p-2">
      <dt class="text-base font-normal text-aronium-white">
        Total tax
      </dt>
      <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
        <div
          class="flex items-baseline text-green-700 text-2xl font-semibold text-aronium-white"
        >
          {{ priceFormat(useActiveOrder.totalTax()) }}
        </div>
      </dd>
    </div>
    <div class="md:px-8 py-2 phone:p-2">
      <dt class="text-base font-normal text-aronium-white">
        Total
      </dt>
      <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
        <div
          class="flex items-baseline text-2xl text-aronium-white"
          :class="[
            isDiscount
              ? 'line-through text-aronium-danger'
              : 'text-green-700 font-semibold',
          ]"
        >
          {{ priceFormat(useActiveOrder.subTotalWithTax()) }}
        </div>
      </dd>
    </div>
    <div v-if="isDiscount" class="md:px-8 py-2 phone:p-2">
      <dt class="text-base font-normal text-aronium-white">Final Price</dt>
      <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
        <div
          class="flex items-baseline text-green-700 text-2xl font-semibold text-aronium-white"
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
