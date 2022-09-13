<template>
  <div>
    <Popper arrow>
      <a class="text-blueGray-500 block" href="#pablo">
        <div class="items-center flex">
          <span
            class="w-12 h-12 text-sm text-white bg-blueGray-200 inline-flex items-center justify-center rounded-full"
          >
            <img
              v-if="user && user.image"
              alt="..."
              class="w-full rounded-full align-middle border-none shadow-lg"
              :src="user.image"
            />
          </span>
        </div>
      </a>
      <template #content="{ close }">
        <div
          class="bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg min-w-48"
        >
          <!-- :class="{
            hidden: !dropdownPopoverShow,
            block: dropdownPopoverShow,
          }" -->
          <a
            href="javascript:void(0);"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
          >
            Action
          </a>
          <a
            href="javascript:void(0);"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
          >
            Another action
          </a>

          <div class="h-0 my-2 border border-solid border-blueGray-100" />
          <a
            href="http://127.0.0.1:8000/logout/"
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
          >
            Logout
          </a>
          <a
            class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
            @click="close"
            >Close</a
          >
        </div>
      </template>
    </Popper>
    <!-- <Popper v-bind="$attrs" hover openDelay="200" closeDelay="100"> -->
  </div>
</template>

<script>
import useGetUser from "@/composables/useGetUser";

// import Popper from "vue3-popper";

// import image from "@/assets/img/team-1-800x800.jpg";

export default {
  components: {
    // Popper,
  },
  setup() {
    const user = useGetUser();

    return {
      user,
    };
  },
};
</script>
