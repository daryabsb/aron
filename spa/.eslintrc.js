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
    "vue/multi-word-component-names": "off",
    // "vue/multi-word-component-names": [
    //   "warn",
    //   {
    //     ignores: [
    //       "Footer",
    //       "Sidebar",
    //       "Auth",
    //       "Index",
    //       "Landing",
    //       "Profile",
    //       "Maps",
    //       "Settings",
    //       "Tables",
    //       "Login",
    //       "Register",
    //       "Popper",
    //       "Store",
    //       "Stocks",
    //       "Documents",
    //       "Screen",
    //       "Grid",
    //       "Calculator",
    //       "Button",
    //       "Moneys",
    //     ],
    //   },
    // ],
    "vue/html-closing-bracket-newline": [
      "warn",
      {
        singleline: "never",
        multiline: "never",
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
    "plugin:vue/base",
    "plugin:vue/vue3-essential",
    "plugin:vue/vue3-recommended",
    "eslint:recommended",
    "prettier",
    // "@vue/typescript",
  ],
};

// module.exports = {
//   root: true,
//   env: {
//       node: true,
//   },
//   extends: [
//       'plugin:vue/base',
//       'plugin:vue/vue3-essential',
//       'plugin:vue/vue3-recommended',
//       'plugin:vue/vue3-strongly-recommended',
//       '@vue/typescript/recommended',
//       '@vue/airbnb',
//   ],
//   parserOptions: {
//       ecmaVersion: 2020,
//   },
//   rules: {
//       'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
//       'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
//       // Airbnb with a couple of minor tweaks
//       'object-shorthand': ['error', 'always'],
//       indent: ['error', 4],
//       'linebreak-style': 'off',
//       'eol-last': ['error', 'never'],
//       'max-len': ['error', { code: 450 }],
//       'space-before-function-paren': ['error', 'always'],

//       'vue/html-indent': ['error', 4, {
//           attribute: 1,
//           closeBracket: 0,
//           alignAttributesVertically: true,
//           ignores: [],
//       }],

//       'vue/html-closing-bracket-newline': ['error', {
//           singleline: 'never',
//           multiline: 'never',
//       }],

//       'vue/multi-word-component-names': 'off',

//       // These are weird inconsistencies between eslint and typescript eslint integration. Need to make some GitHub issues.
//       'no-shadow': 'off',
//       '@typescript-eslint/no-shadow': ['error'],
//       'no-unused-vars': 'off',
//       '@typescript-eslint/no-unused-vars': ['error'],
//   },
//   overrides: [
//       {
//           files: [
//               '**/__tests__/*.{j,t}s?(x)',
//               '**/tests/unit/**/*.spec.{j,t}s?(x)',
//           ],
//           env: {
//               jest: true,
//           },
//       },
//   ],
// };
