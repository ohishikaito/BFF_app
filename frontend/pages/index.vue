<template>
  <v-app> あ </v-app>
</template>

<script>
export default {
  data() {
    console.log("a");
    return {
      posts: [],
    };
  },
  async asyncData({ app }) {
    const res = await app.$axios.$get("http://www.example.com");
    return { axios_data: res };
  },
};
</script>

<style></style>
