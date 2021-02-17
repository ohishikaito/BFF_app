<template>
  <div>
    <h1>投稿一覧</h1>
    <ul v-for="post in posts" :key="post.id">
      <div>
        <div>id :{{ post.id }}</div>
        <div>name :{{ post.name }}</div>
        <div>createdAt :{{ post.createdAt }}</div>
        <nuxt-link :to="`/posts/${post.id}`">詳細</nuxt-link>
      </div>
    </ul>
    <div>
      <nuxt-link :to="`/posts/new`">投稿</nuxt-link>
      <nuxt-link :to="`/users`">ユーザー一覧</nuxt-link>
    </div>
  </div>
</template>

<script>
// import posts from '~/apollo/gqls/queries/posts'
export default {
  // apollo: {
  //   posts: {
  //     query: posts,
  //   },
  // },
  async asyncData(ctx) {
      try {
      const response = await ctx.$axios.get('/posts')
      return {
        posts: response.data,
      }
    } catch (error) {
      console.error(error)
    }
  },
}
</script>
