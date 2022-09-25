<template>
  <div class="bg-pink-300 h-screen">
    <div class="flex items-center justify-center">
      <div class="py-14 text-center px-5 sm:px-0">
        <h2
          class="text-3xl sm:text-4xl text-white font-extrabold tracking-tight"
        >
          <span class="block">Increase your productivity.</span>
          <span class="block">Start using Workflow today.</span>
        </h2>
        <h2 class="text-gray-50 mt-5 tracking-wide text-sm sm:text-base">
          <span class="block"
            >Ac euismod vel sit maecenas id pellentesque eu sed
            consectetur.</span
          >
          <span class="block"
            >Malesuade adipiscing sagittis vel nulla nec.</span
          >
        </h2>
        <div
          class="relative flex items-center bg-white min-w-md mx-auto mt-12 overflow-hidden text-center rounded-lg border border-solid border-green-600"
        >
          <input
            v-model="key"
            type="text"
            placeholder="Enter a customer name or an order to start..."
            class="w-96 h-12 px-6 py-2 shadow-lg font-normal bg-white text-purple-700 outline-none"
          />
          <span class="relative top-0 right-0 block outline-none">
            <button
              type="button"
              class="inline-flex items-center w-32 h-12 px-8 text-base font-bold leading-6 text-white transition duration-150 ease-in-out bg-green-600 border border-transparent hover:bg-green-700 focus:outline-none active:bg-indigo-700"
              data-primary="indigo-600"
              data-primary-reset="{}"
              @click="navigateToPage"
            >
              Continue
            </button>
          </span>
        </div>
        <div class="illustration mt-5 mb-5">
          <img
            src="http://127.0.0.1:8000/media/img/landing.svg"
            alt="landing-image"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ref } from "vue";
import { useRouter } from "vue-router";
export default {
  setup() {
    const router = useRouter();
    const key = ref("");
    const navigateToPage = () => {
      const keyToLink = key.value.toLowerCase();
      // const url = `${baseUrl.slice(0, -3)}/${keyToLink}`;
      if (key.value != "") {
        router.push(`/${keyToLink}`);
      }
      router.push("/pos");
    };
    return {
      key,
      navigateToPage,
    };
  },
};
</script>
