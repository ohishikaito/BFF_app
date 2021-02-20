<template>
  <div>
    <div>
      <nuxt-link :to="`/posts/new`">投稿</nuxt-link>
      <nuxt-link :to="`/users`">ユーザー一覧</nuxt-link>
    </div>
    <h1>投稿一覧</h1>
    <ul v-for="post in posts" :key="post.id">
      <div>
        <div>id :{{ post.id }}</div>
        <div>name :{{ post.name }}</div>
        <div>is_special :{{ post.isSpecial }}</div>
        <div>createdAt :{{ post.createdAt }}</div>
        <div>いいね数 :{{ post.likesCount }}</div>
        <nuxt-link :to="`/posts/${post.id}`">詳細</nuxt-link>
        <button @click="onClickCreateLike(post.id)">いいね</button>
      </div>
    </ul>
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
  methods: {
    async onClickCreateLike(postId) {
      try {
        const response = await this.$axios.post(`/posts/${postId}/likes/`, { postId })
        const like = response.data
        const post = this.posts.find(post => post.id === like.postId)
        post.likesCount = like.post.likesCount
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>
