var path = require('path');

module.exports = {
  entry: './app/main.js',
  output: {
    path: './build',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: path.join(__dirname, 'app'), loader: 'babel-loader' }
    ]
  }
};
