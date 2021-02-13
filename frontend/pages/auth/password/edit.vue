<template>
  <div>
    <h1>パスワード再設定</h1>
    <p>パスワードを更新しろ！</p>
    <div>
      password
      <input type="text" v-model="user.password" />
      passwordConfirmation
      <input type="text" v-model="user.passwordConfirmation" />
    </div>
    <button @click="onClickUpdatePassword">送信</button>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      // const response = await ctx.$axios.get(`/auth/password/edit?email=${ctx.route.query.email}&reset_password_token=${ctx.route.query.reset_password_token}`)
      // const response = await ctx.$axios.get(`/auth/password/edit?reset_password_token=${ctx.route.query.reset_password_token}`)
      // const user = response.data.data
      // console.log(ctx.route.query)
      const user = {}
      user.password = ''
      user.passwordConfirmation = ''
      return {
        user,
      }
    } catch(error) {
      console.error(error)
    }
  },
  methods: {
    async onClickUpdatePassword() {
      const headers = this.$route.query
      this.$store.dispatch('signIn', headers)
      try {
        const response = await this.$axios.put('/auth/password', this.user)
        this.$store.dispatch('signOut')
        this.$router.push('/auth/sign-in')
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
