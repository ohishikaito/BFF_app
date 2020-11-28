// https://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true,
  parserOptions: {
    sourceType: "module",
    parser: "babel-eslint"
  },
  env: {
    browser: true
  },
  extends: ["prettier", "prettier/standard", "plugin:vue/recommended"],
  plugins: ["vue", "prettier"],
  rules: {
    "generator-star-spacing": "off",
    "no-debugger": process.env.NODE_ENV === "production" ? "error" : "off",
    "properties": "always",
    "ignoreDestructuring": false,
    "prettier/prettier": [
      "error",
      {
        trailingComma: "none",
        singleQuote: true,
        semi: false,
        printWidth: 120,
      }
    ]
  }
};