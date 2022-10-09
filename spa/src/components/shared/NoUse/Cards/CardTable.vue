<template>
  <div
    class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded"
    :class="[color === 'light' ? 'bg-white' : 'bg-slate-900 text-white']"
  >
    <div class="rounded-t mb-0 px-4 py-3 border-0">
      <div class="flex flex-wrap items-center">
        <div class="relative w-full px-4 max-w-full flex-grow flex-1">
          <h3
            class="font-semibold text-lg uppercase"
            :class="[color === 'light' ? 'text-slate-700' : 'text-white']"
          >
            <!-- Search Input -->
            <div class="relative flex flex-wrap mb-3">
              <div class="flex lg:flex-wrap items-center lg:mx-12">
                <ul class="flex flex-col lg:flex-row list-none ml-auto">
                  <li class="nav-item">
                    <span
                      class="px-3 py-2 flex items-center text-xl uppercase font-bold leading-snug hover:opacity-75"
                    >
                      <i class="fas fa-barcode"></i>
                    </span>
                  </li>
                  <li>
                    <span
                      class="px-3 py-2 flex items-center text-xl uppercase font-bold leading-snug hover:opacity-75"
                    >
                      <i class="fas fa-tag"></i>
                    </span>
                  </li>
                  <li>
                    <span
                      class="px-3 py-2 flex items-center text-xl uppercase font-bold leading-snug hover:opacity-75"
                    >
                      <i class="fa fa-list"></i>
                    </span>
                  </li>
                </ul>
              </div>

              <div
                class="relative flex w-full sm:w-8/12 md:w-8/12 py-2 px-4 flex-wrap items-stretch lg:ml-auto"
              >
                <div class="flex">
                  <span
                    class="absolute leading-snug flex text-center white-space-no-wrap rounded-full text-sm items-center rounded-r-none p-3 text-slate-800 border-r-0 placeholder-slate-300"
                  >
                    <i class="fas fa-search"></i>
                  </span>
                </div>
                <Popper>
                  <input
                    type="text"
                    class="relative px-12 py-2 h-8 border border-solid border-slate-600 rounded-full text-lg leading-snug text-slate-600 bg-white shadow-none outline-none focus:outline-none focus:border-sky-600 w-full font-normal rounded-l-none flex-1 border-l-0 placeholder-emerald-300"
                    placeholder="Search Products"
                  />
                  <template #content="{close}">
                    <ul class="w-full bg-white">
                      <li
                        v-for="product in products"
                        :key="product.id"
                        class="cursor-pointer font-normal leading-normal p-2 mr-3 pr-auto w-full text-md text-slate-600 list-none"
                        @click="addProductToOrder(product)"
                      >
                        <span @click="close">{{ product.name }} </span>
                      </li>
                    </ul>
                  </template>
                </Popper>
              </div>
            </div>
            <!-- End search input -->
          </h3>
        </div>
      </div>
    </div>
    <div class="block w-full overflow-x-auto">
      <!-- Projects table -->
      <table class="items-center w-full bg-transparent border-collapse">
        <thead>
          <tr>
            <th
              class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
              :class="[
                color === 'light'
                  ? 'bg-slate-50 text-slate-500 border-slate-100'
                  : 'bg-emerald-800 text-emerald-300 border-emerald-700',
              ]"
            >
              Product Name
            </th>
            <th
              class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
              :class="[
                color === 'light'
                  ? 'bg-slate-50 text-slate-500 border-slate-100'
                  : 'bg-emerald-800 text-emerald-300 border-emerald-700',
              ]"
            >
              Price
            </th>
            <th
              class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
              :class="[
                color === 'light'
                  ? 'bg-slate-50 text-slate-500 border-slate-100'
                  : 'bg-emerald-800 text-emerald-300 border-emerald-700',
              ]"
            >
              Quantity
            </th>

            <th
              class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
              :class="[
                color === 'light'
                  ? 'bg-slate-50 text-slate-500 border-slate-100'
                  : 'bg-emerald-800 text-emerald-300 border-emerald-700',
              ]"
            >
              Completion
            </th>
            <th
              class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
              :class="[
                color === 'light'
                  ? 'bg-slate-50 text-slate-500 border-slate-100'
                  : 'bg-emerald-800 text-emerald-300 border-emerald-700',
              ]"
            ></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in orderItems" :key="item.id">
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="item.product.image"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[color === 'light' ? 'text-slate-600' : 'text-white']"
              >
                {{ item.product.name }}
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              {{ item.product.price }} IQD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <!-- Small Input -->
              <div class="relative flex w-full flex-wrap items-stretch mb-3">
                <span
                  class="z-10 h-full leading-snug font-normal absolute text-center text-blueGray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-2 py-1"
                >
                  <i class="fas fa-weight-scale"></i>
                </span>
                <input
                  v-model="quantity"
                  type="number"
                  class="px-2 py-1 placeholder-blueGray-300 text-blueGray-600 relative bg-white bg-white rounded text-sm border border-blueGray-300 outline-none focus:outline-none focus:shadow-outline w-full pl-10"
                />
              </div>
            </td>

            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">60%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-red-200"
                  >
                    <div
                      style="width: 60%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-red-500"
                    ></div>
                  </div>
                </div>
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-right"
            >
              <table-dropdown />
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script>
import { reactive } from "vue";
import useGetProducts from "@/composables/useGetProducts";
import TableDropdown from "@/components/Dropdowns/TableDropdown.vue";

export default {
  components: {
    TableDropdown,
  },
  props: {
    color: {
      default: "light",
      validator: function (value) {
        // The value must match one of these strings
        return ["light", "dark"].indexOf(value) !== -1;
      },
    },
  },
  setup() {
    const products = useGetProducts();
    const orderItems = reactive([]);
    const quantity = 1;
    const productsPopper = ["Darya", "Sakar", "Zane", "Nare"];
    const isDiscount = false;
    const discount = 0;
    const discountType = 0;
    const isDiscountType = false;

    const addProductToOrder = (product) => {
      const orderItem = {
        product: product,
        quantity: quantity,
        discount: isDiscount ? discount : 0,
        discount_type: isDiscountType ? discountType : 0,
        comment: "",
      };
      orderItems.value.push(orderItem);
      console.log(orderItems.value);
    };

    return {
      products,
      orderItems,
      quantity,
      productsPopper,
      addProductToOrder,
    };
  },
};
</script>
