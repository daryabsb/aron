<template>
  <div>
    <router-view :number="activeNumber"></router-view>
  </div>
</template>
<script setup>
// import { ref, defineAsyncComponent, computed, onMounted } from "vue";
// import { useRouter } from "vue-router";
// import { useModals } from "@/stores/modals";
// import { useOrderStore } from "@/Orders/ordersStore";
// import { getEvt } from "@/Orders/orderComposables";

// const store = useModals();
// window.onkeydown = (evt) => {
//   return getEvt(evt.key)();
// };
// const router = useRouter();

// const pos = useOrderStore();
// const activeNumber = computed(() => pos.activeNumber);
// onMounted(() => router.push(`/store/order/${activeNumber.value}`));

// const isSearchModal = ref(store.isSearchModal);
// const isPayment = ref(store.isPaymentModal);
// const isCashModal = ref(store.isCashModal);
// const isDiscount = ref(store.isStoreOrderDiscount);
// const clearCash = pos.clearCash;

// const searchModal = () => {
//   store.searchModal = !store.searchModal;
// };

// const cashModal = () => {
//   store.openCashModal = false;
// };

// const orderDiscountModal = () => {
//   store.openOrderDiscountModal = false;
// };

// const paymentModal = () => {
//   store.openPaymentModal = false;
//   clearCash();
// };
// const cashOut = () => {
//   paymentModal();
//   cashModal();
// };
</script>
