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
