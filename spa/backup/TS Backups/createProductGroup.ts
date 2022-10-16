import axios from "axios";
const createProductGroup = async (group) => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    const response = await axios.post(`${baseUrl}/product/groups/`, group);

    return response.data;
  } catch (err) {
    console.log("from createProductGroup Error", err);
  }
};

export default createProductGroup;
