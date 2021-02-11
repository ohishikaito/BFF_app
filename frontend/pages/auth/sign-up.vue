<template>
  <div>
    <h1>投稿ページ</h1>
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
        name: 'name',
        email: 'test@example.com',
        password: 'password2',
      },
    }
  },
  methods: {
    async onClickSignIn() {
      try {
        const response = await this.$axios.post('/auth', this.user)
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
