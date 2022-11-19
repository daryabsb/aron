import API from "./API";

export default {
  getVAT() {
    return API().get("/taxes/all/?key=vat");
  },
};
