import camelCaseKeys from 'camelcase-keys'
import snakeCaseKeys from 'snakecase-keys'

export default (ctx) => {
  // リクエストログ
  ctx.$axios.onRequest((config) => {
    // NOTE: auth0用の処理。baseUrlだけを変更したいため
    if (config.url === 'https://dev-lsrabttj.jp.auth0.com/userinfo') {
      config.baseUrl = 'http://localhost:3004'
      return config
    }
    config.headers = ctx.store.getters['getAuth']
    // NOTE: FormDataだったらすでにsnakeCaseになっているのでreturnする。何も処理しない
    if (config.data instanceof FormData) {
      return config
      // FIX: method === 'put' のとき、 'post' || 'put' で書いたらなぜかfalseになるので分けた。修正したい。
    } else if (config.method === 'post') {
      config.data = snakeCaseKeys(config.data, { deep: true })
    } else if (config.method === 'put') {
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
