import { computed } from "vue";
import { useStore } from "vuex";

const useGetUser = () => {
  return computed(() => {
    const store = useStore();
    return store.getters.GET_USER;
  });
};
export default useGetUser;
