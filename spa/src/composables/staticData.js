import { ref } from "vue";

export const productsMenu = [
  {
    id: 1,
    title: "Refresh",
    icon: " fa-solid fa-rotate fa-2x",
    submit: (title, item) => {
      console.log(title, item);
      location.reload();
    },
  },
  {
    id: 2,
    title: "New Group",
    icon: "fa fa-folder-plus fa-2x",
    submit: (emit, title) => {
      emit("open", title);
      // cnx.emit("open", title);
    },
  },
  {
    id: 3,
    title: "Edit Group",
    icon: "fa-solid fa-pen-to-square fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 4,
    title: "Delete Group",
    icon: "fa fa-folder-minus fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 5,
    title: "New Product",
    icon: "fa fa-plus fa-2x",
    submit: (emit, title) => {
      emit("open", title);
    },
  },
  {
    id: 6,
    title: "Edit Prod.",
    icon: "fa fa-pen fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 7,
    title: "Delete Prod.",
    icon: "fa fa-trash fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 8,
    title: "Print",
    icon: "fa fa-print fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 9,
    title: "Save Pdf",
    icon: "fa fa-file-pdf fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 10,
    title: "Price Tags",
    icon: "fa-solid fa-hashtag fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 11,
    title: "Sorting",
    icon: "fa fa-arrow-down-wide-short fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 12,
    title: "mov.avg.price",
    icon: "fa fa-money-bill-trend-up fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 13,
    title: "Import",
    icon: "fa fa-arrow-down fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 14,
    title: "Export",
    icon: "fa fa-arrow-up fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 15,
    title: "Help",
    icon: "fa fa-circle-question fa-2x",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
];

export const productsCreateTabsTitles = ref({
  first: [
    {
      id: 1,
      title: "Details",
      disabled: false,
    },
    {
      id: 2,
      title: "Prices & tax",
      disabled: false,
    },
    {
      id: 3,
      title: "Stock control",
      disabled: false,
    },
  ],
  second: [
    {
      id: 4,
      title: "Comments",
      disabled: true,
    },
    {
      id: 5,
      title: "Print stations",
      disabled: true,
    },
    {
      id: 6,
      title: "Image & color",
      disabled: true,
    },
  ],
});

export const colors = {
  black: "#000",
  white: "#fff",

  zinc: "#18181b",

  stone: "#1c1917",
  red: "#7f1d1d",
  orange: "#7c2d12",

  yellow: "#713f12",
  lime: "#365314",
  green: "#14532d",
  emerald: "#064e3b",
  teal: "#134e4a",
  cyan: "#164e63",
  sky: "#0c4a6e",
  blue: "#1e3a8a",
  indigo: "#312e81",
  violet: "#4c1d95",
  purple: "#581c87",
  fuchsia: "#701a75",
  pink: "#831843",
  rose: "#881337",
  lightBlue: "#0c4a6e",

  blueGray: "#0f172a",
};
