module.exports = {
  extends: 'eslint:recommended',
  env: {
    es2021: true,
    browser: true
  },
  parserOptions: {
    ecmaVersion: 12,
    sourceType: 'module'
  },
  rules: {
    'no-nested-ternary': 'off'
  },
  overrides: [
    {
      env: {
        jest: true,
        node: true
      },
      files: ['**.test.**', '**.spec.**']
    },
    {
      env: {
        node: true
      },
      files: ['.eslintrc.js', 'jest.config.js']
    }
  ]
};
