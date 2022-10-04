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
          <div class="h-24 grid grid-rows-3 grid-cols-1 relative">
            <div
              class="h-12 px-4 -m-2 row-span-1 col-start-1 col-span-1"
              :class="
                [4, 5, 6].includes(tabNum) ? 'row-start-3' : 'row-start-1'
              "
            >
              <ul
                id="tabs-tab"
                class="border-b border-pink-500 flex flex-row justify-between flex-wrap list-none pl-0"
              >
                <li v-for="tab in tabsTitles.second" :key="tab.id">
                  <a
                    id="tabs-home-tab"
                    class="block font-light border-b-2 border-transparent px-4 py-1 hover:border-transparent hover:bg-zinc-500 focus:border-transparent"
                    :class="[
                      tabNum === tab.id
                        ? 'bg-pink-500 active'
                        : 'border-none hover:cursor-pointer',
                      tab.disabled ? 'disabled' : '',
                    ]"
                    @click="currentTab(tab.id)"
                    >{{ tab.title }}</a
                  >
                </li>
              </ul>
            </div>
            <div class="h-3 m-1"></div>
            <div
              class="h-12 px-4 -m-2 row-span-1 col-start-1 col-span-1"
              :class="
                [1, 2, 3].includes(tabNum) ? 'row-start-3' : 'row-start-1'
              "
            >
              <ul
                id="tabs-second-row"
                class="border-b border-pink-500 flex flex-row justify-between flex-wrap list-none pl-0"
              >
                <li v-for="tab in tabsTitles.first" :key="tab.id">
                  <a
                    id="tabs-home-tab"
                    href="#tabs-home"
                    class="block font-light border-b-2 border-transparent px-4 py-1 hover:border-transparent hover:bg-zinc-500 focus:border-transparent"
                    :class="[
                      tabNum === tab.id
                        ? 'bg-pink-500 active'
                        : 'border-none  hover:cursor-pointer',
                      tab.disabled ? 'disabled' : '',
                    ]"
                    @click="currentTab(tab.id)"
                    >{{ tab.title }}</a
                  >
                </li>
              </ul>
            </div>
          </div>

          <div id="tabs-tabContent" class="tab-content">
            <products-details-form v-if="tabNum === 1"></products-details-form>
            <products-prices-and-taxes-form
              v-if="tabNum === 2"
            ></products-prices-and-taxes-form>
            <products-stock-control-form
              v-if="tabNum === 3"
            ></products-stock-control-form>
            <products-comments-form
              v-if="tabNum === 4"
            ></products-comments-form>
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
import { ref, onMounted } from "vue";
import useGetProductGroups from "@/composables/useGetProductGroups";
import {
  addNewProductGroup,
  useFetchCustomersDispatch,
  useCustomers,
} from "@/store/composables";

// COMPOSABLES
import { productsCreateTabsTitles as tabsTitles } from "@/composables/staticData";

import ModalSmall from "@/components/shared/ModalSmall.vue";
import TextInput from "@/components/shared/forms/TextInput.vue";
import ToggleInput from "../shared/forms/ToggleInput.vue";
import SelectInput from "../shared/forms/SelectInput.vue";

// PRODUCTS FORMS
import ProductsDetailsForm from "@/components/modals/products/ProductsDetailsForm.vue";
import ProductsPricesAndTaxesForm from "@/components/modals/products/ProductsPricesAndTaxesForm.vue";
import ProductsStockControlForm from "@/components/modals/products/ProductsStockControlForm.vue";
import ProductsCommentsForm from "@/components/modals/products/ProductsCommentsForm.vue";

export default {
  components: {
    ModalSmall,
    TextInput,
    ToggleInput,
    SelectInput,
    ProductsDetailsForm,
    ProductsPricesAndTaxesForm,
    ProductsStockControlForm,
    ProductsCommentsForm,
  },
  props: {},
  setup(props, { emit }) {
    // FOR PRODUCT FORM =>
    onMounted(useFetchCustomersDispatch);

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
      useCustomers,
      useGetProductGroups,

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
