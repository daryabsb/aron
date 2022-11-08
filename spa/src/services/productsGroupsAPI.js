import API from "./API";

export default {
  getProductGroups() {
    return API().get("/product/groups/");
  },
  getProductsByGroupId(groupId) {
    return API().get(`/product/all/?group=${groupId}`);
  },
  filterGroups(id) {
    return API().get(`/product/groups/?group=${id}`);
  },
};
