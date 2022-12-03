import API from "./API";

export default {
  getLoggedInUser() {
    return API().get("/user/me/");
  },
  getCashRegister() {
    return API().get("/orders/counters/");
  },
  // getProductsByGroupId(groupId) {
  //   return API().get(`/product/all/?group=${groupId}`);
  // },
  // filterGroups(id) {
  //   return API().get(`/product/groups/?group=${id}`);
  // },
};
