<template>
  <div>
    <h1>詳細ページ</h1>
    <ul>
      <li>
        <div>id: {{ post.id }}</div>
        <div>name: {{ post.name }}</div>
        <div>
          video-source:
          <video controls>
            <source type="video/mp4" :src="post.video.url" />
            <!-- <source type="video/mp4" src="../../../assets/test.mp4" /> -->
          </video>
          video:
          <video
            type="video/mp4"
            height="100"
            width="100"
            src="../../../assets/test.mp4"
          ></video>
          :src="post.video.url"
        </div>
      </li>
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
      // console.log(response.data)
      return {
        post: response.data,
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
