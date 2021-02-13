<template>
  <div>
    <h1>パスワード再設定</h1>
    <p>パスワード再発行のため登録しているメールアドレスに再発行メールを送信します</p>
    <div>
      email
      <input type="text" v-model="user.email" />
    </div>
    <button @click="onClickSendEmail">送信</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        email: 'ohishikaito@gmail.com',
        redirect_url: 'http://localhost:3003/auth/password/edit'
      },
    }
  },
  methods: {
    async onClickSendEmail() {
      try {
        const response = await this.$axios.post('/auth/password', this.user)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
