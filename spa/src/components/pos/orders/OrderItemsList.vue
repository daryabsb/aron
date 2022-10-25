<template>
  <div class="grid grid-cols-1 gap-2 space-y-1 flex-1 mt-3">
    <template v-for="item in products" :key="item.id">
      <order-item :item="item"></order-item>
    </template>
  </div>
</template>

<script setup>
import OrderItem from "@/components/pos/orders/OrderItem.vue";
import { products } from "./PlaceHolder";
</script>
