<template>
  <div
    class="relative flex flex-col mr-3 text-aronium-white h-full w-full border border-aronium-600 bg-aronium-900 placeholder-zinc-800"
  >
    <div class="text-center flex justify-between h-10">
      <div class="flex flex-nowrap">
        <span class="text-xs h-10 pt-3 px-3 border-r border-aronium-600">
          <i class="fa fa-barcode"></i>
        </span>
        <span class="text-xs h-10 pt-3 px-3 border-r border-aronium-600">
          123
        </span>
        <span class="text-xs h-10 pt-3 px-3 border-r border-aronium-600">
          <i class="fa fa-tags"></i>
        </span>
        <label class="relative block">
          <span class="sr-only">Search</span>
          <span class="absolute m-2 mt-3 left-0 flex items-center">
            <svg class="h-5 w-5 fill-aronium-600" viewBox="0 0 20 20">
              <path
                fill-rule="evenodd"
                d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                clip-rule="evenodd"
              ></path>
            </svg>
          </span>
          <input
            class="placeholder:italic placeholder:text-aronium-600 border-0 h-10 block bg-inherit w-96 pl-9 p-3 sm:text-sm"
            placeholder="Search for anything..."
            type="text"
            name="search"
          />
        </label>
      </div>
      <div class="flex flex-auto pb-3 border-l border-aronium-600">
        <span class="text-sm w-full ml-auto text-right h-10 pt-3 px-3"
          >Product count: {{ tableData.length }}</span
        >
      </div>
    </div>

    <div class="flex-auto">
      <!-- TABLE -->
      <div class="flex flex-nowrap mb-6">
        <table class="table-auto w-full text-center border-zinc-500">
          <thead>
            <tr>
              <th
                class="relative border-b border-t border-r border-aronium-600"
                style="resize: horizontal;"
              >
                ID
              </th>
              <th
                class="font-semibold border-b border-t border-r border-aronium-600"
              >
                Name
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Group
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Barcode
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Cost
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Sale Price
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Taxes
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                After Tax Price
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Active
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Unit
              </th>
              <th class="border-b border-t border-r border-aronium-600">
                Created
              </th>
              <th class="border-b border-t border-aronium-600">Updated</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="product in tableData" :key="product.id">
              <!-- class="bg-zinc-400 focus:bg-zinc-300" -->
              <td class="border-b border-r border-aronium-600">
                <span class="px-3">{{ product.id }}</span>
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.name }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.group }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.barcode }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.cost }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.salePrice }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.taxes }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.afterTaxPrice }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.active }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.unit }}
              </td>
              <td class="border-b border-r border-aronium-600">
                {{ product.created }}
              </td>
              <td class="border-b border-aronium-600">
                {{ product.updated }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- END TABLE -->
    </div>
  </div>
</template>
<script>
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
