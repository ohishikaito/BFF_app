<template>
  <div>
    <h1>メール認証が完了しました</h1>
    <nuxt-link :to="`/`">トップページへ戻る</nuxt-link>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    // const user = ctx.store.getters['getUser']
    //     this.$store.dispatch('setUser', user)
    //     this.$store.dispatch('signIn', response.headers)
    try {

      return {
        // user,
      }
    } catch(error) {
      console.error(error)
    }
  }
}
</script>

<style>

</style>