<template>
  <div class="mt-3">
    <label
      :for="`${target}-toggle`"
      class="inline-flex relative items-center cursor-pointer"
    >
      <input
        :id="`${target}-toggle`"
        type="checkbox"
        class="sr-only peer"
        :value="value"
        :checked="checked"
        @input="handleInput"
      />
      <div
        class="w-9 h-4 border-4 border-double border-aronium-900 bg-aronium-600 peer-focus:outline-none peer-focus:ring-1 peer peer-checked:after:translate-x-6 after:content-[''] after:absolute after:top-[1px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:h-5 after:w-3 after:transition-all peer-checked:bg-aronium-green"
      ></div>
      <span class="ml-2 text-aronium-white dark:text-gray-300">{{
        label
      }}</span>
    </label>
  </div>
</template>

<script>
import { ref } from "vue";
export default {
  name: "TextInput",
  props: {
    label: {
      type: String,
      required: true,
    },
    target: {
      type: String,
      required: true,
    },
    checked: {
      type: Boolean,
      required: false,
      default: false,
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
