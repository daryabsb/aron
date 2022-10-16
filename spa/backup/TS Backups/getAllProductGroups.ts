import axios from "axios";
const getAllProductGroups = async () => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    // console.log("baseUrl", baseUrl);
    const response = await axios.get(`${baseUrl}/product/all-groups/`);
    return response.data;
  } catch (err) {
    console.log("from getAllProductGroups Error", err);
  }
};

export default getAllProductGroups;
