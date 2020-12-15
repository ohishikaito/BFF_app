<template>
  <div>
    <h1>投稿ページ</h1>
    <div>
      <input type="text" v-model="post.name" />
    </div>
    <div>
      <input
        class="d-none"
        ref="video"
        type="file"
        name="video"
        accept="video/*"
      />
        @change="setImage0"
    </div>
    <button @click="onClickCreate">登録する</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      post: {
        name: '',
        video: ''
      },
    }
  },
  methods: {
    async onClickCreate() {
      const req = new FormData()
      req.append('name', this.post.name)
      try {
        // const response = await this.$axios.post('/posts', { post: this.post })
        const response = await this.$axios.post('/posts', req, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        })
        console.log(response)
        this.$router.push('/')

      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
