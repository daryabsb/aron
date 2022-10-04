<template>
  <div
    class="flex flex-row w-full h-20 rounded-sm border my-2"
    :class="[borderColor]"
  >
    <div class="relative" :class="bgColor">
      <span class="flex justify-center items-center w-12 h-full">
        <span
          class="flex justify-center items-center w-6 h-6 border border-aronium-white rounded-full"
        >
          <i class="fa fa-info"></i>
        </span>
      </span>
    </div>
    <div class="ml-3 p-1 text-sm">
      <p>
        {{ tip }}
      </p>
      <p class="text-aronium-sky cursor-pointer">{{ link }}</p>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
export default {
  name: "InformationAlert",
  props: {
    tip: {
      type: String,
      required: true,
    },
    link: {
      type: String,
      required: false,
      default: "Learn more",
    },
    color: {
      type: String,
      required: false,
      default: "sky",
    },
  },
  setup(props) {
    const bgColor = ref("bg-aronium-" + props.color);
    const borderColor = ref("border-aronium-" + props.color);

    return { bgColor, borderColor };
  },
};
</script>
