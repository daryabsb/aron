<template>
  <div
    class="bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg min-w-48"
  >
    <!-- :class="{
            hidden: !dropdownPopoverShow,
            block: dropdownPopoverShow,
          }" -->
    <a
      href="javascript:void(0);"
      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
    >
      Action
    </a>
    <a
      href="javascript:void(0);"
      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
    >
      Another action
    </a>

    <div class="h-0 my-2 border border-solid border-slate-100" />
    <a
      href="http://127.0.0.1:8000/logout/"
      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
    >
      Logout
    </a>
    <a
      class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-slate-700"
      @click="$emit('close')"
      >Close</a
    >
  </div>
</template>
<script>
export default {
  emits: ["close"],
  setup(props, context) {},
};
</script>
