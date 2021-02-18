<template>
  <div>
    <h1>詳細ページ</h1>
    <ul>
      <li>id: {{ post.id }}</li>
      <li>name: {{ post.name }}</li>
      <li>subName: {{ post.subName }}</li>
      <li>is_special :{{ post.isSpecial }}</li>
      <!-- <li>
        video-source:
        <video controls>
          <source type="video/mp4" :src="post.video.url" />
          <source type="video/mp4" src="../../../assets/test.mp4" />
        </video>
        video:
        <video
          type="video/mp4"
          height="100"
          width="100"
          src="../../../assets/test.mp4"
        ></video>
        :src="post.video.url"
        <img :src="post.video.url">
      </li> -->
    </ul>
    <button @click="onClickEdit">編集する</button>
    <button @click="onClickDestroy">削除</button>
  </div>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get(`/posts/${ctx.route.params.id}`)
      const post = response.data
      return {
        post,
      }
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    onClickEdit() {
      this.$router.push(`/posts/${this.post.id}/edit`)
    },
    async onClickDestroy() {
      try {
        const response = await this.$axios.delete(`/posts/${this.post.id}`)
        this.$router.push(`/`)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
