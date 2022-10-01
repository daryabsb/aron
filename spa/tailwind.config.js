/** @type {import('tailwindcss').Config} */
const defaultTheme = require("tailwindcss/defaultTheme");
module.exports = {
  content: ["./public/**/*.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Open Sans", ...defaultTheme.fontFamily.sans],
      },
      colors: {},
      gridTemplateRows: {
        // Simple 12 row grid
        // "12": "repeat(12, 1fr)",
        // Complex site-specific row configuration
        // 'layout': '200px minmax(900px, 1fr) 100px',
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
