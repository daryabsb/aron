import axios from "axios";
const getStockList = async (groupId = 0) => {
  try {
    // console.log("baseUrl", baseUrl);
    let searchKey = null;
    if (groupId === 0 || !groupId) {
      searchKey = `?group=${groupId}/`;
    }
    const response = await axios.get(`/product/stocks/${searchKey}`);

    return response.data;
  } catch (err) {
    console.log("from getStockList Error", err);
  }
};

export default getStockList;
