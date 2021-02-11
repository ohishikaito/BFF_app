<template>
  <div>
    <h1>投稿ページ</h1>
    <div>
      name
      <input type="text" v-model="user.name" />
      email
      <input type="text" v-model="user.email" />
    </div>
    <button @click="onClickCreate">登録する</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
      },
    }
  },
  methods: {
    async onClickCreate() {
      try {
        const response = await this.$axios.post('/users', { user: this.user })
        console.log(response)
        this.$router.push('/')
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
