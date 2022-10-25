import axios from "axios";
const getProducts = async (groupID = 0) => {
  const baseUrl = process.env.VUE_APP_API_URL;
  let keyword;

  groupID === 0 ? (keyword = "") : (keyword = `?group=${groupID}`);

  try {
    // console.log("baseUrl", baseUrl);

    const response = await axios.get(`${baseUrl}/product/all/${keyword}`);
    console.log(response.data);
    return response.data;
  } catch (err) {
    console.log("from getProducts Error", err);
  }
};

export default getProducts;
