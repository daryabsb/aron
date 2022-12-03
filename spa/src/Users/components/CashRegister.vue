<template>
  <div class="text-aronium-white">
    <Suspense>
      <span>
        {{ store.useCashRegister.name }}
      </span>
      <template #fallback>
        <span class="animate-pulse">Loading</span>
      </template>
    </Suspense>
  </div>
</template>

<script setup>
import { useUser } from "@/Users/userStore";
const store = useUser();
</script>
