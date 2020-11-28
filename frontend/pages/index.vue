<template>
  <div>
    <h1>投稿一覧</h1>
    <ul v-for="post in posts" :key="post.id">
      <div>
        <div>{{ post.id }}</div>
        <div>{{ post.name }}</div>
        <button @click="onClickShow(post.id)">詳細へ</button>
      </div>
    </ul>
    <div>
      <button @click="onClickNew">投稿ページへ</button>
    </div>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get('/posts');
      console.log("aaaa");
      return {
        posts: response.data,
      };
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    onClickNew() {
      this.$router.push('/posts/new')
    },
    onClickShow(postId) {
      this.$router.push(`/posts/${postId}`)
    },
  },
}
</script>
