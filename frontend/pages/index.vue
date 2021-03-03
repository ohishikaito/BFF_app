<template>
  <v-container>
    <div>
      <nuxt-link :to="`/posts/new`">
        <v-btn>投稿</v-btn>
      </nuxt-link>
      <nuxt-link :to="`/users`">
        <v-btn>ユーザー一覧</v-btn>
      </nuxt-link>
    </div>
    <h1>投稿一覧</h1>
    <ul v-for="post in posts" :key="post.id">
      <v-card>
        <div>id :{{ post.id }}</div>
        <div>name :{{ post.name }}</div>
        <div>is_special :{{ post.isSpecial }}</div>
        <div>createdAt :{{ post.createdAt }}</div>
        <div>いいね数 :{{ likesCount(post) }}</div>
        <nuxt-link :to="`/posts/${post.id}`">
          <v-btn>詳細</v-btn>
        </nuxt-link>
        <template v-if="authenticated">
          <template v-if="currentUserLiked(post, $store.getters['getUser'])">
            <v-btn @click="onClickDeleteLike(post)">いいねを取り消す</v-btn>
          </template>
          <template v-else>
            <v-btn @click="onClickCreateLike(post)">いいね</v-btn>
          </template>
        </template>
      </v-card>
    </ul>
  </v-container>
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
    },
    likesCount: () => {
      return(post) => post.likes.length
    }
  },
  methods: {
    async onClickCreateLike(post) {
      try {
        const response = await this.$axios.post(`/posts/${post.id}/likes/`, { postId: post.id })
        const like = response.data
        post.likes.push(like)
        post.likesCount = like.post.likesCount
      } catch (error) {
        console.error(error)
      }
    },
    async onClickDeleteLike(post) {
      const user = this.$store.getters['getUser']
      const like = post.likes.find(like => like.userId === user.id)
      try {
        const response = await this.$axios.delete(`/posts/${post.id}/likes/${like.id}`)
        post.likes.splice(like, 1)
      } catch (error) {
        console.error(error)
      }
    },
  }
}
</script>
