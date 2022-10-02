<template>
  <div class="w-full px-2">
    <div class="relative w-full mb-3">
      <label class="block text-sm mb-1" htmlFor="grid-password">
        {{ label }}
      </label>
      <input
        :type="type"
        class="text-zinc-900 px-2 py-2 text-sm w-full"
        :class="required ? 'focus:border-2 focus:border-pink-500' : 'border-0'"
        value="lucky.jesse"
      />
      <!-- class=" ease-linear transition-all duration-150" -->
    </div>
  </div>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      required: true,
    },
    type: {
      type: String,
      required: true,
    },
    required: {
      type: Boolean,
      reuired: false,
      default: false,
    },
  },
  setup() {},
};
</script>
