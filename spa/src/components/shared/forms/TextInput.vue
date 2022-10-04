<template>
  <div class="w-full px-2 mb-2">
    <div class="relative w-full mb-2">
      <label class="block text-sm mb-1" htmlFor="grid-password">
        {{ label }}
      </label>
      <input
        :type="type"
        :placeholder="placeholder"
        class="bg-inherit border text-aronium-white px-2 py-1 mb-1 text-sm w-full"
        :class="{
          'border-aronium-600 focus:border-pink-500': required,
          'disabled:opacity-75': disabled,
        }"
        :value="value"
        :disabled="disabled"
        @input="handleInput"
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
  name: "TextInput",
  props: {
    label: {
      type: String,
      required: false,
      default: "",
    },
    type: {
      type: String,
      required: true,
    },
    placeholder: {
      type: String,
      required: false,
      default: "",
    },
    required: {
      type: Boolean,
      reuired: false,
      default: false,
    },
    disabled: {
      type: Boolean,
      reuired: false,
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
