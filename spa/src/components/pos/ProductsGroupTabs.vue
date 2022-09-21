<template>
  <!-- CATEGORY TABS START -->

  <div
    class="text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700"
  >
    <ul class="flex flex-wrap -mb-px">
      <li class="mr-2">
        <a
          href="#"
          class="inline-block p-4 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300"
          >All Products</a
        >
      </li>
      <li class="mr-2">
        <a
          href="#"
          class="inline-block p-4 text-blue-600 rounded-t-lg border-b-2 border-blue-600 active dark:text-blue-500 dark:border-blue-500"
          aria-current="page"
          >Groceries</a
        >
      </li>
      <li class="mr-2">
        <a
          href="#"
          class="inline-block p-4 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300"
          >Kitchen</a
        >
      </li>
      <li class="mr-2">
        <a
          href="#"
          class="inline-block p-4 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300"
          >Stationaries</a
        >
      </li>
      <li>
        <a
          class="inline-block p-4 text-gray-400 rounded-t-lg cursor-not-allowed dark:text-gray-500"
          >Sweets</a
        >
      </li>
    </ul>
  </div>

  <!-- <div id="tabs-tabContent" class="tab-content">
    <div
      id="tabs-home"
      class="tab-pane fade show active"
      role="tabpanel"
      aria-labelledby="tabs-home-tab"
    >
      Tab 1 content
    </div>
    <div
      id="tabs-profile"
      class="tab-pane fade"
      role="tabpanel"
      aria-labelledby="tabs-profile-tab"
    >
      Tab 2 content
    </div>
    <div
      id="tabs-messages"
      class="tab-pane fade"
      role="tabpanel"
      aria-labelledby="tabs-profile-tab"
    >
      Tab 3 content
    </div>
    <div
      id="tabs-contact"
      class="tab-pane fade"
      role="tabpanel"
      aria-labelledby="tabs-contact-tab"
    >
      Tab 4 content
    </div>
  </div> -->

  <!-- CATEGORY TABS END -->
</template>

<script>
export default {
  name: "ProductsGroupTabs",
  setup() {},
};
</script>
