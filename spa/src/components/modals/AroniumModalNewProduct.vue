<template>
  <modal-small>
    <template #modal-content>
      <div
        class="glass absolute top-0 right-0 w-1/4 h-screen py-12 items-start text-zinc-100 p-8 z-50 border border-aronium-600 bg-aronium-800 shadow-2xl"
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
          <div class="relative">
            <ul
              id="tabs-tab"
              class="border-b border-pink-500 nav nav-tabs flex flex-col md:flex-row justify-between flex-wrap list-none pl-0 my-2"
              role="tablist"
            >
              <li
                v-for="tab in tabsTitles.second"
                :key="tab.id"
                class="nav-item"
                role="presentation"
              >
                <a
                  id="tabs-home-tab"
                  href="#tabs-home"
                  class="nav-link block font-light leading-tight border-x-0 border-t-0 border-b-2 border-transparent px-4 py-1 hover:border-transparent hover:bg-zinc-500 focus:border-transparent"
                  :class="[
                    tabNum === tab.id ? 'bg-pink-500 active' : 'border-none',
                    tab.disabled ? 'disabled' : '',
                  ]"
                  @click="currentTab(tab.id)"
                  >{{ tab.title }}</a
                >
              </li>
            </ul>
            <ul
              id="tabs-second-row"
              class="border-b border-pink-500 nav nav-tabs flex flex-col md:flex-row justify-between flex-wrap list-none pl-0"
              role="tablist"
            >
              <li
                v-for="tab in tabsTitles.first"
                :key="tab.id"
                class="nav-item"
                role="presentation"
              >
                <a
                  id="tabs-home-tab"
                  href="#tabs-home"
                  class="nav-link block font-light leading-tight border-x-0 border-t-0 border-b-2 border-transparent px-4 py-1 hover:border-transparent hover:bg-zinc-500 focus:border-transparent"
                  :class="[
                    tabNum === tab.id ? 'bg-pink-500 active' : 'border-none',
                    tab.disabled ? 'disabled' : '',
                  ]"
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
                    <div class="w-96">
                      <text-input
                        type="text"
                        placeholder="Product name"
                        label="Name"
                        required
                      ></text-input>
                    </div>
                    <div class="w-32">
                      <text-input
                        type="text"
                        placeholder="Internal code"
                        label="Code"
                      ></text-input>
                    </div>

                    <text-input
                      type="text"
                      placeholder="Barcode"
                      label="Barcode"
                    >
                      <template #validation>
                        <p class="cursor-pointer" @click="generateBarcode">
                          Generate barcode
                        </p>
                      </template>
                    </text-input>
                    <div class="w-48">
                      <text-input
                        type="text"
                        placeholder="Unit"
                        label="Unit of measurement"
                      ></text-input>
                    </div>
                  </div>
                  <!-- END SECTION 1 CREATE PRODUCT -->
                  <hr class="mt-6 border-b-1 border-zinc-600" />
                  <div class="mb-2">
                    <toggle-input
                      target="active"
                      label="Active"
                      checked
                    ></toggle-input>
                  </div>
                  <div class="mb-2">
                    <toggle-input
                      target="default-uantity"
                      label="Default quantity"
                    ></toggle-input>
                  </div>
                  <div class="mb-2">
                    <toggle-input
                      target="service"
                      label="Service (not using stock)"
                    ></toggle-input>
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
              <div class="py-3">
                <form>
                  <div class="flex flex-col">
                    <div class="flex items-center w-48">
                      <text-input
                        type="text"
                        placeholder="Add tax to product"
                        label="Taxes"
                      ></text-input>
                      <span class="text-lg pr-3">
                        <i class="fa fa-circle-question"></i>
                      </span>
                    </div>
                    <div class="w-32">
                      <text-input
                        type="text"
                        placeholder="Cost"
                        label="Cost"
                      ></text-input>
                    </div>
                    <div class="flex items-center w-32">
                      <text-input
                        type="text"
                        placeholder="Markup"
                        label="Markup"
                      >
                      </text-input
                      >%
                    </div>
                    <div class="w-48">
                      <text-input
                        type="text"
                        placeholder="Sale price"
                        label="Sale price"
                      ></text-input>
                    </div>
                  </div>
                  <!-- END SECTION 1 CREATE PRODUCT -->
                  <hr class="mt-6 border-b-1 border-zinc-600" />
                  <div class="mb-2">
                    <toggle-input
                      target="pit"
                      label="Price includes tax"
                    ></toggle-input>
                  </div>
                  <div class="mb-2">
                    <toggle-input
                      target="pca"
                      label="Price change allowed"
                    ></toggle-input>
                  </div>
                </form>
              </div>
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
        <div
          class="flex flex-nowrap justify-round absolute items-center bottom-3 right-4"
        >
          <button
            class="w-36 text-center border border-aronium-600 font-light mr-2 flex bg-inherit text-white focus:outline-none hover:bg-aronium-sky hover:border-aronium-sky px-6 py-2"
            @click="startWithSampleData()"
          >
            <span class="mr-3">
              <i class="fa fa-check"></i>
            </span>
            Save
          </button>
          <button
            class="w-36 text-center border border-aronium-600 font-light mr-2 flex bg-inherit text-white focus:outline-none hover:bg-aronium-sky hover:border-aronium-sky px-6 py-2"
            @click="startBlank()"
          >
            <span class="pr-3">
              <i class="fa fa-xmark"></i>
            </span>
            Cancel
          </button>
        </div>
      </div>
    </template>
  </modal-small>
</template>

<script>
import { ref } from "vue";
import useGetProductGroups from "@/composables/useGetProductGroups";
import { addNewProductGroup } from "@/store/composables";

import ModalSmall from "@/components/shared/ModalSmall.vue";
import TextInput from "@/components/shared/forms/TextInput.vue";
import ToggleInput from "../shared/forms/ToggleInput.vue";

export default {
  components: {
    ModalSmall,
    TextInput,
    ToggleInput,
  },
  props: {},
  setup(props, { emit }) {
    // FOR PRODUCT FORM =>

    const tabsTitles = ref({
      first: [
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
          title: "Stock control",
          disabled: false,
        },
      ],
      second: [
        {
          id: 4,
          title: "Print stations",
          disabled: true,
        },
        {
          id: 5,
          title: "Comments",
          disabled: true,
        },
        {
          id: 6,
          title: "Image & color",
          disabled: true,
        },
      ],
    });
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

    const barcode = ref("");

    const generateBarcode = () => {
      barcode.value = "0101234567890128TEC-IT";
    };

    return {
      // PRODUCT FORM RETURNS
      isActive,
      tabNum,
      tabsTitles,
      currentTab,
      barcode,
      generateBarcode,

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
