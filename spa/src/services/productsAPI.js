import API from "./API";

export default {
  getProducts() {
    return API().get("/product/all/");
  },
  getProductsByGroupId(groupId) {
    return API().get(`/product/all/?group=${groupId}`);
  },
  getSingleProduct(pid) {
    return API().get(`/product/all/${pid}/`);
  },
};
