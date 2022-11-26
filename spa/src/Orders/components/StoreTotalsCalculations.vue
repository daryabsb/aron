<template>
  <dl
    class="flex flex-col divide-y-2 divide-dashed divide-aronium-500 overflow-hidden bg-aronium-900 shadow-sm border-t-2 pb-3 border-pink-500">
    <div class="flex items-center justify-between py-2 phone:p-2">
      <dt class="text-xl font-normal text-aronium-white">
        Subtotal
      </dt>
      <dd class="mt-1 flex items-baseline justify-between lg:flex">
        <div :class="[
          isDiscount
            ? 'line-through text-aronium-danger'
            : 'text-aronium-green-400 font-semibold',
          'flex items-baseline text-2xl ',
        ]">
          {{ priceFormat(store.useActiveOrder.totalFirstDraft) }}
        </div>
      </dd>
    </div>
    <div v-if="isDiscount" class="flex items-center justify-between py-2 phone:p-2">
      <dt class="text-xl font-normal text-aronium-white">
        Discounted Price
        <span>
          <div class="text-aronium-green text-sm font-semibold flex items-start">
            {{ store.useActiveOrder.discount
            }}{{ store.useActiveOrder.discountStr }}
            <ArrowDownIcon class="font-bold h-6 w-8 hover:text-pink-400" />
          </div>
        </span>
      </dt>
      <dd class="mt-1 flex items-baseline justify-between lg:flex">
        <div class="flex items-baseline text-aronium-green-400 text-2xl font-semibold text-aronium-white">
          {{ priceFormat(store.useActiveOrder.totalWithDiscount) }}
        </div>
      </dd>
    </div>
    <div class="flex items-center justify-between py-2 phone:p-2">
      <dt class="text-lg font-normal text-aronium-white">
        Tax (VAT)
      </dt>
      <dd class="mt-1 flex items-baseline justify-between lg:flex">
        <div class="flex items-baseline text-orange-400 shadow-md text-xl font-semibold text-aronium-white">
          {{ priceFormat(store.useActiveOrder.totalTax) }}
        </div>
      </dd>
    </div>
    <div class="flex items-center justify-between py-2 phone:p-2">
      <dt class="text-xl font-normal text-aronium-white h-6">
        Total
      </dt>

      <dd class="mt-1 flex items-center justify-between lg:flex">

        <div class="flex items-baseline text-aronium-green-400 text-2xl font-semibold text-aronium-white">
          {{ priceFormat(store.useActiveOrder.totalPrice) }}
        </div>
      </dd>
    </div>

  </dl>
</template>

<script setup>
import { computed, watchEffect } from "vue";
import { storeToRefs } from "pinia";
import { useOrderStore } from "@/Orders/ordersStore";
import { useUtils } from "@/Orders/orderComposables/useUtils";
import { useOrder } from "@/Orders/orderComposables/orderProperties";
import { ArrowDownIcon } from "@heroicons/vue/20/solid";

const store = useOrderStore();
const utils = useUtils();
const priceFormat = utils.priceFormat;
const useActiveOrder = store.useActiveOrder;
// const useActiveOrder = store.useActiveOrder;
const isDiscount = computed(() => store.useActiveOrder.discount);

</script>
