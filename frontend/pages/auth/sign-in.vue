<template>
  <div>
    <h1>ログイン</h1>
    <div>
      email
      <input type="text" v-model="user.email" />
      password
      <input type="text" v-model="user.password" />
    </div>
    <v-btn @click="onClickSignIn">sign in</v-btn>
    <nuxt-link :to="`/auth/password`">パスワード再設定</nuxt-link>
    <v-btn @click="onClickOmniAuth">google認証</v-btn>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      user: {
        email: 'ohishikaito@gmail.com',
        // email: 'okaito',
        password: 'adaadaada',
      },
    }
  },
  methods: {
    async onClickSignIn() {
      try {
        const response = await this.$axios.post('/auth/sign_in', this.user)
        const user = response.data.data
        this.$store.dispatch('setUser', user)
        this.$store.dispatch('signIn', response.headers)
        this.$router.push('/')
      } catch (error) {
        console.error(error.response)
      }
    },
    async onClickOmniAuth() {
      try {
        const baseUrl = `${process.env.BACKEND_ENDPOINT}`
        // 環境ごとにredirect_uriを変えろ。通常ユーザーのログインもデバックする
        const url = `https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?access_type=offline`
          + `&client_id=958011517455-add9aab75gkv6mdkrg9o46j37opos0l8.apps.googleusercontent.com`

          + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Fomniauth%2Fgoogle_oauth2%2Fcallback`
          // + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Fomniauth%2Fgoogle_oauth2`
          // + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Fauth%2Fgoogle_oauth2%2Fcallback`
          // + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Fomniauth%2Fgoogle_oauth2%2Fcallback`
          // + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Fapi%2Fomniauth%2Fgoogle_oauth2%2Fcallback`
          // + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Fapi%2Fauth%2Fgoogle_oauth2%2Fcallback`
          + `&response_type=code`
          + `&scope=email`
          // + `&state=da444026635e005dd04fa95ccc349efa29c0fa89bc2e6801`
          + `&flowName=GeneralOAuthFlow`
        window.open(url)

// https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?access_type=offline
// &client_id=49057628444-9406cqj9722rm502tdta7vthms498a5c.apps.googleusercontent.com
// &redirect_uri=http%3A%2F%2Flocalhost%3A4003%2Fusers%2Fauth%2Fgoogle_oauth2%2Fcallback
// &response_type=code
// &scope=email%20profile
// &state=da444026635e005dd04fa95ccc349efa29c0fa89bc2e6801
// &flowName=GeneralOAuthFlow

        // const response = await this.$axios.post('omniauth/google/callback', this.user.email)
        // this.$store.dispatch('signIn', response.headers)
        // this.$router.push('/')
      } catch (error) {
        console.log(error)
        console.error(error.response)
      }
    },
  },
}
</script>
