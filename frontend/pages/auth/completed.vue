<template>
  <div>
    <h1>{{ user.name }}さん、ようこそ！</h1>
    <h2>メール認証が完了しました</h2>
    <nuxt-link :to="`/`">トップページへ戻る</nuxt-link>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    const headers = ctx.route.query
    ctx.store.dispatch('signIn', headers)
    try {
      const response = await ctx.$axios.get('/auth/validate_token')
      const user = response.data.data
      ctx.store.dispatch('setUser', user)
      return {
        user,
      }
    } catch(error) {
      console.error(error)
    }
  }
}
</script>