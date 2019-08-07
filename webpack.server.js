const path = require('path'),
      webpack = require('webpack'),
      nodeExternals = require('webpack-node-externals')

module.exports = {
  mode: 'production',
  target: 'node',
  externals: [nodeExternals()],
  entry: ['./server/SDCserver.js'],
  output: {
    path: path.resolve(__dirname + '/server'),
    filename: 'serverSSR.js',
    publicPath: '/'
  },
  module: {
    rules: [
      {
        test: /.js$/,
        loader: 'babel-loader',
        include: path.resolve(__dirname, 'client'),
        exclude: '/node_modules/',
        options: {
          presets: [['env', { modules: false }, 'react']],
          plugins: [
            ['transform-object-rest-spread', { useBuildIns: true }],
            'transform-class-properties'
          ]
        }
      },
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
      },
      {
        test: /\.scss$/,
        loader: 'ignore-loader'
      },
      {
        test: /\.css$/,
        loader: 'ignore-loader'
      },
      {
        test: /\.(jpg|png|svg|gif|pdf)$/,
        loader: 'file-loader',
        options: {
          name: '[path][name].[ext]'
        }
      }
    ]
  }
}