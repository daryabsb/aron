import axios from "axios";
const getUser = async () => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    const response = await axios.get(`${baseUrl}/user/me/`);
    return response.data;
  } catch (err) {
    console.log("from getUser Error", err);
  }
};

export default getUser;
