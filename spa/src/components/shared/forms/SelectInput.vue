<template>
  <div class="w-full px-2 mb-2">
    <div class="relative w-full mb-2">
      <label class="block text-sm mb-1" htmlFor="grid-password">
        {{ label }}
      </label>
      <select :value="value" name="itemsSelect">
        @input="handleInput">
        <option v-for="(index, item) in items" :key="index">{{
          item.name
        }}</option>
      </select>

      <input
        :type="type"
        :placeholder="placeholder"
        class="bg-inherit border text-aronium-white px-2 py-1 mb-1 text-sm w-full"
      />
      <span class="text-aronium-sky">
        <slot name="validation"></slot>
      </span>
      <!-- class=" ease-linear transition-all duration-150" -->
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
export default {
  name: "SelectInput",
  props: {
    label: {
      type: String,
      required: true,
    },
    items: {
      type: Object,
      required: true,
    },
  },
  setup() {
    const value = ref("");

    const handleInput = (e) => (value.value = e.target.value);

    return {
      value,
      handleInput,
    };
  },
};
</script>
