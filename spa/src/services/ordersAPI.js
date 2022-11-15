import API from "./API";

export default {
  getOrders() {
    return API().get("/orders/all/");
  },
  getSingleOrderItem(oid) {
    return API().get(`/orders/items/${oid}/`);
  },
  // getProductsByGroupId(groupId) {
  //   return API().get(`/product/all/?group=${groupId}`);
  // },
  // filterGroups(id) {
  //   return API().get(`/product/groups/?group=${id}`);
  // },
};
