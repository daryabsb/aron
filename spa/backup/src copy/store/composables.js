// import { computed } from "vue";
import { useStore } from "vuex";

import { FETCH_USER } from "@/store/constants";

/* ACTIONS */
export const useFetchUserDispatch = () => {
    const store = useStore();
    store.dispatch(FETCH_USER);
};