import axios from "axios";
const getPrinterList = async () => {
  const baseUrl = process.env.VUE_APP_API_URL;
  try {
    // console.log("baseUrl", baseUrl);
    const response = await axios.get("/printers/");

    return response.data;
  } catch (err) {
    console.log("from getPrinterList Error", err);
  }
};

export default getPrinterList;
