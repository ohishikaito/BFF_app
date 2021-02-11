<template>
  <div>
    <h1>投稿一覧</h1>
    <ul v-for="user in users" :key="user.id">
      <div>
        <div>id: {{ user.id }}</div>
        <div>name:{{ user.name }}</div>
        <div>email: {{ user.email }}</div>
        <nuxt-link :to="`/users/${user.id}`">詳細へ</nuxt-link>
      </div>
    </ul>
    <div>
      <nuxt-link :to="`/`">トップページへ戻る</nuxt-link>
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
  },
}
</script>
