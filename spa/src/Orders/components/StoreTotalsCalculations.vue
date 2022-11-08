<template>
  <div>
    <dl
      class="grid grid-cols-1 divide-y divide-aronium-500 overflow-hidden rounded-lg bg-aronium-900 shadow md:grid-cols-4 md:divide-y-0 md:divide-x"
    >
      <div
        v-for="item in stats"
        :key="item.name"
        class="md:px-8 py-2 phone:p-2"
      >
        <dt class="text-base font-normal text-aronium-white">
          {{ item.name }}
        </dt>
        <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
          <div
            class="flex items-baseline text-green-700 text-2xl font-semibold text-aronium-white"
          >
            {{ item.stat }}
            <!-- <span class="ml-2 text-sm font-medium text-aronium-300"
              >from {{ item.value }}</span
            > -->
          </div>

          <!-- <div
            :class="[
              item.changeType === 'increase'
                ? 'bg-green-100 text-green-800'
                : 'bg-red-100 text-red-800',
              'inline-flex items-baseline px-2.5 py-0.5 rounded-full text-sm font-medium md:mt-2 lg:mt-0',
            ]"
          >
            <ArrowUpIcon
              v-if="item.changeType === 'increase'"
              class="-ml-1 mr-0.5 h-5 w-5 flex-shrink-0 self-center text-green-500"
              aria-hidden="true"
            />
            <ArrowDownIcon
              v-else
              class="-ml-1 mr-0.5 h-5 w-5 flex-shrink-0 self-center text-red-500"
              aria-hidden="true"
            />
            <span class="sr-only">
              {{ item.changeType === "increase" ? "Increased" : "Decreased" }}
              by
            </span>
            {{ item.change }}
          </div> -->
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

const stats = ref([
  {
    name: "Total before tax",
    stat: totalBeforeTax,
    value: totalBeforeTax,
    variant: false,
    changeType: "increase",
  },
  {
    name: "Total tax",
    stat: totalTax,
    value: totalTax,
    variant: false,
    changeType: "increase",
  },
  {
    name: "Total",
    stat: totalBeforeDiscount,
    value: totalBeforeDiscount,
    variant: activeOrder.discount ? true : false,
    changeType: "decrease",
  },
  {
    name: "Total",
    stat: total,
    value: total,
    variant: false,
    changeType: "decrease",
  },
]);
</script>
