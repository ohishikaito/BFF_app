<template>
  <v-container>
    <v-card-title>詳細ページ</v-card-title>
    <v-card>
      <ul>
        <li>id: {{ post.id }}</li>
        <li>name: {{ post.name }}</li>
        <li>subName: {{ post.subName }}</li>
        <li>is_special :{{ post.isSpecial }}</li>
        <li>
          <v-img
            :src="post.image.url"
            width="300"
            heigth="300"
          />
        </li>
      </ul>
    </v-card>
    <v-btn @click="onClickEdit">編集する</v-btn>
    <v-btn @click="onClickDestroy">削除</v-btn>
  </v-container>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get(`/posts/${ctx.route.params.id}`)
      const post = response.data
      return {
        post,
      }
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    onClickEdit() {
      this.$router.push(`/posts/${this.post.id}/edit`)
    },
    async onClickDestroy() {
      try {
        const response = await this.$axios.delete(`/posts/${this.post.id}`)
        this.$router.push(`/`)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
