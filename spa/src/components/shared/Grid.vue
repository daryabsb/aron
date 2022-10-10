<template>
  <div :class="`grid grid-rows-${rows} grid-cols-${cols} gap-${gap}`">
    <slot></slot>
  </div>
</template>

<script>

export default {
  name: "Grid",
  props: {
    rows: { type: [String, Number], required: true },
    cols: { type: [String, Number], required: true },
    gap: { type: [String, Number], defualt: 0 },
  },
};
</script>
