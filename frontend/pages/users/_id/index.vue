<template>
  <div>
    <h1>詳細ページ</h1>
    <ul>
      <li>
        <div>id: {{ user.id }}</div>
        <div>name: {{ user.name }}</div>
      </li>
      <div v-for="post in user.posts" :key="post.id">
        <h1>id: {{ post.id}}</h1>
        <p>name: {{ post.name}} </p>
        <nuxt-link :to="`/posts/${post.id}`">詳細</nuxt-link>
      </div>
    </ul>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get(`/users/${ctx.route.params.id}`)
      const user = response.data
      return {
        user,
      }
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
  },
}
</script>
