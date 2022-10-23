import { ref } from "vue";
import dataLabels from "chartjs-plugin-datalabels";
import { useModals } from "@/stores/modals";

export const sideBArNavItems = [
  {
    id: 1,
    name: "Dashboard",
    link: "/management/dashboard",
    icon: "fas fa-tv mr-2 text-sm",
  },
  {
    id: 2,
    name: "Documents",
    link: "/management/documents",
    icon: "fas fa-tools mr-2 text-sm",
  },
  {
    id: 3,
    name: "Products",
    link: "/management/products",
    icon: "fas fa-tags mr-2 text-sm",
  },
  {
    id: 4,
    name: "Stocks",
    link: "/management/stocks",
    icon: "fas fa-map-marked mr-2 text-sm",
  },
  {
    id: 5,
    name: "Pos",
    link: "/pos",
    icon: "fas fa-tags text-blueGray-300 mr-2 text-sm",
  },
];

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

export const posHeaderItems = [
  {
    id: 1,
    title: "Search",
    icon: " fa fa-search",
    submit: (title, item) => {
      const store = useModals();
      console.log(store.searchModal);
      store.searchModal = true;
      console.log(store.searchModal);
    },
  },
  {
    id: 2,
    title: "Transfer",
    icon: "fa-sharp fa-solid fa-money-bill-transfer",
    submit: (emit, title) => {
      emit("open", title);
      // cnx.emit("open", title);
    },
  },
  {
    id: 3,
    title: "Discount",
    icon: "fa fa-percent",
    submit: (title, item) => {
      console.log(title, item);
    },
  },
  {
    id: 4,
    title: "New sale",
    icon: "fa fa-plus",
    submit: (title, item) => {
      console.log(title, item);
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

const dataForChart = (year) => {
  if (year === 1980) {
    return [65, 59, 80, 81, 56, 55, 40, 10, 25, 92, 12, 43];
  }
  if (year === 1981) {
    return [47, 85, 36, 22, 14, 100, 71, 19, 96, 92, 46, 30];
  }
  if (year === 1982) {
    return [65, 59, 80, 81, 56, 55, 40, 10, 25, 92, 12, 43];
  }
  if (year === 1983) {
    return [65, 59, 80, 81, 56, 55, 40, 10, 25, 92, 12, 43];
  }
};

export const lineChart = {
  type: "bar",
  // locally registered and available for this chart
  plugins: [dataLabels],
  data: {
    labels: [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ],
    datasets: [
      {
        label: "Caffine Consumption",
        // data: [65, 59, 80, 81, 56, 55, 40, 10, 25, 92, 12, 43],
        data: dataForChart(1982),
        fill: false,
        borderColor: "#888888",
        backgroundColor: "#ffffff",
      },
      // {
      //   label: "Productivity",
      //   data: [70, 25, 110, 90, 5, 60, 30],
      //   fill: false,
      //   borderColor: "#00D8FF",
      //   tension: 0.5,
      //   backgroundColor: "purple",
      // },
    ],
  },
  options: {
    plugins: {
      zoom: {
        zoom: {
          wheel: {
            enabled: true,
          },
          pinch: {
            enabled: true,
          },
          mode: "y",
        },
      },
      datalabels: {
        backgroundColor: function (context) {
          console.log(context);
          return context.dataset.backgroundColor;
        },
        borderRadius: 4,
        borderColor: "#888888",
        strokeStyle: "#888888",
        color: "white",
        font: {
          weight: "bold",
        },
        formatter: Math.round,
        padding: 6,
      },
    },
  },
};
