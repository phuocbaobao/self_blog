const CompressionPlugin = require("compression-webpack-plugin")

module.exports = {
  configureWebpack: config => {
    if (process.env.NODE_ENV === "production") {
      config.plugins.push(
        new CompressionPlugin({
          filename: "[path][base].br",
          algorithm: "brotliCompress",
          exclude: "index.html"
        })
      )
    }
  },
  assetsDir: "static",
  transpileDependencies: ["vuetify"]
}
