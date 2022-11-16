import API from "./API";

export default {
  getOrders() {
    return API().get("/orders/all/");
  },
  getSingleOrderItem(oid) {
    return API().get(`/orders/items/${oid}/`);
  },
  getNumber(target) {
    return API().get(`/orders/number/?target=${target}`);
  },
  // getProductsByGroupId(groupId) {
  //   return API().get(`/product/all/?group=${groupId}`);
  // },
  // filterGroups(id) {
  //   return API().get(`/product/groups/?group=${id}`);
  // },
};
