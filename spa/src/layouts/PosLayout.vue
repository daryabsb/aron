<template>
  <!-- <div class="bg-blue-gray-50">
    <div
      class="hide-print flex flex-row h-screen antialiased text-blue-gray-800"
    > -->
  <!-- <pos-left-nav /> -->
  <!-- <router-view></router-view> -->
  <!-- </div>
  </div> -->

  <!-- PAGE START OVER -->

  <div class="bg-blue-gray-50">
    <!-- noprint-area -->
    <div
      class="hide-print flex flex-row h-screen antialiased text-blue-gray-800"
    >
      <!-- left sidebar -->
      <div class="flex flex-row w-auto flex-shrink-0 pl-4 pr-2 py-4">
        <div
          class="flex flex-col items-center py-4 flex-shrink-0 w-20 bg-cyan-500 rounded-3xl"
        >
          <a
            href="#"
            class="flex items-center justify-center h-12 w-12 bg-cyan-50 text-cyan-700 rounded-full"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="123.3"
              height="123.233"
              viewBox="0 0 32.623 32.605"
            >
              <path
                d="M15.612 0c-.36.003-.705.01-1.03.021C8.657.223 5.742 1.123 3.4 3.472.714 6.166-.145 9.758.019 17.607c.137 6.52.965 9.271 3.542 11.768 1.31 1.269 2.658 2 4.73 2.57.846.232 2.73.547 3.56.596.36.021 2.336.048 4.392.06 3.162.018 4.031-.016 5.63-.221 3.915-.504 6.43-1.778 8.234-4.173 1.806-2.396 2.514-5.731 2.516-11.846.001-4.407-.42-7.59-1.278-9.643-1.463-3.501-4.183-5.53-8.394-6.258-1.634-.283-4.823-.475-7.339-.46z"
                fill="#fff"
              />
              <path
                d="M16.202 13.758c-.056 0-.11 0-.16.003-.926.031-1.38.172-1.747.538-.42.421-.553.982-.528 2.208.022 1.018.151 1.447.553 1.837.205.198.415.313.739.402.132.036.426.085.556.093.056.003.365.007.686.009.494.003.63-.002.879-.035.611-.078 1.004-.277 1.286-.651.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.147-.072zM16.22 19.926c-.056 0-.11 0-.16.003-.925.031-1.38.172-1.746.539-.42.42-.554.981-.528 2.207.02 1.018.15 1.448.553 1.838.204.198.415.312.738.4.132.037.426.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.034.61-.08 1.003-.278 1.285-.652.282-.374.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.863-1.31-.977a7.91 7.91 0 00-1.146-.072zM22.468 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.205.198.415.313.739.401.132.037.426.086.556.094.056.003.364.007.685.009.494.003.63-.002.88-.035.611-.078 1.004-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.065-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072z"
                fill="#00dace"
              />
              <path
                d="M9.937 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.204.198.415.313.738.401.133.037.427.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.035.61-.078 1.003-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072zM16.202 7.59c-.056 0-.11 0-.16.002-.926.032-1.38.172-1.747.54-.42.42-.553.98-.528 2.206.022 1.019.151 1.448.553 1.838.205.198.415.312.739.401.132.037.426.086.556.093.056.003.365.007.686.01.494.002.63-.003.879-.035.611-.079 1.004-.278 1.286-.652.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.505-.228-.547-.653-.864-1.31-.978a7.91 7.91 0 00-1.147-.071z"
                fill="#00bcd4"
              />
              <g>
                <path
                  d="M15.612 0c-.36.003-.705.01-1.03.021C8.657.223 5.742 1.123 3.4 3.472.714 6.166-.145 9.758.019 17.607c.137 6.52.965 9.271 3.542 11.768 1.31 1.269 2.658 2 4.73 2.57.846.232 2.73.547 3.56.596.36.021 2.336.048 4.392.06 3.162.018 4.031-.016 5.63-.221 3.915-.504 6.43-1.778 8.234-4.173 1.806-2.396 2.514-5.731 2.516-11.846.001-4.407-.42-7.59-1.278-9.643-1.463-3.501-4.183-5.53-8.394-6.258-1.634-.283-4.823-.475-7.339-.46z"
                  fill="#fff"
                />
                <path
                  d="M16.202 13.758c-.056 0-.11 0-.16.003-.926.031-1.38.172-1.747.538-.42.421-.553.982-.528 2.208.022 1.018.151 1.447.553 1.837.205.198.415.313.739.402.132.036.426.085.556.093.056.003.365.007.686.009.494.003.63-.002.879-.035.611-.078 1.004-.277 1.286-.651.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.147-.072zM16.22 19.926c-.056 0-.11 0-.16.003-.925.031-1.38.172-1.746.539-.42.42-.554.981-.528 2.207.02 1.018.15 1.448.553 1.838.204.198.415.312.738.4.132.037.426.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.034.61-.08 1.003-.278 1.285-.652.282-.374.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.863-1.31-.977a7.91 7.91 0 00-1.146-.072zM22.468 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.205.198.415.313.739.401.132.037.426.086.556.094.056.003.364.007.685.009.494.003.63-.002.88-.035.611-.078 1.004-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.065-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072z"
                  fill="#00dace"
                />
                <path
                  d="M9.937 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.204.198.415.313.738.401.133.037.427.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.035.61-.078 1.003-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072zM16.202 7.59c-.056 0-.11 0-.16.002-.926.032-1.38.172-1.747.54-.42.42-.553.98-.528 2.206.022 1.019.151 1.448.553 1.838.205.198.415.312.739.401.132.037.426.086.556.093.056.003.365.007.686.01.494.002.63-.003.879-.035.611-.079 1.004-.278 1.286-.652.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.505-.228-.547-.653-.864-1.31-.978a7.91 7.91 0 00-1.147-.071z"
                  fill="#00bcd4"
                />
              </g>
            </svg>
          </a>
          <ul class="flex flex-col space-y-2 mt-12">
            <li>
              <a href="#" class="flex items-center">
                <span
                  class="flex items-center justify-center h-12 w-12 rounded-2xl"
                  :class="{
                    'hover:bg-cyan-400 text-cyan-100': activeMenu !== 'pos',
                    'bg-cyan-300 shadow-lg text-white': activeMenu === 'pos',
                  }"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-6 w-6"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"
                    />
                  </svg>
                </span>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center">
                <span
                  class="flex items-center justify-center text-cyan-100 hover:bg-cyan-400 h-12 w-12 rounded-2xl"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-6 w-6"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                    />
                  </svg>
                </span>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center">
                <span
                  class="flex items-center justify-center text-cyan-100 hover:bg-cyan-400 h-12 w-12 rounded-2xl"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-6 w-6"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
                    />
                  </svg>
                </span>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center">
                <span
                  class="flex items-center justify-center text-cyan-100 hover:bg-cyan-400 h-12 w-12 rounded-2xl"
                >
                  <svg
                    class="w-6 h-6"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"
                    ></path>
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                    ></path>
                  </svg>
                </span>
              </a>
            </li>
          </ul>
          <a
            href="https://github.com/emsifa/tailwind-pos"
            target="_blank"
            class="mt-auto flex items-center justify-center text-cyan-200 hover:text-cyan-100 h-10 w-10 focus:outline-none"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 w-8"
              viewBox="0 0 20 20"
              fill="currentColor"
            >
              <path
                fill-rule="evenodd"
                d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                clip-rule="evenodd"
              />
            </svg>
          </a>
        </div>
      </div>

      <!-- page content -->
      <div class="flex-grow flex">
        <!-- store menu -->
        <div class="flex flex-col bg-blue-gray-50 h-full w-full py-4">
          <div class="flex px-2 flex-row relative">
            <div
              class="absolute left-5 top-3 px-2 py-2 rounded-full bg-cyan-500 text-white"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                />
              </svg>
            </div>
            <input
              type="text"
              class="bg-white rounded-3xl shadow text-lg full w-full h-16 py-4 pl-16 transition-shadow focus:shadow-2xl focus:outline-none"
              placeholder="Cari menu ..."
              v-model="keyword"
            />
          </div>
          <div class="h-full overflow-hidden mt-4">
            <div class="h-full overflow-y-auto px-2">
              <div
                class="select-none bg-blue-gray-100 rounded-3xl flex flex-wrap content-center justify-center h-full opacity-25"
                v-if="filteredProducts().length === 0"
              >
                <div class="w-full text-center">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-24 w-24 inline-block"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"
                    />
                  </svg>
                  <p class="text-xl">
                    YOU DON'T HAVE
                    <br />
                    ANY PRODUCTS TO SHOW
                  </p>
                </div>
              </div>
              <div
                class="select-none bg-blue-gray-100 rounded-3xl flex flex-wrap content-center justify-center h-full opacity-25"
                v-if="filteredProducts().length === 0 && keyword.length > 0"
              >
                <div class="w-full text-center">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-24 w-24 inline-block"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                    />
                  </svg>
                  <p class="text-xl">
                    EMPTY SEARCH RESULT
                    <br />
                    "<span class="font-semibold">{{ keyword }}</span
                    >"
                  </p>
                </div>
              </div>
              <div class="grid grid-cols-4 gap-4 pb-3">
                <div v-for="product in filteredProducts()" :key="product.id">
                  <div
                    role="button"
                    class="select-none cursor-pointer transition-shadow overflow-hidden rounded-2xl bg-white shadow hover:shadow-lg"
                    title="Cucumber"
                    @click="addToCart(product)"
                  >
                    <img :src="product.image" :alt="product.name" />
                    <div class="flex pb-3 px-3 text-sm -mt-3">
                      <p class="flex-grow truncate mr-1">{{ product.name }}</p>
                      <p class="nowrap font-semibold">
                        {{ priceFormat(product.price) }}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- end of store menu -->

        <!-- right sidebar -->
        <div
          class="w-6/12 flex flex-col bg-blue-gray-50 h-full bg-white pr-4 pl-2 py-4"
        >
          <div class="bg-white rounded-3xl flex flex-col h-full shadow">
            <!-- empty cart -->
            <div
              v-if="cart.length === 0"
              class="flex-1 w-full p-4 opacity-25 select-none flex flex-col flex-wrap content-center justify-center"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-16 inline-block"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"
                />
              </svg>
              <p>
                CART EMPTY
              </p>
            </div>

            <!-- cart items -->
            <!-- v-if="cart.length > 0" -->
            <div class="flex-1 flex flex-col overflow-auto">
              <div class="h-16 text-center flex justify-center">
                <div class="pl-8 text-left text-lg py-4 relative">
                  <!-- cart icon -->
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-6 inline-block"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"
                    />
                  </svg>
                  <!-- v-if="getItemsCount() > 0" -->
                  <div
                    class="text-center absolute bg-cyan-500 text-white w-5 h-5 text-xs p-0 leading-5 rounded-full -right-2 top-3"
                  ></div>
                </div>
                <div class="flex-grow px-8 text-right text-lg py-4 relative">
                  <!-- trash button -->
                  <button
                    class="text-blue-gray-300 hover:text-pink-500 focus:outline-none"
                    @click="clear()"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-6 w-6 inline-block"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                      />
                    </svg>
                  </button>
                </div>
              </div>

              <div class="flex-1 w-full px-4 overflow-auto">
                <div v-for="item in cart.value" :key="item.id">
                  <div
                    class="select-none mb-3 bg-blue-gray-50 rounded-lg w-full text-blue-gray-700 py-2 px-2 flex justify-center"
                  >
                    CART ITEM ADDED{{ cart }}
                    <img
                      :src="item.image"
                      alt=""
                      class="rounded-lg h-10 w-10 bg-white shadow mr-2"
                    />
                    <div class="flex-grow">
                      <h5 class="text-sm">{{ item.name }}</h5>
                      <p class="text-xs block">{{ priceFormat(item.price) }}</p>
                    </div>
                    <div class="py-1">
                      <div class="w-28 grid grid-cols-3 gap-2 ml-2">
                        <button
                          @click="addQty(item, -1)"
                          class="rounded-lg text-center py-1 text-white bg-blue-gray-600 hover:bg-blue-gray-700 focus:outline-none"
                        >
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            class="h-6 w-3 inline-block"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                          >
                            <path
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              stroke-width="2"
                              d="M20 12H4"
                            />
                          </svg>
                        </button>
                        <input
                          v-model="item.qty"
                          type="number"
                          class="bg-white rounded-lg text-center shadow focus:outline-none focus:shadow-lg text-sm"
                        />
                        <button
                          @click="addQty(item, 1)"
                          class="rounded-lg text-center py-1 text-white bg-blue-gray-600 hover:bg-blue-gray-700 focus:outline-none"
                        >
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            class="h-6 w-3 inline-block"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                          >
                            <path
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              stroke-width="2"
                              d="M12 6v6m0 0v6m0-6h6m-6 0H6"
                            />
                          </svg>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- end of cart items -->

            <!-- payment info -->
            <div class="select-none h-auto w-full text-center pt-3 pb-4 px-4">
              <div class="flex mb-3 text-lg font-semibold text-blue-gray-700">
                <div>TOTAL</div>
                <div class="text-right w-full">
                  <!-- {{ priceFormat(getTotalPrice()) }} -->
                </div>
              </div>
              <div
                class="mb-3 text-blue-gray-700 px-3 pt-2 pb-3 rounded-lg bg-blue-gray-50"
              >
                <div class="flex text-lg font-semibold">
                  <div class="flex-grow text-left">CASH</div>
                  <div class="flex text-right">
                    <div class="mr-2">Rp</div>
                    <input
                      :value="cash"
                      @keyup="updateCash($event.target.value)"
                      type="text"
                      class="w-28 text-right bg-white shadow rounded-lg focus:bg-white focus:shadow-lg px-2 focus:outline-none"
                    />
                  </div>
                </div>
                <hr class="my-2" />
                <div class="grid grid-cols-3 gap-2 mt-2">
                  <div v-for="money in moneys" :key="money">
                    <button
                      @click="addCash(money)"
                      class="bg-white rounded-lg shadow hover:shadow-lg focus:outline-none inline-block px-2 py-1 text-sm"
                    >
                      +<span>
                        {{ money }}
                      </span>
                    </button>
                  </div>
                </div>
              </div>
              <div
                v-if="change > 0"
                class="flex mb-3 text-lg font-semibold bg-cyan-50 text-blue-gray-700 rounded-lg py-2 px-3"
              >
                <div class="text-cyan-800">CHANGE</div>
                <div class="text-right flex-grow text-cyan-600">
                  {{ priceFormat(change) }}
                </div>
              </div>
              <div
                v-if="change < 0"
                class="flex mb-3 text-lg font-semibold bg-pink-100 text-blue-gray-700 rounded-lg py-2 px-3"
              >
                <div class="text-right flex-grow text-pink-600">
                  {{ priceFormat(change) }}
                </div>
              </div>
              <div
                v-if="change == 0 && cart.length > 0"
                class="flex justify-center mb-3 text-lg font-semibold bg-cyan-50 text-cyan-700 rounded-lg py-2 px-3"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-6 w-6 inline-block"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M14 10h4.764a2 2 0 011.789 2.894l-3.5 7A2 2 0 0115.263 21h-4.017c-.163 0-.326-.02-.485-.06L7 20m7-10V5a2 2 0 00-2-2h-.095c-.5 0-.905.405-.905.905 0 .714-.211 1.412-.608 2.006L7 11v9m7-10h-2M7 20H5a2 2 0 01-2-2v-6a2 2 0 012-2h2.5"
                  />
                </svg>
              </div>
              <button
                class="text-white rounded-2xl text-lg w-full py-3 focus:outline-none"
                :class="{
                  'bg-cyan-500 hover:bg-cyan-600': submitable(),
                  'bg-blue-gray-200': !submitable(),
                }"
                :disabled="!submitable()"
                @click="submit()"
              >
                SUBMIT
              </button>
            </div>
            <!-- end of payment info -->
          </div>
        </div>
        <!-- end of right sidebar -->
      </div>

      <!-- modal first time -->
      <div
        v-if="firstTime"
        class="fixed glass w-full h-screen left-0 top-0 z-10 flex flex-wrap justify-center content-center p-24"
      >
        <div class="w-96 rounded-3xl p-8 bg-white shadow-xl">
          <div class="text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="inline-block"
              width="123.3"
              height="123.233"
              viewBox="0 0 32.623 32.605"
            >
              <path
                d="M15.612 0c-.36.003-.705.01-1.03.021C8.657.223 5.742 1.123 3.4 3.472.714 6.166-.145 9.758.019 17.607c.137 6.52.965 9.271 3.542 11.768 1.31 1.269 2.658 2 4.73 2.57.846.232 2.73.547 3.56.596.36.021 2.336.048 4.392.06 3.162.018 4.031-.016 5.63-.221 3.915-.504 6.43-1.778 8.234-4.173 1.806-2.396 2.514-5.731 2.516-11.846.001-4.407-.42-7.59-1.278-9.643-1.463-3.501-4.183-5.53-8.394-6.258-1.634-.283-4.823-.475-7.339-.46z"
                fill="#fff"
              />
              <path
                d="M16.202 13.758c-.056 0-.11 0-.16.003-.926.031-1.38.172-1.747.538-.42.421-.553.982-.528 2.208.022 1.018.151 1.447.553 1.837.205.198.415.313.739.402.132.036.426.085.556.093.056.003.365.007.686.009.494.003.63-.002.879-.035.611-.078 1.004-.277 1.286-.651.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.147-.072zM16.22 19.926c-.056 0-.11 0-.16.003-.925.031-1.38.172-1.746.539-.42.42-.554.981-.528 2.207.02 1.018.15 1.448.553 1.838.204.198.415.312.738.4.132.037.426.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.034.61-.08 1.003-.278 1.285-.652.282-.374.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.863-1.31-.977a7.91 7.91 0 00-1.146-.072zM22.468 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.205.198.415.313.739.401.132.037.426.086.556.094.056.003.364.007.685.009.494.003.63-.002.88-.035.611-.078 1.004-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.065-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072z"
                fill="#00dace"
              />
              <path
                d="M9.937 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.204.198.415.313.738.401.133.037.427.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.035.61-.078 1.003-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072zM16.202 7.59c-.056 0-.11 0-.16.002-.926.032-1.38.172-1.747.54-.42.42-.553.98-.528 2.206.022 1.019.151 1.448.553 1.838.205.198.415.312.739.401.132.037.426.086.556.093.056.003.365.007.686.01.494.002.63-.003.879-.035.611-.079 1.004-.278 1.286-.652.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.505-.228-.547-.653-.864-1.31-.978a7.91 7.91 0 00-1.147-.071z"
                fill="#00bcd4"
              />
              <g>
                <path
                  d="M15.612 0c-.36.003-.705.01-1.03.021C8.657.223 5.742 1.123 3.4 3.472.714 6.166-.145 9.758.019 17.607c.137 6.52.965 9.271 3.542 11.768 1.31 1.269 2.658 2 4.73 2.57.846.232 2.73.547 3.56.596.36.021 2.336.048 4.392.06 3.162.018 4.031-.016 5.63-.221 3.915-.504 6.43-1.778 8.234-4.173 1.806-2.396 2.514-5.731 2.516-11.846.001-4.407-.42-7.59-1.278-9.643-1.463-3.501-4.183-5.53-8.394-6.258-1.634-.283-4.823-.475-7.339-.46z"
                  fill="#fff"
                />
                <path
                  d="M16.202 13.758c-.056 0-.11 0-.16.003-.926.031-1.38.172-1.747.538-.42.421-.553.982-.528 2.208.022 1.018.151 1.447.553 1.837.205.198.415.313.739.402.132.036.426.085.556.093.056.003.365.007.686.009.494.003.63-.002.879-.035.611-.078 1.004-.277 1.286-.651.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.147-.072zM16.22 19.926c-.056 0-.11 0-.16.003-.925.031-1.38.172-1.746.539-.42.42-.554.981-.528 2.207.02 1.018.15 1.448.553 1.838.204.198.415.312.738.4.132.037.426.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.034.61-.08 1.003-.278 1.285-.652.282-.374.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.863-1.31-.977a7.91 7.91 0 00-1.146-.072zM22.468 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.205.198.415.313.739.401.132.037.426.086.556.094.056.003.364.007.685.009.494.003.63-.002.88-.035.611-.078 1.004-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.065-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072z"
                  fill="#00dace"
                />
                <path
                  d="M9.937 13.736c-.056 0-.11.001-.161.003-.925.032-1.38.172-1.746.54-.42.42-.554.98-.528 2.207.021 1.018.15 1.447.553 1.837.204.198.415.313.738.401.133.037.427.086.556.094.056.003.365.007.686.009.494.003.63-.002.88-.035.61-.078 1.003-.277 1.285-.651.282-.375.393-.895.393-1.85 0-.688-.066-1.185-.2-1.506-.228-.547-.653-.864-1.31-.977a7.91 7.91 0 00-1.146-.072zM16.202 7.59c-.056 0-.11 0-.16.002-.926.032-1.38.172-1.747.54-.42.42-.553.98-.528 2.206.022 1.019.151 1.448.553 1.838.205.198.415.312.739.401.132.037.426.086.556.093.056.003.365.007.686.01.494.002.63-.003.879-.035.611-.079 1.004-.278 1.286-.652.282-.374.392-.895.393-1.85 0-.688-.066-1.185-.2-1.505-.228-.547-.653-.864-1.31-.978a7.91 7.91 0 00-1.147-.071z"
                  fill="#00bcd4"
                />
              </g>
            </svg>
            <h3 class="text-center text-2xl mb-8">FIRST TIME?</h3>
          </div>
          <div class="text-left">
            <button
              @click="startWithSampleData()"
              class="text-left w-full mb-3 rounded-xl bg-blue-gray-500 text-white focus:outline-none hover:bg-cyan-400 px-4 py-4"
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
              @click="startBlank()"
              class="text-left w-full rounded-xl bg-blue-gray-500 text-white focus:outline-none hover:bg-teal-400 px-4 py-4"
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
      </div>

      <!-- modal receipt -->
      <div
        v-if="isShowModalReceipt"
        class="fixed w-full h-screen left-0 top-0 z-10 flex flex-wrap justify-center content-center p-24"
      >
        <div
          v-if="isShowModalReceipt"
          class="fixed glass w-full h-screen left-0 top-0 z-0"
          x-transition:enter="transition ease-out duration-100"
          x-transition:enter-start="opacity-0"
          x-transition:enter-end="opacity-100"
          x-transition:leave="transition ease-in duration-100"
          x-transition:leave-start="opacity-100"
          x-transition:leave-end="opacity-0"
          @click="closeModalReceipt()"
        ></div>
        <div
          v-if="isShowModalReceipt"
          class="w-96 rounded-3xl bg-white shadow-xl overflow-hidden z-10"
          x-transition:enter="transition ease-out duration-100"
          x-transition:enter-start="opacity-0 transform scale-90"
          x-transition:enter-end="opacity-100 transform scale-100"
          x-transition:leave="transition ease-in duration-100"
          x-transition:leave-start="opacity-100 transform scale-100"
          x-transition:leave-end="opacity-0 transform scale-90"
        >
          <div
            id="receipt-content"
            class="text-left w-full text-sm p-6 overflow-auto"
          >
            <div class="text-center">
              <img
                src="img/receipt-logo.png"
                alt="Tailwind POS"
                class="mb-3 w-8 h-8 inline-block"
              />
              <h2 class="text-xl font-semibold">TAILWIND POS</h2>
              <p>CABANG KONOHA SELATAN</p>
            </div>
            <div class="flex mt-4 text-xs">
              <div class="flex-grow">
                No: <span>{{ receiptNo }}</span>
              </div>
              <div>{{ receiptDate }}</div>
            </div>
            <hr class="my-2" />
            <div>
              <table class="w-full text-xs">
                <thead>
                  <tr>
                    <th class="py-1 w-1/12 text-center">#</th>
                    <th class="py-1 text-left">Item</th>
                    <th class="py-1 w-2/12 text-center">Qty</th>
                    <th class="py-1 w-3/12 text-right">Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                  <div v-for="(item, index) in cart" :key="index">
                    <tr>
                      <td class="py-2 text-center">{{ index + 1 }}</td>
                      <td class="py-2 text-left">
                        <span>{{ item.name }}</span>
                        <br />
                        <small>{{ priceFormat(item.price) }}</small>
                      </td>
                      <td class="py-2 text-center">{{ item.qty }}</td>
                      <td class="py-2 text-right">
                        {{ priceFormat(item.qty * item.price) }}
                      </td>
                    </tr>
                  </div>
                </tbody>
              </table>
            </div>
            <hr class="my-2" />
            <div>
              <div class="flex font-semibold">
                <div class="flex-grow">TOTAL</div>
                <div>{{ priceFormat(getTotalPrice()) }}</div>
              </div>
              <div class="flex text-xs font-semibold">
                <div class="flex-grow">PAY AMOUNT</div>
                <div>{{ priceFormat(cash) }}</div>
              </div>
              <hr class="my-2" />
              <div class="flex text-xs font-semibold">
                <div class="flex-grow">CHANGE</div>
                <div>{{ priceFormat(change) }}</div>
              </div>
            </div>
          </div>
          <div class="p-4 w-full">
            <button
              class="bg-cyan-500 text-white text-lg px-4 py-3 rounded-2xl w-full focus:outline-none"
              @click="printAndProceed()"
            >
              PROCEED
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- end of noprint-area -->

    <div id="print-area" class="print-area"></div>
  </div>

  <!-- PAGE START OVER END -->
</template>

<script setup>
// import PosRightNav from "@/components/pos/PosRightNav.vue";
// import StoreMenu from "@/components/pos/StoreMenu.vue";
import { ref, computed, onMounted, reactive } from "vue";
import useGetProducts from "@/composables/useGetProducts";
import { useFetchProductsDispatch } from "@/store/composables";
// let db = null;
let time = ref(null);
//  let firstTime= localStorage.getItem("first_time") === null,
let activeMenu = "pos";
let loadingSampleData = false;
let firstTime = false;

let moneys = reactive(["2000", "5000", "10000", "20000", "50000", "100000"]);
let products = useGetProducts();
let keyword = ref("");
let cart = [];
let cash = 0;
let change = 0;
let isShowModalReceipt = false;
let receiptNo = null;
let receiptDate = ref(null);

const setFirstTime = (firstOpen) => {
  firstTime = firstOpen;
};

const startBlank = () => computed(setFirstTime(false));

onMounted(useFetchProductsDispatch);

// const startWithSampleData = async () => {
//   // const response = await fetch("@/assets/data/sample.json");
//   const response = await axios.get("http://127.0.0.1:8000/api/product/all/");
//   products.value = response.data;
//   // setFirstTime(false);
// };

const closeModalReceipt = () => computed((isShowModalReceipt = false));

const numberFormat = (number) => {
  return computed(
    (number || "")
      .toString()
      .replace(/^0|\./g, "")
      .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
  );
};

const getTotalPrice = () => {
  return computed(
    cart.reduce((total, item) => total + item.qty * item.price, 0)
  );
};
const playSound = (src) => {
  const sound = new Audio();
  sound.src = src;
  sound.play();
  // sound.onended = () => delete(sound);
};
const updateChange = () => computed((change = cash - getTotalPrice()));
const clearSound = () => computed(playSound("sound/button-21.mp3"));

const clear = () => {
  cash = 0;
  cart = [];
  receiptNo = null;
  receiptDate = null;
  updateChange();
  clearSound();
};

const beep = () => computed(playSound("sound/beep-29.mp3"));

const updateCash = (value) => {
  cash = parseFloat(value.replace(/[^0-9]+/g, ""));
  updateChange();
};

// const getItemsCount = () => cart.reduce((count, item) => count + item.qty, 0);
const getItemsCount = true;
const addCash = (amount) => {
  cash = (cash || 0) + amount;
  updateChange();
  beep();
};

const filteredProducts = () => {
  const rg = keyword.value ? new RegExp(keyword.value) : null;
  // return computed(() => products.filter((p) => !rg || p.name.match(rg)));
  if (rg) {
    console.log("rg", rg);
    return products.value.filter((p) => !rg || p.name.match(rg));
  }
  console.log("useGetProducts", useGetProducts().value);
  return products.value;
};

const priceFormat = (number) =>
  number ? `Rp. ${numberFormat(number)}` : `Rp. 0`;

const findCartIndex = (product) =>
  cart.findIndex((p) => p.productId === product.id);

const submitable = () => computed(change >= 0 && cart.length > 0);

const dateFormat = (date) => {
  const formatter = new Intl.DateTimeFormat("id", {
    dateStyle: "short",
    timeStyle: "short",
  });
  return computed(formatter.format(date));
};

const submit = () => {
  let time = new Date();
  isShowModalReceipt = true;
  receiptNo = `TWPOS-KS-${Math.round(time.getTime() / 1000)}`;
  receiptDate = dateFormat(time);
};

const addQty = (item, qty) => {
  const index = cart.findIndex((i) => i.productId === item.productId);
  if (index === -1) {
    return;
  }
  const afterAdd = item.qty + qty;
  if (afterAdd === 0) {
    cart.value.splice(index, 1);
    clearSound();
  } else {
    cart[index].value.qty = afterAdd;
    beep();
  }
  updateChange();
};

const addToCart = (product) => {
  const index = findCartIndex(product);
  console.log(index);
  if (index === -1) {
    cart.push({
      productId: product.id,
      image: product.image,
      name: product.name,
      price: product.price,
      option: product.option,
      qty: 1,
    });
  } else {
    console.log("cart[index].qty += 1");
  }
  // beep();
  updateChange();
};

const printAndProceed = () => {
  const receiptContent = document.getElementById("receipt-content");
  const titleBefore = document.title;
  const printArea = document.getElementById("print-area");

  printArea.innerHTML = receiptContent.innerHTML;
  document.title = receiptNo;

  window.print();
  isShowModalReceipt = false;

  printArea.innerHTML = "";
  document.title = titleBefore;

  // TODO save sale data to database

  clear();
};
</script>
