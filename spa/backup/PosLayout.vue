<template>
  <div class="bg-blue-gray-50">
    <!-- noprint-area -->
    <div
      class="hide-print flex flex-row h-screen antialiased text-blue-gray-800"
    >
      <!-- left sidebar -->
      <pos-left-nav></pos-left-nav>

      <!-- page content -->
      <div class="flex-grow flex">
        <!-- store menu -->
        <store-menu></store-menu>
        <!-- end of store menu -->

        <!-- right sidebar -->
        <pos-right-nav></pos-right-nav>
        <!-- end of right sidebar -->
      </div>

      <!-- modal first time -->
      <modal-first-time></modal-first-time>

      <!-- modal receipt -->
      <modal-receipt></modal-receipt>
    <!-- end of noprint-area -->

    <div id="print-area" class="print-area"></div>
  </div>

  <!-- PAGE START OVER END -->
</template>

<script setup>
import PosLeftNav from "@/components/pos/PosLeftNav.vue";
import StoreMenu from "@/components/pos/StoreMenu.vue";
import PosRightNav from "@/components/pos/PosRightNav.vue";
import ModalFirstTime from "@/components/pos/ModalFirstTime.vue";
import ModalReceipt from "@/components/pos/ModalReceipt.vue"

import { ref, computed, onMounted, reactive } from "vue";
import { useStore } from "vuex";
import useGetProducts from "@/composables/useGetProducts";
import { useFetchProductsDispatch } from "@/store/composables";
import filteredProducts from "@/composables/useFilteredProducts";

import { UPDATE_KEYWORD, ADD_TO_CART } from "@/store/constants";

import {
  clear,
  submitable,
  priceFormat,
  numberFormat,
} from "@/store/composables";

const store = useStore();
// let db = null;
let time = ref(null);
//  let firstTime= localStorage.getItem("first_time") === null,
let activeMenu = "pos";
let loadingSampleData = false;
let firstTime = false;

let moneys = store.state.moneys;
let products = useGetProducts();
let keyword = store.state.keyword;
let cart = store.state.cart;
let cash = store.state.cash;
let change = store.state.change;
let isShowModalReceipt = false;
let receiptNo = null;
let receiptDate = ref(null);

onMounted(useFetchProductsDispatch);

const addToCart = (product) => {
  store.dispatch(ADD_TO_CART, product);
};

const closeModalReceipt = () => computed((isShowModalReceipt = false));
const updateKeyword = () => store.commit(UPDATE_KEYWORD(keyword));

const printAndProceed = () => {
  const receiptContent = document.getElementById("receipt-content");
  const titleBefore = document.title;
  const printArea = document.getElementById("print-area");

  printArea.innerHTML = receiptContent.innerHTML;
  document.title = receiptNo;

  window.print();
  isShowModalReceipt = false;

  printArea.innerHTML = "";
  document.title = titleBefore;

  // TODO save sale data to database

  clear();
};
</script>
