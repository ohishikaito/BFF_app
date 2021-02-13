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
    <button @click="onClickSignIn">sign up</button>
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
        confirm_success_url: 'http://localhost:3003/auth/completed'
      },
    }
  },
  methods: {
    async onClickSignIn() {
      try {
        const response = await this.$axios.post('/auth', this.user)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
