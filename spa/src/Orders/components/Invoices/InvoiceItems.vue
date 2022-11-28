<template>
  <div class="px-8 sm:px-6 lg:px-8">
    <div class="sm:flex sm:items-center">
      <div class="sm:flex-auto">
        <h1 class="text-xl font-semibold text-gray-900">Invoice</h1>
        <p class="mt-2 text-sm text-gray-700">
          For work completed from
          <time datetime="2022-08-01">August 1, 2022</time> to
          <time datetime="2022-08-31">August 31, 2022</time>.
        </p>
      </div>
      <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
        <button
          type="button"
          class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:w-auto"
        >
          Print
        </button>
      </div>
    </div>
    <div
      class="-mx-4 mt-8 overflow-hidden shadow ring-1 ring-black ring-opacity-5 sm:-mx-6 md:mx-0 md:rounded-lg"
    >
      <table class="min-w-full divide-y divide-gray-300">
        <thead class="bg-gray-50">
          <tr>
            <th
              scope="col"
              class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6"
            >
              Name
            </th>
            <th
              scope="col"
              class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 sm:table-cell"
            >
              Title
            </th>
            <th
              scope="col"
              class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 lg:table-cell"
            >
              Email
            </th>
            <th
              scope="col"
              class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
            >
              Role
            </th>
            <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
              <span class="sr-only">Edit</span>
            </th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-200 bg-white">
          <tr v-for="person in people" :key="person.email">
            <td
              class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6"
            >
              {{ person.name }}
            </td>
            <td
              class="hidden whitespace-nowrap px-3 py-4 text-sm text-gray-500 sm:table-cell"
            >
              {{ person.title }}
            </td>
            <td
              class="hidden whitespace-nowrap px-3 py-4 text-sm text-gray-500 lg:table-cell"
            >
              {{ person.email }}
            </td>
            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
              {{ person.role }}
            </td>
            <td
              class="whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6"
            >
              <a href="#" class="text-indigo-600 hover:text-indigo-900"
                >Edit<span class="sr-only">, {{ person.name }}</span></a
              >
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <th
              scope="row"
              colspan="3"
              class="hidden pl-6 pr-3 pt-6 text-right text-sm font-normal text-gray-500 sm:table-cell md:pl-0"
            >
              Subtotal
            </th>
            <th
              scope="row"
              class="pl-4 pr-3 pt-6 text-left text-sm font-normal text-gray-500 sm:hidden"
            >
              Subtotal
            </th>
            <td
              class="pl-3 pr-4 pt-6 text-right text-sm text-gray-500 sm:pr-6 md:pr-0"
            >
              $3,900.00
            </td>
          </tr>
          <tr>
            <th
              scope="row"
              colspan="3"
              class="hidden pl-6 pr-3 pt-4 text-right text-sm font-normal text-gray-500 sm:table-cell md:pl-0"
            >
              Tax
            </th>
            <th
              scope="row"
              class="pl-4 pr-3 pt-4 text-left text-sm font-normal text-gray-500 sm:hidden"
            >
              Tax
            </th>
            <td
              class="pl-3 pr-4 pt-4 text-right text-sm text-gray-500 sm:pr-6 md:pr-0"
            >
              $585.00
            </td>
          </tr>
          <tr>
            <th
              scope="row"
              colspan="3"
              class="hidden pl-6 pr-3 pt-4 text-right text-sm font-semibold text-gray-900 sm:table-cell md:pl-0"
            >
              Total
            </th>
            <th
              scope="row"
              class="pl-4 pr-3 pt-4 text-left text-sm font-semibold text-gray-900 sm:hidden"
            >
              Total
            </th>
            <td
              class="pl-3 pr-4 pt-4 text-right text-sm font-semibold text-gray-900 sm:pr-6 md:pr-0"
            >
              $4,485.00
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</template>

<script setup>
const people = [
  {
    name: "Lindsay Walton",
    title: "Front-end Developer",
    email: "lindsay.walton@example.com",
    role: "Member",
  },
  // More people...
];
const projects = [
  {
    id: 1,
    name: "New Advertising Campaign",
    hours: "12.0",
    rate: "$75.00",
    price: "$900.00",
  },
  {
    id: 1,
    name: "New Advertising Campaign",
    hours: "12.0",
    rate: "$75.00",
    price: "$900.00",
  },
  {
    id: 1,
    name: "New Advertising Campaign",
    hours: "12.0",
    rate: "$75.00",
    price: "$900.00",
  },
  {
    id: 1,
    name: "New Advertising Campaign",
    hours: "12.0",
    rate: "$75.00",
    price: "$900.00",
  },
  {
    id: 1,
    name: "New Advertising Campaign",
    hours: "12.0",
    rate: "$75.00",
    price: "$900.00",
  },
  // More projects...
];
</script>
