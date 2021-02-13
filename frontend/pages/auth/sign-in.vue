<template>
  <div>
    <h1>ログイン</h1>
    <div>
      email
      <input type="text" v-model="user.email" />
      password
      <input type="text" v-model="user.password" />
    </div>
    <button @click="onClickSignIn">sign in</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        email: 'ohishikaito@gmail.com',
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
  },
}
</script>
