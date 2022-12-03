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
  submitOrder(data) {
    return API().post("/orders/all/", data);
  },

  submitOrderItem(data) {
    return API().post("/orders/items/", data);
  },

  // PAYMENT CALLS
  getPaymentTypes() {
    return API().get("/orders/payment-types/");
  },
  // getProductsByGroupId(groupId) {
  //   return API().get(`/product/all/?group=${groupId}`);
  // },
  // filterGroups(id) {
  //   return API().get(`/product/groups/?group=${id}`);
  // },
};
