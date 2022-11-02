import { computed } from "vue";
import { useStore } from "vuex";

const useORderItems = () => {
  return computed(() => {
    const store = useStore();
    return store.getters.GET_ORDER_ITEMS;
  });
};
export default useORderItems;
