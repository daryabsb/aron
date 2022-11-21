<template>
  <div class="relative h-16 flex justify-center items-center px-5 rounded-sm bg-gray-800">
    <div class="flex justify-between overflow-hidden text-right">
      <span v-if="!error" class="float-right whitespace-pre pr-5" data-test="text">
        {{ text }}
        <span class="ml-1">{{ symbol }} </span>
      </span>
      <span v-else class="float-right whitespace-nowrap text-red-400 pr-5" data-test="error">
        Invalid expression
      </span>
    </div>

    <i class="w-4 absolute bottom-5 right-5 border-b-4 bg-white animate-pulse"></i>
  </div>
</template>

<script>
// import LinkToRepository from "./LinkToRepository.vue";
export default {
  name: "Screen",
  // components: { LinkToRepository },
  props: {
    text: { type: String, default: "" },
    error: { type: Boolean, default: false },
    symbol: { type: String, default: "" }
  },
};
</script>
