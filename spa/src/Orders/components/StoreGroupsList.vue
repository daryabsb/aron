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
        <li
          role="button"
          v-for="item in people"
          :key="item.email"
          class="col-span-1 flex flex-col divide-y divide-aronium-500 rounded-sm bg-aronium-700 border border-aronium-500 text-center shadow"
          @click="selectItem(item)"
        >
          <div class="flex flex-1 flex-col p-4">
            <img
              class="mx-auto h-32 w-32 flex-shrink-0 rounded-sm"
              :src="item.image"
              alt=""
            />
            <h3 class="mt-4 text-sm font-medium text-aronium-white">
              {{ item.name }}
            </h3>
            <dl class="mt-1 flex flex-grow flex-col justify-between">
              <dt class="sr-only">Title</dt>
              <dd class="text-sm text-gray-500">{{ item.title }}</dd>
            </dl>
          </div>
          <div>
            <div class="-mt-px flex divide-x divide-aronium-500">
              <div
                class="flex w-0 flex-1 text-aronium-white hover:text-pink-700"
              >
                <a
                  :href="`mailto:${item.email}`"
                  class="relative -mr-px inline-flex w-0 flex-1 items-center justify-center rounded-bl-sm border border-transparent py-2 text-sm font-medium"
                >
                  <EnvelopeIcon class="h-5 w-5" aria-hidden="true" />
                  <span class="ml-3">Email</span>
                </a>
              </div>
              <div
                class="-ml-px flex w-0 flex-1 text-aronium-white hover:text-pink-700"
              >
                <a
                  :href="`tel:${item.telephone}`"
                  class="relative inline-flex w-0 flex-1 items-center justify-center rounded-br-sm border border-transparent py-2 text-sm font-medium"
                >
                  <PhoneIcon class="h-5 w-5" aria-hidden="true" />
                  <span class="ml-3">Call</span>
                </a>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, defineAsyncComponent } from "vue";
import OrderItem from "@/Orders/OrderItem";
import NumericPad from "@/components/shared/calculator/NumericPad.vue";

import productsGroupsAPI from "@/services/productsGroupsAPI";
import { useOrderStore } from "@/Orders/ordersStore";
import { useFetch } from "@/stores/fetch";
import { EnvelopeIcon, PhoneIcon } from "@heroicons/vue/20/solid";

const pos = useOrderStore();
const addToCart = pos.addToCart;

const ProductSingleItem = defineAsyncComponent(() =>
  import("@/Orders/components/Cards/PosSingleProduct.vue")
);

const store = useFetch();
onMounted(store.fetchGroups);
const productGroups = ref([]);
const selectedGroupProducts = ref([]);

const loadProductGroups = async () => {
  try {
    const response = await productsGroupsAPI.getProductGroups();
    productGroups.value = response.data;

    return response.data;
  } catch (error) {
    console.log(error);
  }
};

const loadProductsByGroupId = async () => {
  try {
    const response = await productsGroupsAPI.getProductsByGroupId(id.value);
    selectedGroupProducts.value = response.data;
  } catch (error) {
    console.log(error);
  }
};
const parents = computed(() =>
  productGroups.value.filter((group) => group.is_parent === true)
);
const selectedGroup = computed(() =>
  productGroups.value.find((group) => group.id === id.value)
);

const back = () => {
  id.value = null;
};
loadProductGroups();

const id = ref(null);
const selectGroup = async (groupId) => {
  // if (id.value) id.value = 0;
  id.value = groupId;
  await loadProductGroups();
  await loadProductsByGroupId(groupId);
};
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

const selectItem = (item) => console.log(item);

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
    role: "==>",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  {
    name: "Jane Cooper",
    title: "Paradigm",
    role: "Admin",
    email: "janecooper@example.com",
    telephone: "+1-202-555-0170",
    image:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60",
  },
  // More people...
];
</script>
