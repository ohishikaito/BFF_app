<template>
  <div>
    <h1>投稿ページ</h1>
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
        email: 'test@example.com',
        password: 'password2',
      },
    }
  },
  methods: {
    async onClickSignIn() {
      try {
        const response = await this.$axios.post('/auth', this.user)
        console.log(this)
        // this.$cookie.set('user', response)
        console.log(response)
        this.$router.push('/')
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
