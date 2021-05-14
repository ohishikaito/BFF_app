<template>
  <div>
    <h1>会員登録</h1>
    <div>
      lastName
      <input type="text" v-model="user.lastName" />
      firstName
      <input type="text" v-model="user.firstName" />
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
        firstName: '海渡',
        lastName: '大石',
        email: 'ohishikaito@gmail.com',
        password: 'adaadaada',
        confirm_success_url: 'http://localhost:3004/auth/completed'
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
