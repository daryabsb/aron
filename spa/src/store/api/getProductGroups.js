import axios from "axios";
const getProductGroups = async () => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    // console.log("baseUrl", baseUrl);
    const response = await axios.get(`${baseUrl}/product/groups/`);

    response.data.unshift({ id: 0, name: "All Products" });
    return response.data;
  } catch (err) {
    console.log("from getProducts Error", err);
  }
};

export default getProductGroups;
