#!/usr/bin/env bash

# Configuration Files (place in curly braces for readability)
babel_config="{
  presets: [
    [
      '@babel/preset-env',
      {
        'targets': {
          'node': 'current'
        }
      }
    ]
  ]
}"

package_config='{
  "scripts": {
    "lint": "./node_modules/.bin/eslint",
    "check-lint": "lint [0-9]*.js",
    "dev": "npx babel-node",
    "test": "jest",
    "full-test": "./node_modules/.bin/eslint [0-9]*.js && jest"
  },
  "devDependencies": {
    "@babel/core": "^7.6.0",
    "@babel/preset-env": "^7.6.0",
    "@babel/node": "^7.8.0",
    "eslint": "^6.4.0",
    "eslint-config-airbnb-base": "^14.0.0",
    "eslint-plugin-import": "^2.18.2",
    "eslint-plugin-jest": "^22.17.0",
    "jest": "^24.9.0"
  }
}'

eslintrc_config="{
  'env': {
    'browser': false,
    'es6': true,
    'jest': true
  },
  'extends': [
    'airbnb-base',
    'plugin:jest/all'
  ],
  'globals': {
    'Atomics': 'readonly',
    'SharedArrayBuffer': 'readonly'
  },
  'parserOptions': {
    'ecmaVersion': 2018,
    'sourceType': 'module'
  },
  'plugins': ['jest'],
  'rules': {
    'max-classes-per-file': 'off',
    'no-underscore-dangle': 'off',
    'no-console': 'off',
    'no-shadow': 'off',
    'no-restricted-syntax': [
      'error',
      'LabeledStatement',
      'WithStatement'
    ]
  },
  'overrides': [
    {
      'files': ['*.js'],
      'excludedFiles': 'babel.config.js'
    }
  ]
}"

# Create Configuration Files (improved error handling)
create_config_file() {
  local filename="$1"
  local config_content="$2"

  if [[ ! -f "$filename" ]]; then
    echo "Creating file: $filename"
    echo "$config_content" > "$filename"
  else
    echo "File '$filename' already exists. Skipping creation."
  fi
}

# Create Configuration Files with Error Handling
create_config_file "babel.config.js" "$babel_config"
create_config_file "package.json" "$package_config"
create_config_file ".eslintrc.js" "$eslintrc_config"

# Install Dependencies (check for all files before installing)
if [[ -f babel.config.js && -f package.json && -f .eslintrc.js ]]; then
  npm install
else
  echo "Some configuration files are missing. Please create them manually or run the script again."
fi

