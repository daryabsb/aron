<template>
  <div
    class="relative flex flex-col text-white h-full w-full bg-zinc-800 placeholder-zinc-800"
  >
    <div class="text-center flex justify-between">
      <div class="flex flex-nowrap pb-3">
        <span class="text-xs p-3 border border-zinc-500">
          <i class="fa fa-barcode"></i>
        </span>
        <span class="text-xs p-3 border border-zinc-500">
          123
        </span>
        <span class="text-xs p-3 border border-zinc-500">
          <i class="fa fa-tags"></i>
        </span>
        <label class="relative block">
          <span class="sr-only">Search</span>
          <span class="absolute inset-y-0 left-0 flex items-center pl-2">
            <svg class="h-5 w-5 fill-zinc-300" viewBox="0 0 20 20">
              <path
                fill-rule="evenodd"
                d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                clip-rule="evenodd"
              ></path>
            </svg>
          </span>
          <input
            class="placeholder:italic placeholder:text-zinc-300 block border bg-zinc-800 border-zinc-500 w-96 pl-9 p-3 focus:outline-none focus:ring-1 sm:text-sm"
            placeholder="Search for anything..."
            type="text"
            name="search"
          />
        </label>
      </div>
      <div class="flex flex-auto pb-3">
        <span
          class="text-sm w-full ml-auto text-right p-3 border border-zinc-500"
          >Product count: {{ tableData.length }}</span
        >
      </div>
    </div>

    <div class="flex-auto">
      <!-- TABLE -->
      <div class="flex flex-nowrap border border-zinc-500 mb-6">
        <table class="table-auto w-full text-center border-zinc-500">
          <thead>
            <tr>
              <th
                class="relative border border-zinc-500"
                style="resize: horizontal;"
              >
                ID
              </th>
              <th class="border border-zinc-500">Name</th>
              <th class="border border-zinc-500">Group</th>
              <th class="border border-zinc-500">Barcode</th>
              <th class="border border-zinc-500">Cost</th>
              <th class="border border-zinc-500">Sale Price</th>
              <th class="border border-zinc-500">Taxes</th>
              <th class="border border-zinc-500">After Tax Price</th>
              <th class="border border-zinc-500">Active</th>
              <th class="border border-zinc-500">Unit</th>
              <th class="border border-zinc-500">Created</th>
              <th class="border border-zinc-500">Updated</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="product in tableData" :key="product.id">
              <!-- class="bg-zinc-400 focus:bg-zinc-300" -->
              <td class="border border-zinc-500">
                <span class="px-3">{{ product.id }}</span>
              </td>
              <td class="border border-zinc-500">{{ product.name }}</td>
              <td class="border border-zinc-500">{{ product.group }}</td>
              <td class="border border-zinc-500">{{ product.barcode }}</td>
              <td class="border border-zinc-500">{{ product.cost }}</td>
              <td class="border border-zinc-500">{{ product.salePrice }}</td>
              <td class="border border-zinc-500">{{ product.taxes }}</td>
              <td class="border border-zinc-500">
                {{ product.afterTaxPrice }}
              </td>
              <td class="border border-zinc-500">{{ product.active }}</td>
              <td class="border border-zinc-500">{{ product.unit }}</td>
              <td class="border border-zinc-500">{{ product.created }}</td>
              <td class="border border-zinc-500">{{ product.updated }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- END TABLE -->
    </div>
  </div>
</template>
<script>
import { ref } from "vue";

export default {
  components: {},
  setup() {
    const tableData = [
      {
        id: 1,
        name: "Zhian Water",
        group: "Groceries",
        barcode: "2209042230309",
        cost: "1800 IQD",
        salePrice: "1850 IQD",
        taxes: "",
        afterTaxPrice: "1850 IQD",
        active: true,
        unit: "bottle",
        created: "14/9/2022",
        updated: "28/9/2022",
      },
    ];

    return {
      tableData,
    };
  },
};
</script>
