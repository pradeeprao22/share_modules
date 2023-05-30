const path    = require("path")
const webpack = require("webpack")

module.exports = {
  mode: "production",
  devtool: "source-map",

  // Other webpack configurations...
  module: {
    rules: [
      // Other rules...
      // Add the CSS loader configuration
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },

  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
    filename: "[name].js",
    sourceMapFilename: "[file].map",
    path: path.resolve(__dirname, "app/assets/builds"),
  },
  plugins: [
    // adding jquery
    new webpack.ProvidePlugin({
      $: "jquery",
      "jquery": "jquery",
      "window.jQuery": "jquery"
    }),
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1
    })
  ]
}
