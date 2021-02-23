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
        <template v-if="authenticated">
          <template v-if="currentUserLiked(post, $store.getters['getUser'])">
            <button @click="onClickDeleteLike(post)">いいねを取り消す</button>
          </template>
          <template v-else>
            <button @click="onClickCreateLike(post.id)">いいね</button>
          </template>
        </template>
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
      const posts = response.data
      return {
        posts,
      }
    } catch (error) {
      console.error(error)
    }
  },
  computed: {
    authenticated() {
      return this.$store.getters['authenticated']
    },
    currentUserLiked: () => {
      return (post, user) => {
        const like = post.likes.find(like => like.userId === user.id)
        if (like) {
          return true
        } else {
          return false
        }
      }
    }
  },
  methods: {
    async onClickCreateLike(postId) {
      try {
        const response = await this.$axios.post(`/posts/${postId}/likes/`, { postId })
        const like = response.data
        const post = this.posts.find(post => post.id === like.postId)
        post.likesCount = like.post.likesCount
        console.log(this.posts)
        this.posts.splice()
      } catch (error) {
        console.error(error)
      }
    },
    async onClickDeleteLike(post) {
      const user = this.$store.getters['getUser']
      const like = post.likes.find(like => like.userId === user.id)
      console.log(post, like, user)
      try {
        const response = await this.$axios.delete(`/posts/${post.id}/likes/${like.id}`)
        const response2 = await this.$axios.delete(`/posts/${post.id}`)
        const post = response2.data
        this.posts.find(it => it.id === post.id).likesCount = post.likesCount
        // post.likesCount = like.post.likesCount
      } catch (error) {
        console.error(error)
      }
    },
  }
}
</script>
