<template>
  <modal-small>
    <template #modal-content>
      <div
        class="absolute top-0 right-0 w-1/4 h-screen py-12 items-start text-zinc-100 p-8 z-50 bg-zinc-900 shadow-2xl"
      >
        <div class="text-left">
          <div class="flex flex-nowrap justify-between">
            <h3 class="text-lg mb-8">New Product</h3>
            <span>
              <i
                class="fa fa-arrow-right cursor-pointer text-white text-xl font-bold pr-6"
                @click="$emit('close')"
              ></i>
            </span>
          </div>

          <!-- TABS PRODUCT CREATE -->
          <div class="border-b border-pink-500">
            <ul
              class="nav nav-tabs flex flex-col md:flex-row flex-wrap list-none border-b-0 pl-0"
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
                  class="nav-link block font-light text-sm leading-tight border-x-0 border-t-0 border-b-2 border-transparent px-4 py-1 hover:border-transparent hover:bg-zinc-500 focus:border-transparent"
                  :class="[
                    tabNum === tab.id ? 'bg-pink-500 active' : 'border-none',
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
          </div>

          <div id="tabs-tabContent" class="tab-content">
            <div
              v-if="tabNum === 1"
              id="tabs-home"
              class="tab-pane fade show active"
              role="tabpanel"
              aria-labelledby="tabs-home-tab"
            >
              <div class="py-3">
                <form>
                  <div class="flex flex-col">
                    <div class="w-full px-4">
                      <div class="relative w-full mb-3">
                        <label
                          class="block text-sm mb-1"
                          htmlFor="grid-password"
                        >
                          Name
                        </label>
                        <input
                          type="text"
                          class="text-zinc-900 px-2 py-2 text-sm focus:border-2 focus:border-pink-500 w-full"
                          value="lucky.jesse"
                        />
                        <!-- class=" ease-linear transition-all duration-150" -->
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
  </modal-small>
</template>

<script>
import { ref } from "vue";
import useGetProductGroups from "@/composables/useGetProductGroups";
import ModalSmall from "@/components/shared/ModalSmall.vue";
import { addNewProductGroup } from "@/store/composables";

export default {
  components: {
    ModalSmall,
  },
  props: {},
  setup(props, { emit }) {
    // FOR PRODUCT FORM =>

    const tabsTitles = ref([
      {
        id: 1,
        title: "Details",
        disabled: false,
      },
      {
        id: 2,
        title: "Prices & tax",
        disabled: false,
      },
      {
        id: 3,
        title: "Comments",
        disabled: false,
      },
      {
        id: 4,
        title: "Image & color",
        disabled: true,
      },
    ]);
    const isActive = ref(false);
    const tabNum = ref(1);
    const currentTab = (tabNumber) => {
      tabNum.value = tabNumber;
    };

    // <= END FOR PRODUCT FORM

    const groupName = ref("");
    const parentId = ref(0);
    const groupMaps = ref([]);
    console.log("props.moduleNAme", props.model);
    const groupNames = Object.entries(useGetProductGroups.value).forEach(
      (group) => {
        // let el = {};
        // el.id = group[0];
        // el.name = group[1];

        groupMaps.value.push(group[1]);
      }
    );
    const onChange = (e) => console.log(e.target.value);

    const addNewGroup = () => {
      const data = {
        name: groupName.value,
        parent_group: parentId.value,
      };
      addNewProductGroup(data);
      emit("close");
    };

    return {
      // PRODUCT FORM RETURNS
      isActive,
      tabNum,
      tabsTitles,
      currentTab,

      // GROUP FORM RETURNS
      parentId,
      groupName,
      groupNames,
      addNewGroup,
      onChange,
    };
  },
};
</script>
