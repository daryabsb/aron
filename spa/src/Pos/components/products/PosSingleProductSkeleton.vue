<template>
  <div role="block button">
    <div
      class="h-48 border border-aronium-700 py-2 px-2 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75"
    >
      <!-- class="h-48 aspect-w-1 border aspect-h-1 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75 lg:aspect-none" -->
      <div class="w-full h-32 border-b border-aronium-600">
        <div
          class="bg- aronium-400 h-full w-full object-contain object-center lg:h-full lg:w-full"
        />
        <div class="mt-2 flex justify-between">
          <div>
            <h3 class="text-sm">
              <a href="#">
                <span aria-hidden="true" class="absolute inset-0" />
                <span class="truncate">
                  Product is loading...
                </span>
              </a>
            </h3>
            <p class="bg-aronium-400 mt-1 text-sm"></p>
          </div>
          <div class="relative">
            <p class="bg-aronium-400 px-8 text-sm font-medium"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { priceFormat } from "@/store/composables";
import { usePos } from "@/stores/pos";
export default {
  components: {},
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
  setup(props) {
    const store = usePos();
    const addToCart = store.addToCart;
    const openCalculator = ref(false);

    const quantity = ref(0);

    const isUsingDefaultQuantity = ref(false);
    const isPriceChangeAllowed = ref(false);

    const addProductToCart = () => {
      addToCart(props.product, 1, props.product.price, 0);
    };

    return {
      addProductToCart,
      priceFormat,
      addToCart,
      quantity,
      isUsingDefaultQuantity,
      isPriceChangeAllowed,
      openCalculator,
    };
  },
};
</script>
