<template>
  <h1>callback! {{ hoge }}</h1>
</template>

<script>
export default {
  computed: {
    hoge() {
      console.log(this)
      return 'hoge'
    }
  }
}
</script>

<style>

</style>