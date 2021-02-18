<template>
  <div>
    <h1>編集ページ</h1>
    <p>id: {{ post.id }}</p>
    <div>
      <label for="">post.name</label>
      <input type="text" v-model="post.name" />
    </div>
    <div>
      <label for="">post.subName</label>
      <input type="text" v-model="post.subName" />
    </div>
    <div>
      <label for="">post.isSpecial</label>
      isSpecial: <input type="checkbox" v-model="post.isSpecial" />
    </div>
    <button @click="onClickUpdate">更新する</button>
  </div>
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
    async onClickUpdate() {
      const req = new FormData()
      req.append('id', this.post.id)
      req.append('name', this.post.name)
      req.append('sub_name', this.post.subName)
      req.append('is_special', this.post.isSpecial)
      req.append('video', this.post.image0)
      try {
        const response = await this.$axios.put(`/posts/${this.post.id}`, req, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        this.$router.push(`/posts/${this.post.id}`)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
