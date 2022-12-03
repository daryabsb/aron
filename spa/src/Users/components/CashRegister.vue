<template>
  <div class="text-aronium-white">
    <Suspense>
      <span v-if="store.useCashRegister">
        {{ store.useCashRegister.name }}
      </span>
      <template #fallback>
        <span class="animate-pulse">Loading</span>
      </template>
    </Suspense>
  </div>
</template>

<script setup>
import { onMounted } from "vue";
import { useUser } from "@/Users/userStore";
import { useOrderStore } from "@/Orders/ordersStore"
const store = useUser();
onMounted(store.loadCashRegisterData);
</script>
