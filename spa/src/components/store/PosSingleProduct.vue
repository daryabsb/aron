<template>
  <div role="button" :title="product.name" @click="addProductToCart()">
    <div
      class="h-48 border border-aronium-500 py-2 px-2 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75"
    >
      <!-- class="h-48 aspect-w-1 border aspect-h-1 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75 lg:aspect-none" -->
      <div class="w-full h-32 border-b border-aronium-600">
        <img
          :src="product.image"
          :alt="product.name"
          class="h-full w-full object-contain object-center lg:h-full lg:w-full"
        />
        <div class="mt-2 flex justify-between">
          <div>
            <h3 class="text-sm">
              <a href="#">
                <span aria-hidden="true" class="absolute inset-0" />
                <span class="truncate">
                  {{ product.name }}
                </span>
              </a>
            </h3>
            <p class="mt-1 text-sm">{{ product.color }}</p>
          </div>
          <div class="relative">
            <p class="text-sm font-medium">
              {{ priceFormat(product.price) }}
            </p>
            <p
              v-if="product.stock_quantity"
              class="m-2 text-sm text-aronium-green"
            >
              {{ product.stock_quantity }}
            </p>
            <p v-else class="m-2 text-sm text-aronium-danger">
              Out of Stock
            </p>
          </div>
        </div>
      </div>
    </div>
    <!-- <modal-calculator
      v-if="isUsingDefaultQuantity"
      type="Quantity"
      @close="addQuantity, qty"
    ></modal-calculator>
    <modal-calculator
      v-if="isPriceChangeAllowed"
      type="Price"
      @close="addPrice, price"
    ></modal-calculator> -->
    <!-- <div
      v-if="!isUsingDefaultQuantity"
      class="fixed w-96 h-56 bg-aronium-800 border border-aronium-500 p-3 mx-auto my-auto z-50"
    >
      <div class="flex flex-col justify-center items center w-full h-full">
        <input id="" v-model="quantity" type="text" name="" />
        <button @click="addQuantiy">Add</button>
      </div>
    </div> -->
  </div>
</template>

<script>
import { ref, nextTick, reactive } from "vue";
import { priceFormat } from "@/store/composables";
import { usePos } from "@/stores/pos";
import ModalCalculator from "@/components/modals/ModalCalculator.vue";
export default {
  components: {
    ModalCalculator,
  },
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
    // const isTaxInclusivePrice = ref(false);

    // const checkQuantiy = () => {
    //   if (!quantity.value && !props.product.is_using_default_quantity) {
    //     isUsingDefaultQuantity.value = false;
    //   }
    //   quantity.value = 1;
    //   checkPrice();
    // };
    // const addQuantity = (qty) => {
    //   isUsingDefaultQuantity.value = true;
    //   console.log(qty);
    //   quantity.value = qty;
    //   checkPrice;
    // };
    // const checkPrice = () => {
    //   if (!price.value && props.product.is_price_change_allowed) {
    //     isPriceChangeAllowed.value = true;
    //   }
    //   price.value = props.product.price;
    //   checkTaxInclusive();
    // };
    // const addPrice = (selectedPrice) => {
    //   price.value = selectedPrice;
    //   isPriceChangeAllowed.value = false;
    //   checkTaxInclusive();
    // };
    // const checkTaxInclusive = () => {
    //   if (props.product.is_tax_inclusive_price) {
    //     isTaxInclusivePrice.value = true;
    //   }
    //   tax.value = 0;
    //   addProductToCart();
    // };
    // const addTaxInclusive = (selectedPrice) => {
    //   price.value = selectedPrice;
    //   isTaxInclusivePrice.value = false;
    //   addProductToCart();
    // };

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
      // checkQuantiy,
      // addQuantity,
      // checkPrice,
      // addPrice,
      // checkTaxInclusive,

      // addTaxInclusive,
    };
  },
};
</script>
