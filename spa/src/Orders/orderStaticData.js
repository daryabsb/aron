import { useOrderStore } from "@/Orders/ordersStore";
import { useModals } from "@/stores/modals";

const mods = useModals();
const store = useOrderStore();

export const storeHeaderItems = [
  {
    id: 1,
    title: "Search",
    icon: " fa fa-search",
    submit: (title, item) => {
      mods.searchModal = true;
    },
  },
  {
    id: 2,
    title: "Transfer",
    icon: "fa-sharp fa-solid fa-money-bill-transfer",
    submit: (emit, title) => {
      emit("open", title);
    },
  },
  {
    id: 3,
    title: "Discount",
    icon: "fa fa-percent",
    submit: (title, item) => {
      mods.openOrderDiscountModal = true;
    },
  },
  {
    id: 4,
    title: "New sale",
    icon: "fa fa-plus",
    submit: (title, item) => {
      store.createCart();
    },
  },
  {
    id: 5,
    title: "Refund",
    icon: "fa fa-sack-dollar",
    submit: (emit, title) => {
      emit("open", title);
    },
  },
  {
    id: 6,
    title: "Cash drawer",
    icon: "fa fa-cash-register",
    submit: (emit, title) => {
      emit("open", title);
    },
  },
];
