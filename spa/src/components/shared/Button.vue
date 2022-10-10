<template>
  <button
    :class="classes"
    class="h-16 px-8 p-3 rounded-sm focus:outline-none active:bg-gray-400"
    @keydown.enter.prevent
    @keydown.space.prevent
  >
    <slot></slot>
  </button>
</template>

<script>
export default {
  name: "Button",
  props: {
    variant: { type: String, default: "blue" },
  },

  setup(props) {
    const variantsClasses = {
      yellow: "bg-yellow-600 hover:bg-yellow-500",
      blue: "bg-blue-600 hover:bg-blue-500",
      green: "bg-green-600 hover:bg-green-500",
      red: "bg-aronium-danger hover:bg-red-500",
      transRed:
        "bg-transparent hover:bg-aronium-danger border border-aronium-danger text-aronium-danger hover:text-aronium-white",
      transGreen:
        "bg-transparent hover:bg-aronium-green border border-aronium-green text-aronium-green hover:text-aronium-white",
      transYellow:
        "bg-transparent hover:bg-yellow-600 border border-yellow-600 text-yellow-600 hover:text-aronium-white",

      gray: "bg-aronium-800 hover:bg-aronium-700",
      transparent:
        "bg-transparent hover:bg-aronium-500 border border-aronium-500",
    };

    return { classes: variantsClasses[props.variant] };
  },
};
</script>
