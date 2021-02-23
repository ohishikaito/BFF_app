<template>
  <div>
    <h1>アカウント情報変更ページ</h1>
    <div>
      lastName
      <input type="text" v-model="user.lastName" />
      firstName
      <input type="text" v-model="user.firstName" />
      email
      <input type="email" v-model="user.email" />
      password
      <input type="text" v-model="user.password" />
    </div>
    <button @click="onClickUpdate">更新</button>
  </div>
</template>

<script>
export default {
  middleware: 'authenticated',
  async asyncData(ctx) {
    const user = ctx.store.getters['getUser']
    user.password = ''
    return {
      user,
    }
  },
  methods: {
    async onClickUpdate() {
      try {
        const response = await this.$axios.put('/auth/', this.user)
        const user = response.data.data
        this.$store.dispatch('setUser', user)
        this.$router.push('/')
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
