import { computed } from "vue";
import store from "@/store";
const useGetProductGroups = computed(() => store.getters.GET_PRODUCT_GROUPS);
export default useGetProductGroups;
