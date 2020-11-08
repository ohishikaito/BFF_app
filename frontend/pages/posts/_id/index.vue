<template>
  <div>
    <h1>詳細ページ</h1>
    <ul>
      <li>
        <div>id: {{ post.id }}</div>
        <div>name: {{ post.name }}</div>
      </li>
    </ul>
    <button @click="onCilckEdit">編集する</button>
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
    onClickEdit() {
      this.$router.push(`/posts/${ctx.route.params.id}/edit`);
    }
  }
};
</script>
