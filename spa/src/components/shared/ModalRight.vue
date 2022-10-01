<template>
  <!-- modal first time -->
  <div
    class="relative w-screen h-screen left-0 top-0 z-50 flex flex-wrap justify-right content-right p-24 bg-zinc-900"
  >
    <slot name="modal-group"></slot>
    <slot name="modal-content"></slot>
  </div>
</template>
