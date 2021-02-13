import camelCaseKeys from 'camelcase-keys'
import snakeCaseKeys from 'snakecase-keys'

export default (ctx) => {
  // リクエストログ
  ctx.$axios.onRequest((config) => {
    config.headers = ctx.store.getters['getAuth']
    // NOTE: FormDataだったらすでにsnakeCaseになっているのでreturnする。何も処理しない
    if (config.data instanceof FormData) {
      return config
    } else if (config.method === ('post' || 'put')) {
      config.data = snakeCaseKeys(config.data, { deep: true })
    }
    return config
  })
  // レスポンスログ
  ctx.$axios.onResponse((response) => {
    response.data = camelCaseKeys(response.data, { deep: true })
    return response
  })
  // エラーログ
  ctx.$axios.onError((error) => {
    if (error.response.status === 401) {
      ctx.store.dispatch('unAuthorized')
      console.error('401エラーなので /auth/sign-in に遷移します')
      ctx.redirect('/auth/sign-in')
    }
  })
}
