/** @type {import('tailwindcss').Config} */
const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");
module.exports = {
  content: ["./public/**/*.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    screens: {
      phone: "420px",
      // => @media (min-width: 640px) { ... }
      tablet: "640px",
      // => @media (min-width: 640px) { ... }

      laptop: "1024px",
      // => @media (min-width: 1024px) { ... }

      desktop: "1280px",
      // => @media (min-width: 1280px) { ... }
      sm: "640px",
      // => @media (min-width: 640px) { ... }

      md: "768px",
      // => @media (min-width: 768px) { ... }

      lg: "1024px",
      // => @media (min-width: 1024px) { ... }

      xl: "1280px",
      // => @media (min-width: 1280px) { ... }

      "2xl": "1536px",
      // => @media (min-width: 1536px) { ... }
    },

    extend: {
      height: {
        "128": "32rem",
      },
      fontFamily: {
        sans: ["Open Sans", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        // "aronium-900": "#252525",
        // "aronium-800": "#333333",
        // "aronium-700": "#474e56",
        // "aronium-600": "#888888",
        "aronium-white": "#ffffff",
        "aronium-sky": "#1ba0e1",
        "aronium-green": "#52d468",
        "aronium-danger": "#c62828",
        aronium: {
          "50": "#f8fafc",
          "100": "#f1f5f9",
          "200": "#e2e8f0",
          "300": "#cbd5e1",
          "400": "#979797",
          "500": "#595e57",
          "600": "#888888",
          "700": "#333333",
          "800": "#333333",
          "900": "#252525",
          sky: {
            "50": "#f0f9ff",
            "100": "#e0f2fe",
            "200": "#bae6fd",
            "300": "#7dd3fc",
            "400": "#38bdf8",
            "500": "#0ea5e9",
            "600": "#0284c7",
            "700": "#0369a1",
            "800": "#075985",
            "900": "#0c4a6e",
          },
        },
        "warm-gray": colors.warmGray,
        teal: colors.teal,
      },
      gridTemplateCols: {
        // Simple 12 row grid
        "16": "repeat(16, minmax(0, 1fr))",
      },
      gridTemplateRows: {
        // Simple 12 row grid
        "12": "repeat(12, minmax(0, 1fr))",
        "9": "repeat(9, minmax(0, 1fr))",
        "8": "repeat(8, minmax(0, 1fr))",

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
  plugins: [require("@tailwindcss/forms", require("@tailwindcss/line-clamp"))],
};
