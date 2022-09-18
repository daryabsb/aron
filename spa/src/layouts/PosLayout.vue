<script setup>
import PosLeftNav from "@/components/pos/PosLeftNav.vue";
</script>

<template>
  <div class="bg-blue-gray-50">
    <div
      class="hide-print flex flex-row h-screen antialiased text-blue-gray-800"
    >
      <pos-left-nav />
      <router-view></router-view>
    </div>
  </div>
</template>
