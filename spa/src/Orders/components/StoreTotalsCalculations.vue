<template>
  <div>
    <dl
      class="grid grid-cols-1 divide-y divide-aronium-500 overflow-hidden rounded-lg bg-aronium-900 shadow md:grid-cols-4 md:divide-y-0 md:divide-x"
    >
      <div class="md:px-8 py-2 phone:p-2">
        <dt class="text-base font-normal text-aronium-white">
          Total before tax
        </dt>
        <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
          <div
            class="flex items-baseline text-green-700 text-2xl font-semibold text-aronium-white"
          >
            {{ totalBeforeTax }}
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
            {{ totalTax }}
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
            {{ totalBeforeDiscount }}
          </div>
        </dd>
      </div>
      <div v-if="isDiscount" class="md:px-8 py-2 phone:p-2">
        <dt class="text-base font-normal text-aronium-white">Final Price</dt>
        <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
          <div
            class="flex items-baseline text-green-700 text-2xl font-semibold text-aronium-white"
          >
            {{ total }}
          </div>
        </dd>
      </div>
    </dl>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
const store = useOrderStore();

const activeOrder = store.useActiveOrder.value;

const totalBeforeTax = computed(() => store.subTotalBeforeTax);
const totalBeforeDiscount = computed(() => store.subTotalBeforeDiscount);
const total = computed(() => store.totalPrice);
const totalTax = activeOrder.tax;

const isDiscount = computed(
  () => activeOrder.discount || totalBeforeDiscount.value < totalBeforeTax.value
);
</script>
