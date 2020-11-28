<template>
  <div>
    <h1>投稿ページ</h1>
    <div>
      <input type="text" v-model="post.name" />
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
      },
    }
  },
  methods: {
    async onClickCreate() {
      try {
        const response = await this.$axios.post('/posts', { post: this.post })
        console.log(response)
        this.$router.push('/')
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
