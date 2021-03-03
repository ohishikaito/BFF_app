<template>
  <v-container>
    <app-post-form :post="post"></app-post-form>
    <v-btn @click="onClickUpdate">更新する</v-btn>
  </v-container>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get(`/posts/${ctx.route.params.id}`)
      const post = response.data
      post.imageName = 'hogehoge'
      return {
        post,
      }
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    async onClickUpdate() {
      const req = new FormData()
      req.append('id', this.post.id)
      req.append('name', this.post.name)
      req.append('sub_name', this.post.subName)
      req.append('is_special', this.post.isSpecial)
      req.append('video', this.post.video)
      if (this.post.image instanceof File) {
        req.append('image', this.post.image)
      }
      try {
        const response = await this.$axios.put(`/posts/${this.post.id}`, req, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        this.$router.push(`/posts/${response.data.id}`)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
