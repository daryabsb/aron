<template>
  <modal-small>
    <template #modal-content>
      <aronium-modal-new-group
        v-if="modalType === 'New Group'"
        :groups="useGetProductGroups"
        :modal-type="modalDataModule"
        @close="close"
      ></aronium-modal-new-group>
      <aronium-modal-new-product
        v-if="modalType === 'New Product'"
        @close="close"
      ></aronium-modal-new-product>
    </template>
  </modal-small>
</template>
<script>
import { ref, onMounted } from "vue";
import ModalSmall from "@/components/shared/ModalSmall.vue";
import AroniumModalNewGroup from "@/components/modals/AroniumModalNewGroup.vue";
import AroniumModalNewProduct from "@/components/modals/AroniumModalNewProduct.vue";

import { useFetchProductGroupsDispatch } from "@/store/composables";
import useGetProductGroups from "@/composables/useGetProductGroups";

export default {
  components: {
    ModalSmall,
    AroniumModalNewGroup,
    AroniumModalNewProduct,
  },
  props: {
    modalType: {
      type: String,
      required: true,
    },
    // groups: {
    //   type: Object,
    //   required: true,
    // },
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
