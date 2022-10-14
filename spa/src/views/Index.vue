<template>
  <div class="fixed text-center bg-aronium-800 overflow-none h-screen w-screen">
    <div
      class="mx-auto my-auto flex flex-col items-center justify-center w-[33vw]"
    >
      <div class="illustration mt-5 mb-5">
        <img
          src="http://127.0.0.1:8000/media/img/landing.svg"
          alt="landing-image"
        />
      </div>
      <h2 class="text-4xl text-aronium-white font-light font-sans">
        Order number or customer name
      </h2>
      <div
        class="relative flex items-center min-w-md mx-auto mt-12 w-full overflow-auto text-center border border-aronium-500 text-aronium-white"
      >
        <input
          v-model="key"
          type="text"
          placeholder="Enter a customer name or an order to start..."
          class="w-full h-12 px-6 py-2 shadow-lg font-normal bg-inherit text-aronium-white border-0 outline-none focus:ring-0"
        />
        <span class="relative top-0 right-2 block outline-none ring-0">
          <i class="fa fa-pencil"></i>
        </span>
      </div>
      <ul class="flex">
        <li>
          <Button variant="green" @click="findOrderOrCustomer">Continue</Button>
          <button class=""></button>
        </li>
        <li>
          <Button variant="red" @click.prevent="addNewCart">Cancel</Button>
          <button class=""></button>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import { ref, onMounted } from "vue";
import { useFetchUserDispatch } from "@/store/composables";
import { createCart } from "@/store/composables";
import { useRouter } from "vue-router";
import Button from "@/components/shared/Button.vue";
export default {
  components: {
    Button,
  },
  setup() {
    // const { createCart } = usePos;
    const router = useRouter();
    onMounted(useFetchUserDispatch);
    const addNewCart = () => {
      createCart();
      router.push("/pos");
    };
    const key = ref("");
    const navigateToPage = () => {
      // const url = `${baseUrl.slice(0, -3)}/${keyToLink}`;
      console.log(key.value);
      if (key.value === "management") {
        router.push("/management");
      }
      router.push("/pos");
    };
    const findOrderOrCustomer = (number) => {
      if (!number) {
        addNewCart();
      }
      alert("Sorry, we don't the requested query!");
      addNewCart();
    };
    return {
      key,
      navigateToPage,
      addNewCart,
      findOrderOrCustomer,
    };
  },
};
</script>
