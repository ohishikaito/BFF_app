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
      <button @click="onClickNewPost">投稿ページへ</button>
      <button @click="onClickUsers">ユーザー一覧</button>
      <button @click="onClickNewUesr">ユーザー登録ページへ</button>
    </div>
  </div>
</template>

<script>
export default {
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
    onClickNewPost() {
      this.$router.push('/posts/new')
    },
    onClickShow(postId) {
      this.$router.push(`/posts/${postId}`)
    },
    onClickNewUesr() {
      this.$router.push('/users/new')
    },
    onClickUsers() {
      this.$router.push('/users')
    },
  },
}
</script>
