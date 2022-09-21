import { computed } from "vue";
import { useStore } from "vuex";

const useORderItems = () => {

    return computed(() => {
        const store = useStore()
            // console.log("GET_USER", store.getters.GET_USER);
        return store.getters.GET_ORDER_ITEMS
    });
}
export default useORderItems;