const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  darkModel: 'media',
  theme: {
    extend: {
      colors: {
        black: '#000000',

        // Цвета для светлой темы
        background: '#808080',
        text: '#1A1A1A',
        secondaryText: '#4A5568',
        border: '#E2E8F0',
        contrast: '#3182CE',

        // Цвета для темной темы (использовать dark:<name>)
        dark: {
          background: '#FFFFFF',
          text: '#1A1A1A',
          secondaryText: '#4A5568',
          border: '#E2E8F0',
          contrast: '#3182CE',
        }
      },
      fontFamily: {
        main: ['Roboto', ...defaultTheme.fontFamily.sans],
        secondary: ["Montserrat", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/typography'),
    // require('@tailwindcss/container-queries'),
  ]
}
