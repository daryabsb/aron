<template>
  <div
    class="phone:hidden p-2 text-aronium-white md:grid grid-cols-1 gap-2 sm:grid-cols-3"
  >
    <div
      class="py-3 border border-aronium-500 flex justify-center items-center hover:bg-pink-600"
    >
      <button
        role="button"
        class="mt-1 px-2 text-sm font-semibold tracking-tight"
      >
        Delete
      </button>
    </div>
    <div
      class="py-3 border border-aronium-500 flex justify-center items-center hover:bg-pink-600"
    >
      <button
        role="button"
        class="mt-1 px-2 text-sm font-semibold tracking-tight"
      >
        Quantity
      </button>
    </div>
    <div
      class="grow py-3 border border-aronium-500 flex justify-center items-center hover:bg-pink-600"
    >
      <Popper arrow>
        <button
          role="button"
          class="mt-1 px-2 text-sm font-semibold tracking-tight"
        >
          {{ activeNumber }}
        </button>
        <template #content="{ close }">
          <div class="w-32 mt-2 p-3 border border-aronium-500 bg-aronium-900">
            <ul>
              <li
                v-for="order in $filters.reverse(cart)"
                :key="order.number"
                class="cursor-pointer hover:text-pink-600 my-1 px-2 text-sm font-semibold tracking-tight"
                @click="submitActiveOrderNumber(order.number)"
              >
                <div class="w-full h-full" @click="close">
                  {{ order.number }}
                </div>
              </li>
              <li
                class="cursor-pointer hover:text-pink-600 my-1 px-2 text-sm font-semibold tracking-tight"
                @click="close"
              >
                Close
              </li>
            </ul>
          </div>
        </template>
      </Popper>
    </div>
  </div>
  <!-- <pre>
  {{ cart }}
  </pre> -->
</template>

<script setup>
import { ref } from "vue";
import { useOrderStore } from "@/Orders/ordersStore";
const store = useOrderStore();
const cart = store.cart;
const createCart = store.createCart;
const changeActiveOrderNumber = store.changeActiveOrderNumber;
const activeNumber = ref(store.activeNumber);
const submitActiveOrderNumber = (number) => {
  changeActiveOrderNumber(number);
  activeNumber.value = number;
};
const stats = [
  { name: "Delete", stat: "71,897" },
  { name: "Quantity", stat: "58.16%" },
  { name: activeNumber, stat: "24.57%" },
  { name: "New order", stat: "24.57%" },
];
</script>
