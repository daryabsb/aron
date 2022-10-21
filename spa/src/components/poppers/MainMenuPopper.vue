<template>
  <div>
    <Popper arrow>
      <a class="text-aronium-white block" href="#pablo">
        <div class="items-center flex">
          <span
            class="w-10 h-10 text-sm text-aronium-white inline-flex items-center justify-center"
          >
            <button class="ml-6 text-2xl">
              <i class="fa fa-bars"></i>
            </button>
          </span>
        </div>
      </a>
      <template #content="{ close }">
        <Transition mode="out-in">
          <div
            class="bg-aronium-800 border-y border-l -m-16 pl-6 pr-20 border-aronium-500 text-base z-50 float-left py-6 list-none text-left rounded shadow-lg h-[90vh] w-96"
          >
            <div class="h-fit w-full pr-2 mb-6">
              <div class="flex justify-between w-full text-aronium-white py-6">
                <span>
                  <h1>POS1 - Darya Ibrahim</h1>
                </span>
                <!-- @click="close" -->
                <span class="cursor-pointer" @click="close"
                  ><i class="fa fa-arrow-right"></i
                ></span>
              </div>
            </div>
            <div class="flex flex-col justify-between h-[75vh]">
              <ul class="my-6">
                <li>
                  <router-link v-slot="{ href, navigate }" to="/management">
                    <a
                      :href="href"
                      class="text-sm py-2 font-normal block"
                      @click="navigate"
                    >
                      <!-- class="fas fa-tv mr-2 text-sm" -->
                      <i class="fa fa-screwdriver-wrench fa-lg"></i>
                      Management
                    </a>
                  </router-link>

                  <hr />
                </li>
                <li>
                  <router-link v-slot="{ href, navigate }" to="/playground">
                    <a
                      :href="href"
                      class="text-sm py-2 font-normal block"
                      @click="navigate"
                    >
                      <!-- class="fas fa-tv mr-2 text-sm" -->
                      <i class="fa fa-screwdriver-wrench fa-lg"></i>
                      Playground
                    </a>
                  </router-link>

                  <hr />
                </li>
                <li>
                  <a
                    href="javascript:void(0);"
                    class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                  >
                    Action
                  </a>
                </li>
                <li>
                  <a
                    href="javascript:void(0);"
                    class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                  >
                    Another action
                  </a>
                </li>
                <li>
                  <div class="h-0 my-2 border border-solid border-slate-100" />
                </li>
                <li>
                  <a
                    href="http://127.0.0.1:8000/logout/"
                    class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                  >
                    Logout
                  </a>
                </li>
                <li class="cursor-pointer" @click="close">
                  <a
                    class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent"
                    >Close</a
                  >
                </li>
              </ul>

              <div
                class="flex justify-around pr-16 border-t border-aronium-500 py-4 w-full text-aronium-white gap-x-3 text-2xl font-light"
              >
                <button><i class="fa-regular fa-sliders-up"></i></button>
                <button><i class="fa fa-sliders"></i></button>
                <button><i class="fa fa-arrows"></i></button>
                <button><i class="fa fa-power-off"></i></button>
              </div>
            </div>
          </div>
        </Transition>
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
