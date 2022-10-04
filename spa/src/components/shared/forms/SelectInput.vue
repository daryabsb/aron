<template>
  <div class="w-full px-2 mb-2">
    <div class="relative w-full mb-2">
      <label class="block text-sm mb-1" htmlFor="grid-password">
        {{ label }}
      </label>
      <slot name="select">
        <select
          class="bg-inherit relative text-aronium-white w-full px-2 py-1 mb-1 text-sm"
          :value="value"
          name="itemsSelect"
        >
          <option :value="none" class="bg-aronium-800 text-aronium-white w-full"
            >(none)</option
          >

          <option
            v-for="item in items"
            :key="item.id"
            class="bg-aronium-800 text-aronium-white w-full"
            >{{ item.name }}</option
          >
        </select>
      </slot>
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
    const value = ref(0);
    const none = ref(0);

    const handleInput = (e) => (value.value = e.target.value);

    return {
      none,
      value,
      handleInput,
    };
  },
};
</script>
