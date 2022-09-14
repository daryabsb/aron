<template>
  <div
    class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded"
    :class="[color === 'light' ? 'bg-white' : 'bg-emerald-900 text-white']"
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
                <input
                  type="text"
                  class="px-12 py-2 h-8 border border-solid border-slate-600 rounded-full text-lg leading-snug text-slate-600 bg-white shadow-none outline-none focus:outline-none focus:border-sky-600 w-full font-normal rounded-l-none flex-1 border-l-0 placeholder-emerald-300"
                  placeholder="Search Products"
                />
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
              Status
            </th>
            <th
              class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
              :class="[
                color === 'light'
                  ? 'bg-slate-50 text-slate-500 border-slate-100'
                  : 'bg-emerald-800 text-emerald-300 border-emerald-700',
              ]"
            >
              Color
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
          <tr v-for="product in products" :key="product.id">
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="product.image"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[color === 'light' ? 'text-slate-600' : 'text-white']"
              >
                {{ product.name }}
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              {{ product.price }} IQD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-orange-500 mr-2"></i> pending
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
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
        <!-- <tbody>
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="bootstrap"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                Argon Design System
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $2,500 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-orange-500 mr-2"></i> pending
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="angular"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                Angular Now UI Kit PRO
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $1,800 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-emerald-500 mr-2"></i>
              completed
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">100%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-emerald-200"
                  >
                    <div
                      style="width: 100%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-emerald-500"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="sketch"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                Black Dashboard Sketch
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $3,150 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-red-500 mr-2"></i> delayed
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">73%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-red-200"
                  >
                    <div
                      style="width: 73%;"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="react"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                React Material Dashboard
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $4,400 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-teal-500 mr-2"></i> on schedule
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">90%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-teal-200"
                  >
                    <div
                      style="width: 90%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-teal-500"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="vue"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                React Material Dashboard
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $2,200 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-emerald-500 mr-2"></i>
              completed
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">100%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-emerald-200"
                  >
                    <div
                      style="width: 100%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-emerald-500"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="react"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                React Material Dashboard
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $4,400 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-teal-500 mr-2"></i> on schedule
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">90%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-teal-200"
                  >
                    <div
                      style="width: 90%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-teal-500"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="vue"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                React Material Dashboard
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $2,200 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-emerald-500 mr-2"></i>
              completed
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">100%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-emerald-200"
                  >
                    <div
                      style="width: 100%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-emerald-500"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="react"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                React Material Dashboard
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $4,400 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-teal-500 mr-2"></i> on schedule
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">90%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-teal-200"
                  >
                    <div
                      style="width: 90%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-teal-500"
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
          <tr>
            <th
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"
            >
              <img
                :src="vue"
                class="h-12 w-12 bg-white rounded-full border"
                alt="..."
              />
              <span
                class="ml-3 font-bold"
                :class="[
                  color === 'light' ? 'text-slate-600' : 'text-white',
                ]"
              >
                React Material Dashboard
              </span>
            </th>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              $2,200 USD
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <i class="fas fa-circle text-emerald-500 mr-2"></i>
              completed
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex">
                <img
                  :src="team1"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow"
                />
                <img
                  :src="team2"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team3"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
                <img
                  :src="team4"
                  alt="..."
                  class="w-10 h-10 rounded-full border-2 border-slate-50 shadow -ml-4"
                />
              </div>
            </td>
            <td
              class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"
            >
              <div class="flex items-center">
                <span class="mr-2">100%</span>
                <div class="relative w-full">
                  <div
                    class="overflow-hidden h-2 text-xs flex rounded bg-emerald-200"
                  >
                    <div
                      style="width: 100%;"
                      class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-emerald-500"
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
        </tbody> -->
      </table>
    </div>
  </div>
</template>
<script>
import { products } from "@/store/composables";
import TableDropdown from "@/components/Dropdowns/TableDropdown.vue";

import bootstrap from "@/assets/img/bootstrap.jpg";
import angular from "@/assets/img/angular.jpg";
import sketch from "@/assets/img/sketch.jpg";
import react from "@/assets/img/react.jpg";
import vue from "@/assets/img/react.jpg";

import team1 from "@/assets/img/team-1-800x800.jpg";
import team2 from "@/assets/img/team-2-800x800.jpg";
import team3 from "@/assets/img/team-3-800x800.jpg";
import team4 from "@/assets/img/team-4-470x470.png";

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
  data() {
    return {
      bootstrap,
      angular,
      sketch,
      react,
      vue,
      team1,
      team2,
      team3,
      team4,
      products,
    };
  },
};
</script>
