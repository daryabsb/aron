/** @type {import('tailwindcss').Config} */
const defaultTheme = require("tailwindcss/defaultTheme");
module.exports = {
  content: ["./public/**/*.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Open Sans", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        "aronium-900": "#252525",
        "aronium-800": "#333333",
        "aronium-700": "#474e56",
        "aronium-600": "#888888",
        "aronium-white": "#ffffff",
        "aronium-sky": "#1ba0e1",
        "aronium-green": "#52d468",
      },
      gridTemplateRows: {
        // Simple 12 row grid
        "12": "repeat(12, minmax(0, 1fr))",

        // Complex site-specific row configuration
        // 'layout': '200px minmax(900px, 1fr) 100px',
      },
      gridRow: {
        "span-7": "span 7 / span 7",
        "span-8": "span 8 / span 8",
        "span-9": "span 9 / span 9",
        "span-10": "span 10 / span 10",
        "span-11": "span 11 / span 11",
        "span-12": "span 12 / span 12",
      },
      gridRowStart: {
        "8": "8",
        "9": "9",
        "10": "10",
        "11": "11",
        "12": "12",
        "13": "13",
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
