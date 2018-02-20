import webpack from 'webpack';
import WebpackNotifierPlugin from 'webpack-notifier';
import path from 'path';

// react components directory
const COMPONENTS_PATH = path.join(__dirname, 'app/assets/javascripts/app');
const ProvidePlugin = require('webpack/lib/ProvidePlugin');
const env = process.env.NODE_ENV || 'development';
const config = {
    // TODO: Add common Configuration
    module: {},
};


postcss: [require('autoprefixer')]; // this is inside module.exports object
const frontend = Object.assign({}, config,{
  context: COMPONENTS_PATH,
  entry: {
    app: ['./global.js',  'isotope-layout', 'isotope-packery', 'masonry-layout']
  },
  output: {
    path: path.join(__dirname, 'app/assets/javascripts/'),
    filename: 'frontend.js'
  },
  devtool: 'source-map',
  module: {
    rules: [{
        test: /.js$/,
        exclude: /node_modules/,
        use: ['babel-loader']
      },
      /*
       * Font loaders, required for font-awesome-sass-loader and bootstrap-loader
       */
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "url-loader?limit=10000&mimetype=application/font-woff"
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "file-loader"
      },
    ]
  },
  resolve: {
    alias: {
      masonry: 'masonry-layout',
      isotope: 'isotope-layout'
    },
    extensions: [
      '.jsx',
      '.js'
    ],
    modules: [
     COMPONENTS_PATH,
     "node_modules"
    ]
  },
  plugins: [
    new webpack.NoEmitOnErrorsPlugin(),
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify(env)
      }
    }),
    new WebpackNotifierPlugin(),
    new webpack.ProvidePlugin({
      Isotope: "isotope-layout"
    }),
  ]
});

const backend = Object.assign({}, config, {
  context: COMPONENTS_PATH,
  entry: {
    app: ['../admin/global.js']
  },
  output: {
    path: path.join(__dirname, 'app/assets/javascripts/admin/'),
    filename: 'backend.js'
  },
  devtool: 'source-map',
  module: {
    rules: [{
        test: /.js$/,
        exclude: /node_modules/,
        use: ['babel-loader']
      },
      /*
       * Font loaders, required for font-awesome-sass-loader and bootstrap-loader
       */
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "url-loader?limit=10000&mimetype=application/font-woff"
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "file-loader"
      },
    ]
  },
  resolve: {
    alias: {
      masonry: 'masonry-layout',
      isotope: 'isotope-layout'
    },
    extensions: [
      '.jsx',
      '.js'
    ],
    modules: [
     COMPONENTS_PATH,
     "node_modules"
    ]
  },
  plugins: [
    new webpack.NoEmitOnErrorsPlugin(),
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify(env)
      }
    }),
    new WebpackNotifierPlugin(),
  ]
});
// bundle (rails assets file)
// Return Array of Configurations
module.exports = [
    backend, frontend,
];
