const { defineConfig } = require("@vue/cli-service");
module.exports = defineConfig({
  transpileDependencies: true,
});
module.exports = {
  publicPath:
    process.env.NODE_ENV === "production"
      ? "/static/dist/"
      : "http://127.0.0.1:8081",
  outputDir: "../static/dist",
  indexPath: "../../templates/index.html",
  pages: {
    index: {
      entry: "src/main.js",
      title: "ARON - POS",
    },
  },
  devServer: {
    devMiddleware: {
      publicPath: "http://127.0.0.1:8081",
      writeToDisk: (filePath) => filePath.endsWith("index.html"),
    },
    hot: true,
    headers: { "Access-Control-Allow-Origin": "*" },
  },
};
