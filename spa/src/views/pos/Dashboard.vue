<script setup>
import PosRightNav from "@/components/pos/PosRightNav.vue";
// import StoreMenu from "@/components/pos/StoreMenu.vue";
import { ref, computed, onMounted, reactive } from "vue";
import axios from "axios";
let db = null;
let time = null;
//  let firstTime= localStorage.getItem("first_time") === null,
let activeMenu = "pos";
let loadingSampleData = false;
let firstTime = true;

let moneys = reactive([2000, 5000, 10000, 20000, 50000, 100000]);
let products = reactive([]);
let keyword = ref("");
let cart = [];
let cash = 0;
let change = 0;
let isShowModalReceipt = false;
let receiptNo = null;
let receiptDate = null;

const setFirstTime = (firstOpen) => {
  firstTime = firstOpen;
};

const startBlank = () => setFirstTime(false);

const startWithSampleData = async () => {
  // const response = await fetch("@/assets/data/sample.json");
  const response = await axios.get("http://127.0.0.1:8000/api/product/all/");
  products.value = response.data;
  console.log("products", products);
  // setFirstTime(false);
};
onMounted(startWithSampleData);

const closeModalReceipt = () => computed((isShowModalReceipt = false));

const numberFormat = (number) => {
  return computed(
    (number || "")
      .toString()
      .replace(/^0|\./g, "")
      .replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
  );
};

const getTotalPrice = () => {
  return computed(
    cart.reduce((total, item) => total + item.qty * item.price, 0)
  );
};
const playSound = (src) => {
  const sound = new Audio();
  sound.src = src;
  sound.play();
  // sound.onended = () => delete(sound);
};
const updateChange = () => computed((change = cash - getTotalPrice()));
const clearSound = () => computed(playSound("sound/button-21.mp3"));

const clear = () => {
  cash = 0;
  cart = [];
  receiptNo = null;
  receiptDate = null;
  updateChange();
  clearSound();
};

const beep = () => computed(playSound("sound/beep-29.mp3"));

const updateCash = (value) => {
  cash = parseFloat(value.replace(/[^0-9]+/g, ""));
  updateChange();
};

const getItemsCount = () =>
  computed(cart.reduce((count, item) => count + item.qty, 0));

const addCash = (amount) => {
  cash = (cash || 0) + amount;
  updateChange();
  beep();
};

const filteredProducts = () => {
  console.log("filteredProducts", products);
  const rg = keyword.value ? new RegExp(keyword.value) : null;
  // return computed(() => products.filter((p) => !rg || p.name.match(rg)));
  if (rg) {
    console.log("rg", rg);
    return products.value.filter((p) => !rg || p.name.match(rg));
  } else {
    console.log("computed", products.value);
    return products;
  }
};

const priceFormat = (number) =>
  computed(number ? `Rp. ${numberFormat(number)}` : `Rp. 0`);

const findCartIndex = (product) =>
  computed(cart.findIndex((p) => p.productId === product.id));

const submitable = () => computed(change >= 0 && cart.length > 0);

const dateFormat = (date) => {
  const formatter = new Intl.DateTimeFormat("id", {
    dateStyle: "short",
    timeStyle: "short",
  });
  return computed(formatter.format(date));
};

const submit = () => {
  let time = new Date();
  isShowModalReceipt = true;
  receiptNo = `TWPOS-KS-${Math.round(time.getTime() / 1000)}`;
  receiptDate = dateFormat(time);
};

const addQty = (item, qty) => {
  const index = cart.findIndex((i) => i.productId === item.productId);
  if (index === -1) {
    return;
  }
  const afterAdd = item.qty + qty;
  if (afterAdd === 0) {
    cart.splice(index, 1);
    clearSound();
  } else {
    cart[index].qty = afterAdd;
    beep();
  }
  updateChange();
};

const addToCart = (product) => {
  const index = findCartIndex(product);
  if (index === -1) {
    cart.push({
      productId: product.id,
      image: product.image,
      name: product.name,
      price: product.price,
      option: product.option,
      qty: 1,
    });
  } else {
    cart[index].qty += 1;
  }
  beep();
  updateChange();
};

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
<template>
  <!-- page content -->
  <div class="flex-grow flex"></div>
  <!-- end of noprint-area -->
</template>
