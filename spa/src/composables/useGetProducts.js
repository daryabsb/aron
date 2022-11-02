import { computed } from "vue";
import { useStore } from "vuex";

const useGetProducts = () => {
  return computed(() => {
    const store = useStore();
    return store.getters.GET_PRODUCTS;
  });
};
export default useGetProducts;
