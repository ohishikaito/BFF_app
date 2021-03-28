<template>
  <v-container>
    <h1>こんにちは、{{this.$auth.$state.user.familyName}}さん!</h1>
    <h3>{{ user }}</h3>
  </v-container>
</template>

<script>
export default {
  computed: {
    user() {
      console.log(this.$auth)
      return this.$auth.$state.user
    }
  }
}
</script>
