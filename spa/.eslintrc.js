module.exports = {
  root: true,

  env: {
    node: true,
  },

  // extends: [
  //     "plugin:vue/vue3-recommended",
  //     "eslint:recommended",
  //     "prettier",
  // ],

  parserOptions: {
    parser: "@typescript-eslint/parser",
  },

  rules: {
    "no-console": process.env.NODE_ENV === "production" ? "warn" : 0,
    "no-debugger": process.env.NODE_ENV === "production" ? "warn" : 0,
    "vue/multi-word-component-names": [
      "warn",
      {
        ignores: [
          "Footer",
          "Sidebar",
          "Auth",
          "Index",
          "Landing",
          "Profile",
          "Maps",
          "Settings",
          "Tables",
          "Login",
          "Register",
          "Popper",
          "Store",
          "Stocks",
          "Documents",
          "Screen",
          "Grid",
          "Calculator",
          "Button",
          "Moneys",
        ],
      },
    ],
    "vue/no-unused-components": "warn",
    "no-useless-escape": "off",
    "no-unused-vars": "warn",
    "vue/require-explicit-emits": "off",
  },

  overrides: [
    {
      files: ["**/__tests__/**/*.[jt]s?(x)", "**/?(*.)+(spec|test).[jt]s?(x)"],
      env: {
        jest: true,
      },
    },
  ],

  // extends: ["plugin:vue/vue3-recommended", "eslint:recommended", "prettier"],

  extends: [
    "plugin:vue/vue3-recommended",
    "eslint:recommended",
    "prettier",
    // "@vue/typescript",
  ],
};
