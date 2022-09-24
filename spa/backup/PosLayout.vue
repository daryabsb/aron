<template>
  <div class="bg-blue-gray-50">
    <!-- noprint-area -->
    <div
      class="hide-print flex flex-row h-screen antialiased text-blue-gray-800"
    >
      <!-- left sidebar -->
      <pos-left-nav></pos-left-nav>

      <!-- page content -->
      <div class="flex-grow flex">
        <!-- store menu -->
        <store-menu></store-menu>
        <!-- end of store menu -->

        <!-- right sidebar -->
        <pos-right-nav></pos-right-nav>
        <!-- end of right sidebar -->
      </div>

      <!-- modal first time -->
      <modal-first-time></modal-first-time>

      <!-- modal receipt -->
      <modal-receipt></modal-receipt>
    <!-- end of noprint-area -->

    <div id="print-area" class="print-area">
      <h1>Darya</h1>
    </div>
  </div>

  <!-- PAGE START OVER END -->
</template>

