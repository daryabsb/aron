<template>
  <div
    class="relative flex flex-col text-white h-full w-full bg-zinc-800 placeholder-zinc-800"
  >
    <div>
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
          <span class="text-xs p-3 border border-zinc-500">
            <input
              type="text"
              name="product"
              class="bg-zinc-800 caret-zinc-800 min-w-full"
            />
          </span>
        </div>
        <div class="flex flex-auto pb-3">
          <span
            class="text-sm w-full ml-auto text-right p-3 border border-zinc-500"
            >Product count: 8</span
          >
        </div>
      </div>
    </div>
    <div class="flex-auto px-4 lg:px-10 py-10 pt-0">
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
