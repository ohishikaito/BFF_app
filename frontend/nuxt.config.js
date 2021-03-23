let backendEndpoint = 'http://localhost:4002'

export default {
  // Disable server-side rendering (https://go.nuxtjs.dev/ssr-mode)
  ssr: false,

  // Global page headers (https://go.nuxtjs.dev/config-head)
  head: {
    title: 'frontend',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
  },

  // Global CSS (https://go.nuxtjs.dev/config-css)
  css: [],

  // Plugins to run before rendering page (https://go.nuxtjs.dev/config-plugins)
  plugins: ['plugins/axios', 'plugins/nuxt-client-init'],

  // Auto import components (https://go.nuxtjs.dev/config-components)
  components: true,

  // Modules for dev and build (recommended) (https://go.nuxtjs.dev/config-modules)
  buildModules: ['@nuxtjs/vuetify'],

  // Modules (https://go.nuxtjs.dev/config-modules)
  // ポート変更
  server: {
    port: 3004, // デフォルト: 3000
    host: '0.0.0.0', // デフォルト: localhost
  },
  modules: ['@nuxtjs/axios', '@nuxtjs/apollo', 'cookie-universal-nuxt'],

  env: {
    BACKEND_ENDPOINT: backendEndpoint,
  },

  axios: {
    baseURL: `${backendEndpoint}/api`,
  },

  apollo: {
    clientConfigs: {
      default: '~/apollo/client-configs/default.js',
    },
  },

  // Build Configuration (https://go.nuxtjs.dev/config-build)
  build: {},
}
