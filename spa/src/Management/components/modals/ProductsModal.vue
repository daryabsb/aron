<template>
  <slide-modal :size="size" :open="open" @close="closePanel">
    <template #title>
      {{ modalType }}
    </template>
    <template #content>
      <!-- <div
        class="h-full text-aronium-white border-2 border-dashed border-gray-200"
        aria-hidden="true"
      >
        THIS IS MY CONTENT
      </div> -->
      <component :is="component" />
    </template>
  </slide-modal>
</template>

<script setup>
import { ref, computed, defineEmits, defineProps } from "vue";
import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import { XMarkIcon } from "@heroicons/vue/24/outline";
import SlideModal from "@/components/shared/SlideModal.vue";
import ProductsModalNewGroup from "@/components/modals/products/ProductsModalNewGroup.vue";
import ProductsModalNewProduct from "@/components/modals/products/ProductsModalNewProduct.vue";

import { useFetchProductGroupsDispatch } from "@/store/composables";
import useGetProductGroups from "@/composables/useGetProductGroups";

const props = defineProps({
  modalType: {
    type: String,
    required: true,
  },
  open: {
    type: Boolean,
    defaule: false,
  },
});

// const open = ref(props.openPanel);
const emit = defineEmits(["close"]);
const size = computed(() => (props.modalType == "New Product" ? "2xl" : "md"));

const component = computed(() => {
  if (props.modalType == "New Product") {
    return ProductsModalNewProduct;
  } else {
    return ProductsModalNewGroup;
  }
});

useFetchProductGroupsDispatch();

const closePanel = () => {
  emit("close");
  open.value = false;
};
</script>
