// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },
  modules: [
    '@nuxt/icon',
    '@nuxt/fonts',
    '@nuxtjs/supabase',
    'shadcn-nuxt',
    '@nuxtjs/tailwindcss',
    '@hypernym/nuxt-anime',
    '@nuxt/test-utils/module'
  ],
  css: ['~/assets/css/main.css'],
  tailwindcss: {
    exposeConfig: true
  },
  shadcn: {
    prefix: '',
    componentDir: '~/components/ui',
  },
  supabase: {
    key: process.env.SUPABASE_KEY,
    url: process.env.SUPABASE_URL,
  }
})