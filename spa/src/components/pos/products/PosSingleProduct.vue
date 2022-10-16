<template>
  <div role="button" :title="product.name" @click="addProductToCart(product)">
    <div
      class="h-48 border border-aronium-700 py-2 px-2 w-full overflow-hidden bg-inherit text-aronium-white group-hover:opacity-75"
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
                {{ product.name }}
              </a>
            </h3>
            <p class="mt-1 text-sm">{{ product.color }}</p>
          </div>
          <p class="text-sm font-medium">
            {{ priceFormat(product.price) }}
          </p>
        </div>
      </div>
    </div>
    <modal-calculator
      v-if="openCalculator"
      :type="modalType"
      @add-result="addResult"
      @close="closeCalculator"
    ></modal-calculator>
    <div
      v-if="!isUsingDefaultQuantity"
      class="fixed w-96 h-56 bg-aronium-800 border border-aronium-500 p-3 mx-auto my-auto z-50"
    >
      <div class="flex flex-col justify-center items center w-full h-full">
        <input id="" v-model="quantity" type="text" name="" />
        <button @click="addQuantiy">Add</button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, nextTick } from "vue";
import { addToCart, priceFormat, activeOrderNumber } from "@/store/composables";
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
  setup() {
    const orderItem = {};
    const openCalculator = ref(false);
    const modalType = ref("");
    const isUsingDefaultQuantity = ref(true);
    const quantity = ref(0);
    const isPriceChangeAllowed = ref(false);
    const isTaxInclusivePrice = ref(false);
    const price = ref(0);

    const closeCalculator = () => (openCalculator.value = false);
    const addResult = (payload) => {
      if (payload.type === "Quantity") quantity.value = payload.value;
      if (payload.type === "Price") price.value = payload.value;
      openCalculator.value = false;
      addProductToCart();
    };

    const addQuantity = () => {
      modalType.value = "Quantity";
      openCalculator.value = false;
    };
    const addPrice = (price) => {};

    const addProductToCart = async (product) => {
      if (product) {
        orderItem.product = product;
        orderItem.id = product.id;
        orderItem.orderNumber = activeOrderNumber.value;
      }

      if (!quantity.value) {
        if (product && !product.is_using_default_quantity) {
          modalType.value = "Quantity";
          openCalculator.value = true;
          return;
        } else orderItem.quantity = 1;
      } else orderItem.quantity = quantity.value;

      if (!price.value) {
        if (product && product.is_price_change_allowed) {
          modalType.value = "Price";
          openCalculator.value = true;
          return;
        } else orderItem.price = product.price;
      } else orderItem.price = price.value;

      // if (!price.value) {
      //   orderItem.price = product.price;
      //   if (product.is_price_change_allowed) {
      //     modalType.value = "Price";
      //     openCalculator.value = true;
      //   }
      // }
      // await nextTick();

      if (product && product.is_tax_inclusive_price)
        alert(`Add price inclusive tax!! ${isTaxInclusivePrice.value}`);
      quantity.value = 0;
      price.value = 0;
      addToCart(orderItem);
    };

    return {
      addProductToCart,
      addQuantity,
      addPrice,
      priceFormat,
      addToCart,
      quantity,
      isUsingDefaultQuantity,
      openCalculator,
      closeCalculator,
      modalType,
      addResult,
    };
  },
};
</script>
