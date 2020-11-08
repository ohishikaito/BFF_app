<template>
  <div>
    <h1>編集ページ</h1>
    <div>
      <input type="text" v-model="post.name" />
    </div>
    <button @click="onClickUpdate">登録する</button>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get(`/posts/${ctx.route.params.id}`);
      console.log(response);
      return {
        post: response.data
      };
    } catch (error) {
      console.error(error);
    }
  },
  methods: {
    async onClickUpdate() {
      try {
        const response = await this.$axios.post("/posts", this.post);
        console.log(response);
        this.$router.push(`/posts/${ctx.route.params.id}`);
      } catch (error) {
        console.error(error.response);
      }
    }
  }
};
</script>
