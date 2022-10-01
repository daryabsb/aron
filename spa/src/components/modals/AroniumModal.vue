<template>
  <modal-right>
    <template #modal-content>
      <div
        class="absolute top-0 right-0 w-1/4 h-screen py-12 items-start text-zinc-100 p-8 z-50 bg-zinc-900 shadow-2xl"
      >
        <div class="text-left">
          <div class="flex flex-nowrap">
            <span>
              <i
                class="fa fa-arrow-left cursor-pointer text-white text-xl font-bold pr-6"
                @click="$emit('close')"
              ></i>
            </span>
            <h3 class="text-lg mb-8">FIRST TIME?</h3>
          </div>

          <div class="p-6">
            <button
              class="bg-pink-500 text-white active:bg-zinc-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 ease-linear transition-all duration-150"
              type="button"
            >
              Settings
            </button>
          </div>
          <!-- TABS PRODUCT CREATE -->
          <ul
            class="nav nav-tabs flex flex-col md:flex-row flex-wrap list-none border-b-0 pl-0 mb-4"
            id="tabs-tab"
            role="tablist"
          >
            <li
              v-for="tab in tabsTitles"
              :key="tab.id"
              class="nav-item"
              role="presentation"
            >
              <a
                href="#tabs-home"
                class="nav-link block font-medium text-xs leading-tight uppercase border-x-0 border-t-0 border-b-2 border-transparent px-6 py-3 my-2 hover:border-transparent hover:bg-zinc-500 focus:border-transparent"
                :class="[
                  tabNum === tab.id
                    ? 'border-b border-pink-700 active'
                    : 'border-none',
                  tab.disabled ? 'disabled' : '',
                ]"
                id="tabs-home-tab"
                data-bs-toggle="pill"
                data-bs-target="#tabs-home"
                role="tab"
                aria-selected="true"
                @click="currentTab(tab.id)"
                >{{ tab.title }}</a
              >
            </li>
          </ul>
          <div class="tab-content" id="tabs-tabContent">
            <div
              v-if="tabNum === 1"
              class="tab-pane fade show active"
              id="tabs-home"
              role="tabpanel"
              aria-labelledby="tabs-home-tab"
            >
              <div class="py-3">
                <form>
                  <h6 class="text-sm mt-3 mb-6 font-bold uppercase">
                    User Information
                  </h6>
                  <div class="flex flex-wrap">
                    <div class="w-full lg:w-6/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          Username
                        </label>
                        <input
                          type="text"
                          class="text-zinc-900 border-0 px-3 py-2 text-sm focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="lucky.jesse"
                        />
                      </div>
                    </div>
                    <div class="w-full lg:w-6/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          Email address
                        </label>
                        <input
                          type="email"
                          class="text-zinc-900 border-0 px-3 py-2 bg-white text-sm focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="jesse@example.com"
                        />
                      </div>
                    </div>
                    <div class="w-full lg:w-6/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          First Name
                        </label>
                        <input
                          type="text"
                          class="text-zinc-900 border-0 px-3 py-2 bg-white text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="Lucky"
                        />
                      </div>
                    </div>
                    <div class="w-full lg:w-6/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          Last Name
                        </label>
                        <input
                          type="text"
                          class="text-zinc-900 border-0 px-3 py-2 bg-white text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="Jesse"
                        />
                      </div>
                    </div>
                  </div>
                  <!-- END SECTION 1 CREATE PRODUCT -->
                  <hr class="mt-6 border-b-1 border-zinc-600" />

                  <h6 class="text-sm mt-3 mb-6 uppercase">
                    Contact Information
                  </h6>
                  <div class="flex flex-wrap">
                    <div class="w-full lg:w-12/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          Address
                        </label>
                        <input
                          type="text"
                          class="text-zinc-900 border-0 px-3 py-2 bg-white text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09"
                        />
                      </div>
                    </div>
                    <div class="w-full lg:w-4/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          City
                        </label>
                        <input
                          type="email"
                          class="text-zinc-900 border-0 px-3 py-2 bg-white text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="New York"
                        />
                      </div>
                    </div>
                    <div class="w-full lg:w-4/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          Country
                        </label>
                        <input
                          type="text"
                          class="text-zinc-900 border-0 px-3 py-2 bg-white text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="United States"
                        />
                      </div>
                    </div>
                    <div class="w-full lg:w-4/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          Postal Code
                        </label>
                        <input
                          type="text"
                          class="text-zinc-900 border-0 px-3 py-2 bg-white text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          value="Postal Code"
                        />
                      </div>
                    </div>
                  </div>

                  <hr class="mt-6 border-b-1 border-blueGray-300" />

                  <h6 class="text-sm mt-3 mb-6 uppercase">
                    About Me
                  </h6>
                  <div class="flex flex-wrap">
                    <div class="w-full lg:w-12/12 px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block uppercase text-xs mb-2"
                          htmlFor="grid-password"
                        >
                          About me
                        </label>
                        <textarea
                          type="text"
                          class="border-0 px-3 py-2 bg-white text-sm focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                          rows="4"
                        >
                    A beautiful UI Kit and Admin for VueJS & Tailwind CSS. It is Free
                    and Open Source.
                  </textarea
                        >
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <div
              v-if="tabNum === 2"
              class="tab-pane fade"
              id="tabs-profile"
              role="tabpanel"
              aria-labelledby="tabs-profile-tab"
            >
              Tab 2 content
            </div>
            <div
              v-if="tabNum === 3"
              class="tab-pane fade"
              id="tabs-messages"
              role="tabpanel"
              aria-labelledby="tabs-profile-tab"
            >
              Tab 3 content
            </div>
            <div
              v-if="tabNum === 4"
              class="tab-pane fade"
              id="tabs-contact"
              role="tabpanel"
              aria-labelledby="tabs-contact-tab"
            >
              Tab 4 content
            </div>
          </div>
          <!-- END TABS PRODUCT CREATE -->
        </div>
        <div class="text-left">
          <button
            class="text-left w-full mb-3 rounded-xl bg-blue-gray-500 text-white focus:outline-none hover:bg-cyan-400 px-4 py-4"
            @click="startWithSampleData()"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6 inline-block -mt-1 mr-2"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M8 4H6a2 2 0 00-2 2v12a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-2m-4-1v8m0 0l3-3m-3 3L9 8m-5 5h2.586a1 1 0 01.707.293l2.414 2.414a1 1 0 00.707.293h3.172a1 1 0 00.707-.293l2.414-2.414a1 1 0 01.707-.293H20"
              />
            </svg>
            LOAD SAMPLE DATA
          </button>
          <button
            class="text-left w-full rounded-xl bg-blue-gray-500 text-white focus:outline-none hover:bg-teal-400 px-4 py-4"
            @click="startBlank()"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6 inline-block -mt-1 mr-2"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"
              />
            </svg>
            LEAVE IT EMPTY
          </button>
        </div>
      </div>
    </template>
  </modal-right>
</template>
<script>
import { ref } from "vue";
import ModalRight from "@/components/shared/ModalSmall.vue";
export default {
  components: {
    ModalRight,
  },
  emits: ["close"],
  setup() {
    const tabsTitles = ref([
      {
        id: 1,
        title: "Initial",
        disabled: false,
      },
      {
        id: 2,
        title: "Prices",
        disabled: false,
      },
      {
        id: 3,
        title: "Photos",
        disabled: false,
      },
      {
        id: 4,
        title: "More...",
        disabled: true,
      },
    ]);
    const isActive = ref(false);
    const tabNum = ref(1);
    const currentTab = (tabNumber) => {
      tabNum.value = tabNumber;
    };
    return { isActive, tabNum, tabsTitles, currentTab };
  },
};
</script>
