<template>
  <div>
    <nuxt-link to="/">ホームへ</nuxt-link>
    <template v-if="authenticated">
      <p>{{ currentUserName }}</p>
      <button @click="onClickSignOut">ログアウト</button>
    </template>
    <template v-else-if="!authenticated">
      <nuxt-link :to="`/auth/sign-in`">ログイン</nuxt-link>
      <nuxt-link :to="`/auth/sign-up`">会員登録</nuxt-link>
    </template>
  </div>
</template>

<script>
export default {
  computed: {
    authenticated() {
      return this.$store.getters['authenticated']
    },
    currentUserName() {
      const user = this.$store.getters['getUser']
      return user.name
    }
  },
  methods: {
    onClickSignOut() {
      this.$store.dispatch('signOut')
    }
  },
}
</script>