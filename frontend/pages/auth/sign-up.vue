<template>
  <div>
    <h1>会員登録</h1>
    <div>
      name
      <input type="text" v-model="user.name" />
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
        name: '大石海渡',
        email: 'ohishikaito@gmail.com',
        password: 'adaadaada',
        confirm_success_url: 'http://localhost:3003/'
      },
    }
  },
  methods: {
    async onClickSignIn() {
      try {
        const response = await this.$axios.post('/auth', this.user)
        // const user = response.data.data
        // this.$store.dispatch('setUser', user)
        // this.$store.dispatch('signIn', response.headers)
        // this.$router.push('/')
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
