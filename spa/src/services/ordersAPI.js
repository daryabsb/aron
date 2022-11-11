import API from "./API";

export default {
    getOrders() {
        return API().get("/orders/all/");
    },
    // getProductsByGroupId(groupId) {
    //   return API().get(`/product/all/?group=${groupId}`);
    // },
    // filterGroups(id) {
    //   return API().get(`/product/groups/?group=${id}`);
    // },
};