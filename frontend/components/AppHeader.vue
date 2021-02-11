<template>
  <div>
    <nuxt-link to="/">ホームへ</nuxt-link>
    <nuxt-link :to="`/auth/sign-in`">ログイン</nuxt-link>
    <button @click="onClickSignOut">ログアウト</button>
    <nuxt-link :to="`/auth/sign-up`">会員登録</nuxt-link>
  </div>
</template>

<script>
export default {
  methods: {
    onClickSignOut() {
      // ログアウトする処理
    }
  },
}
</script>