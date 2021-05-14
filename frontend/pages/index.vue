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
      <v-card width="600">
        <v-col cols="6">
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
        </v-col>
      </v-card>
    </ul>
    <template v-if="pagination">
      <v-pagination
        v-model="pagination.currentPage"
        :length="pagination.totalPages"
        :total-visible="pagination.limitValue"
        :color="'#17a9da'"
        @input="onClickPaginate(pagination.currentPage)"
      ></v-pagination>
    </template>

    <template v-for="user in users">
      <v-card :key="user.id">
        <div>user_id: {{ user.id }}</div>
        <div>lastName: {{ user.lastName }}</div>
        <div>firstName: {{ user.firstName }}</div>
        <div>Email: {{ user.email }}</div>
      </v-card>
    </template>
  </v-container>
</template>

<script>
import { allUsers } from '~/apollo/gqls/queries/users'

export default {
  async asyncData(ctx) {
      try {
      const response = await Promise.all([
        ctx.$axios.get(`/posts?page=${ctx.query.page ? ctx.query.page : 1}`),
        ctx.app.apolloProvider.defaultClient.query(allUsers()),
      ])
      const posts = response[0].data.posts
      const pagination = response[0].data.meta.pagination
      const users = response[1].data.allUsers
      return {
        posts,
        pagination,
        users,
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
        return like ? true : false
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
        await this.$axios.delete(`/posts/${post.id}/likes/${like.id}`)
        post.likes.splice(like, 1)
      } catch (error) {
        console.error(error)
      }
    },
    onClickPaginate(currentPage) {
      this.$router.push(`/?page=${currentPage}`)
    },
  },
  watchQuery: true,
}
</script>
