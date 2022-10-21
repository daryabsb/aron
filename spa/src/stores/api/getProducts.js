import axios from "axios";
const getProducts = async () => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    // console.log("baseUrl", baseUrl);

    const response = await axios.get(`${baseUrl}/product/all/`);

    return response.data;
  } catch (err) {
    console.log("from getProducts Error", err);
  }
};

export default getProducts;
