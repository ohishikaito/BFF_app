export default (ctx) => {
  // リクエストログ
  ctx.$axios.onRequest((config) => {
    config.headers = ctx.store.getters['getAuth']
  })
  // レスポンスログ
  ctx.$axios.onResponse((config) => {})
  // エラーログ
  ctx.$axios.onError((error) => {
    if (error.response.status === 401) {
      ctx.store.dispatch('unAuthorized')
      console.log('401エラーなので /auth/sign-in に遷移します')
      ctx.redirect('/auth/sign-in')
    }
  })
}
