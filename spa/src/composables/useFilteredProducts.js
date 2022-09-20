import { computed } from "vue";
import { useStore } from "vuex";
const filteredProducts = () => {
  const store = useStore();
  const rg = store.state.keyword ? new RegExp(store.state.keyword, "gi") : null;
  return store.state.products.filter((p) => !rg || p.name.match(rg));
};

export default filteredProducts;
