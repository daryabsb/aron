<template>
  <modal-small>
    <template #modal-content>
      <products-modal-new-group
        v-if="modalType === 'New Group'"
        @close="close"
      ></products-modal-new-group>
      <products-modal-new-product
        v-if="modalType === 'New Product'"
        @close="close"
      ></products-modal-new-product>
    </template>
  </modal-small>
</template>
<script>
import { ref, onMounted } from "vue";
import ModalSmall from "@/components/shared/ModalSmall.vue";
import ProductsModalNewGroup from "@/components/modals/products/ProductsModalNewGroup.vue";
import ProductsModalNewProduct from "@/components/modals/products/ProductsModalNewProduct.vue";

import { useFetchProductGroupsDispatch } from "@/store/composables";
import useGetProductGroups from "@/composables/useGetProductGroups";

export default {
  components: {
    ModalSmall,
    ProductsModalNewGroup,
    ProductsModalNewProduct,
  },
  props: {
    modalType: {
      type: String,
      required: true,
    },
  },
  emits: ["close"],
  setup(props, { emit }) {
    onMounted(useFetchProductGroupsDispatch);
    const close = () => {
      emit("close");
    };
    return { useGetProductGroups, close };
  },
};
</script>
