import { HttpLink } from 'apollo-link-http'

export default () => {
  // 書き換えたから動くか分からない。できなかったら文字列にして
  const httpLink = new HttpLink({ uri: process.env.BACKEND_ENDPOINT })
  return {
    link: httpLink,
  }
}
