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
      <button
        class="bg-pink-500 text-white active:bg-zinc-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 ease-linear transition-all duration-150"
        type="button"
      >
        Settings
      </button>
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
