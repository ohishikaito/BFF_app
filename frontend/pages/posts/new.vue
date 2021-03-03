<template>
  <v-container>
    <app-post-form :post="post"></app-post-form>
    <v-btn @click="onClickCreate">登録する</v-btn>
  </v-container>
</template>

<script>
export default {
  middleware: 'authenticated',
  data() {
    return {
      post: {
        name: '',
        subName: '',
        isSpecial: false,
        video: '',
        image: '',
      },
    }
  },
  methods: {
    async onClickCreate() {
      const req = new FormData()
      req.append('name', this.post.name)
      req.append('sub_name', this.post.subName)
      req.append('is_special', this.post.isSpecial)
      req.append('video', this.post.video)
      if (this.post.image instanceof File) {
        req.append('image', this.post.image)
      }
      try {
        const response = await this.$axios.post('/posts', req, {
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
