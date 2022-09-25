import axios from "axios";
const getUser = async () => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    // console.log("baseUrl", baseUrl);
    const response = await axios.get(`${baseUrl}/user/me/`);
    console.log("getUser", response.data);
    return response.data;
  } catch (err) {
    console.log("from getUser Error", err);
  }
};

export default getUser;
