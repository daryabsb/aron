import axios from "axios";
const getPrinterList = async () => {
  try {
    // console.log("baseUrl", baseUrl);
    const response = await axios.get("/printers/");

    return response.data;
  } catch (err) {
    console.log("from getPrinterList Error", err);
  }
};

export default getPrinterList;
