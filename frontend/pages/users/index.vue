<template>
  <div>
    <h1>投稿一覧</h1>
    <ul v-for="user in users" :key="user.id">
      <div>
        <div>id: {{ user.id }}</div>
        <div>name:{{ user.name }}</div>
        <div>email: {{ user.email }}</div>
        <div>login: {{ user.login }}</div>
        <button @click="onClickShow(user.id)">詳細へ</button>
      </div>
    </ul>
    <div>
      <button @click="onClickNewuser">トップページへ戻る</button>
    </div>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get('/users')
      return {
        users: response.data,
      }
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    onClickNewuser() {
      this.$router.push('/users/new')
    },
    onClickShow(userId) {
      this.$router.push(`/users/${userId}`)
    },
    onClickNewUesr() {
      this.$router.push('/users/new')
    },
  },
}
</script>
