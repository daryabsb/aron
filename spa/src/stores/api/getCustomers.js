import axios from "axios";
const getCustomers = async () => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    // console.log("baseUrl", baseUrl);
    const response = await axios.get(`${baseUrl}/customers/all/`);

    return response.data;
  } catch (err) {
    console.log("from getCustomers Error", err);
  }
};

export default getCustomers;
