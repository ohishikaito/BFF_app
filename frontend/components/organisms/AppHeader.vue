<template>
  <div>
    <nuxt-link to="/">ホームへ</nuxt-link>
    <template v-if="authenticated">
      <nuxt-link :to="`/auth/edit`">アカウント情報編集</nuxt-link>
      <v-btn @click="onClickSignOut">ログアウト</v-btn>
    </template>
    <template v-else-if="!authenticated">
      <nuxt-link :to="`/auth/sign-in`">ログイン</nuxt-link>
      <nuxt-link :to="`/auth/sign-up`">会員登録</nuxt-link>
    </template>
    <v-btn @click="onClickLogout">Logout</v-btn>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: this.$store.getters['getUser']
    }
  },
  computed: {
    authenticated() {
      return this.$store.getters['authenticated']
    },
  },
  methods: {
    onClickSignOut() {
      this.$store.dispatch('signOut')
    },
    onClickLogout() {
      console.log(this.$auth)
      this.$auth.logout()
    }
  },
}
</script>