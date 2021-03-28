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
        // NOTE: responseでNo resource_class foundって言われる。issueみても解決してない。放置
        const url = `https://github.com/login/oauth/authorize?response_type=code&`
          // + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Flogin%2Fgithub%2Fcallback`
          + `&redirect_uri=http%3A%2F%2Flocalhost%3A4002%2Fapi%2Flogin%2Fgithub%2Fcallback`
          + `&scope=user%3Aemail`
          + `&client_id=79411fede7820f04eb5f`
          + `&state=da444026635e005dd04fa95ccc349efa29c0fa89bc2e6801`
        window.open(url)

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
