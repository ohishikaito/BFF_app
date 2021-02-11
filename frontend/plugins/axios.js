export default (ctx) => {
  // リクエストログ
  ctx.$axios.onRequest((config) => {
    config.headers = ctx.store.getters['getAuth']
    // console.log(config)
  })
  // レスポンスログ
  ctx.$axios.onResponse((config) => {
    // console.log(config)
  })
  // エラーログ
  ctx.$axios.onError((e) => {
    // console.log(e.response)
  })
}
