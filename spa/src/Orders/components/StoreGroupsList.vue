<template>
  <div>
    <!-- <numeric-pad @close="close" @get-value="getValue"></numeric-pad> -->
    <numeric-pad
      v-if="isCheckPriceOpen"
      @close="close"
      @get-value="getPrice"
    ></numeric-pad>
    <numeric-pad
      v-if="isDefaultQtyOpen"
      @close="close"
      @get-value="getQuantity"
    ></numeric-pad>
    <div class="overflow-auto scrollbar mt-5 px-3">
      <ul
        role="list"
        class="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5"
      >
        <template v-if="ids.length === 0">
          <StoreGroupListItem
            v-for="group in productGroups"
            :key="group.id"
            :item="group"
            @select-item="selectGroup(group.id)"
          />
        </template>
        <template v-else>
          <!-- v-for="group in selectedGroupProducts"
          :key="group.id" -->
          <StoreGroupListItem
            :item="selectedGroupProducts"
            @back="removeId"
            @select-item="selectGroup(group.id)"
          />
          <StoreGroupListItem
            v-for="group in selectedGroupProducts.groups"
            :key="group.id"
            :item="group"
            @back="removeId"
            @select-item="selectGroup(group.id)"
          />
        </template>
      </ul>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUpdated, defineAsyncComponent } from "vue";
import OrderItem from "@/Orders/OrderItem";
import NumericPad from "@/components/shared/calculator/NumericPad.vue";

import productsGroupsAPI from "@/services/productsGroupsAPI";
import { useOrderStore } from "@/Orders/ordersStore";
import { priceFormat, numberFormat } from "@/Orders/orderComposables";

import { useFetch } from "@/stores/fetch";
import {
  EnvelopeIcon,
  PhoneIcon,
  ArrowLeftIcon,
  ArrowRightIcon,
} from "@heroicons/vue/20/solid";

const pos = useOrderStore();
const addToCart = pos.addToCart;

const ProductSingleItem = defineAsyncComponent(() =>
  import("@/Orders/components/Cards/PosSingleProduct.vue")
);

const StoreGroupListItem = defineAsyncComponent(() =>
  import("@/Orders/components/StoreGroupsListItem.vue")
);

const store = useFetch();
const productGroups = ref([]);
const selectedGroupProducts = ref([]);

const ids = ref([]);

const loadProductGroups = async () => {
  try {
    const response = await productsGroupsAPI.getProductGroups();
    productGroups.value = response.data;
  } catch (error) {
    console.log(error);
  }
};
onMounted(loadProductGroups);
const id = computed(() => ids.value[ids.value.length - 1]);

const loadProductsByGroupId = async () => {
  try {
    const response = await productsGroupsAPI.filterGroups(id.value);
    selectedGroupProducts.value = response.data;
  } catch (error) {
    console.log(error);
  }
};
const selectGroup = async (groupId) => {
  // if (id.value) id.value = 0;
  ids.value.push(groupId);

  // await loadProductGroups();
};
onUpdated(() => loadProductsByGroupId());
const removeId = () => {
  ids.value.splice(-1);
};

// const parents = computed(() =>
//   productGroups.value.filter((group) => group.is_parent === true)
// );
// const selectedGroup = computed(() =>
//   productGroups.value.find((group) => group.id === id.value)
// );

// const back = () => {
//   id.value = null;
// };
// loadProductGroups();

// const id = ref(null);
const isNumpadOpen = ref(false);
const isCheckPriceOpen = ref(false);
const isDefaultQtyOpen = ref(false);
const isTaxInclusiveOpen = ref(false);
const order = ref(null);

const close = () => (isNumpadOpen.value = false);

// PREPARE PRODUCT TO ORDER
// 1. Add the clicked item to the created OrderItem
const createOrder = (item) => {
  order.value = new OrderItem(item);
  checkPrice(item);
};

// 2. Check the change price on the product

const checkPrice = (item) => {
  if (item.is_price_change_allowed) {
    isCheckPriceOpen.value = true;
    return;
  } else {
    checkQuantiy();
  }
};

// 3. Get the price and proceed with checkQuantity
const getPrice = (value) => {
  order.value.price = value;
  isCheckPriceOpen.value = false;
  checkQuantiy();
};

// 4. Check the is default quantity on the item
const checkQuantiy = () => {
  if (!order.value.product.is_using_default_quantity) {
    isDefaultQtyOpen.value = true;
    return;
  } else {
    // checkTaxInclusivePrice()
    addProductToCart();
  }
};
// 5. Get the quantity and proceed
const getQuantity = async (value) => {
  order.value.quantity = value;
  isDefaultQtyOpen.value = false;
  // checkTaxInclusivePrice()
  addProductToCart();
};
// 4. CHECK TAX TO BE ADDED LATER
const checkTaxInclusivePrice = () => {
  console.log("Tax Done");
};
// 5. Dispatch the order to cart =>>

const addProductToCart = () => {
  addToCart(order);
  // order = null;
};
const getValue = (value) => {
  console.log(value);
  close();
};

const selectItem = (item) => {
  ids.value.push(item.id);
  loadProductsByGroupId();
};

const people = [
  {
    id: 1,
    name: "Groceries",

    is_parent: true,
    color: "Transparent",
    image:
      "http://127.0.0.1:8000/media/uploads/productgroup/7cca1bc0-c167-4672-98e3-35db6f5840e6.jpg",
    rank: 0,
    created: "2022-09-13T19:46:50.013689Z",
    updated: "2022-09-13T19:46:50.013689Z",
  },
  {
    id: 1,
    name: "Groceries",
    parent_group: null,
    groups: [
      {
        id: 2,
        name: "Vegetables",
      },
      {
        id: 3,
        name: "Fruit",
      },
    ],
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image: "",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    price: 125,
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  // More people...
];
</script>
