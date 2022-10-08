<template>
  <div
    class="fixed flex items-center min-h-screen w-screen bg-opacity-50 text-aronium-white bg-aronium-900 z-10"
  >
    <!-- :class="{
            hidden: !dropdownPopoverShow,
            block: dropdownPopoverShow,
          }" -->

    <div
      class="flex items-center justify-center h-96 w-screen bg-aronium-900 z-30 opacity-100"
    >
      <div
        class="h-full text-center w-96 bg-transparent text-aronium-white py-24 mx-3"
      >
        <h1 class="text-3xl textaronium-white">THIS IS CASH MODAL</h1>
      </div>
      <div
        class="h-full text-center w-96 bg-transparent text-aronium-white mx-3"
      >
        <a
          href="javascript:void(0);"
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
        >
          Action
        </a>
        <a
          href="javascript:void(0);"
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
        >
          Another action
        </a>

        <div class="h-0 my-2 border border-solid" />
        <a
          href="http://127.0.0.1:8000/logout/"
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
        >
          Logout
        </a>
        <a
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent cursor-pointer"
          @click="$emit('close')"
          >Close</a
        >
      </div>
      <div
        class="h-full text-center w-96 bg-transparent text-aronium-white mx-3"
      >
        <a
          href="javascript:void(0);"
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
        >
          Action
        </a>
        <a
          href="javascript:void(0);"
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
        >
          Another action
        </a>

        <div class="h-0 my-2 border border-solid" />
        <a
          href="http://127.0.0.1:8000/logout/"
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
        >
          Logout
        </a>
        <a
          class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent cursor-pointer"
          @click="$emit('close')"
          >Close</a
        >
      </div>
    </div>
  </div>
</template>
<script>
export default {
  emits: ["close"],
  setup(props, context) {},
};
</script>
