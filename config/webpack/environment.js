const { environment } = require('@rails/webpacker')

const webpack = require('webpack');
const dotenv = require('dotenv');

const dotenvFiles = [
  `.env.${process.env.NODE_ENV}.local`,
  '.env.local',
  `.env.${process.env.NODE_ENV}`,
  '.env'
];

dotenvFiles.forEach((dotenvFile) => {
  dotenv.config({ path: dotenvFile, silent: true })
})

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

environment.plugins.prepend('env',
  new webpack.DefinePlugin({
    'NODE_ENV': JSON.stringify(process.env.NODE_ENV)
  })
);

// environment.plugins.prepend('Environment', 
//   new webpack.EnvironmentPlugin(JSON.parse(JSON.stringify(process.env)))
// );

module.exports = environment
