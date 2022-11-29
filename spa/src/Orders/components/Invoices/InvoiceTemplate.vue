<!--
  This example requires some changes to your config:
  
  ```
  // tailwind.config.js
  module.exports = {
    // ...
    plugins: [
      // ...
      require('@tailwindcss/forms'),
      require('@tailwindcss/aspect-ratio'),
    ],
  }
  ```
-->
<template>
  <main class="px-8">
    <InvoiceItems @open="open" />
  </main>
</template>

<script setup>
import { ref } from "vue";
import InvoiceItems from "@/Orders/components/Invoices/InvoiceItems.vue";



const open = ref(false);
</script>
