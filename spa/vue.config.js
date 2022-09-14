const { defineConfig } = require("@vue/cli-service");
module.exports = defineConfig({
  transpileDependencies: true,
});
module.exports = {
  publicPath:
    process.env.NODE_ENV === "production"
      ? "/static/dist/"
      : process.env.PUBLIC_PATH,
  outputDir: "../static/dist",
  indexPath: "../../templates/index.html",
  pages: {
    index: {
      entry: "src/main.ts",
      title: "ARON - POS",
    },
  },
  devServer: {
    devMiddleware: {
      publicPath: process.env.PUBLIC_PATH,
      writeToDisk: (filePath) => filePath.endsWith("index.html"),
    },
    hot: true,
    headers: { "Access-Control-Allow-Origin": "*" },
  },
};
