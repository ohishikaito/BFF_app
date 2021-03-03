<template>
  <div>
    <app-post-form :post="post"></app-post-form>
    <h1>投稿フォーム</h1>
    <div>name: <input type="text" v-model="post.name" /></div>
    <div>subName: <input type="text" v-model="post.subName" /></div>
    <div>isSpecial: <input type="checkbox" v-model="post.isSpecial" /></div>
    <div>
      image:
      <img :src="imagePreview" />
      <input type="file" @change="setImage" />
      <v-file-input @change="setImage" label="画像" />
    </div>
    <button @click="onClickCreate">登録する</button>
  </div>
</template>

<script>
import AppPostForm from '../../components/organisms/AppPostForm.vue'
export default {
  components: { AppPostForm },
  middleware: 'authenticated',
  data() {
    return {
      imagePreview: '',
      post: {
        name: '',
        subName: '',
        isSpecial: false,
        video: '',
        image1: '',
      },
    }
  },
  methods: {
    setImage(file) {
      // file = file.target.files[0] // NOTE: inputを使ったやり方はこっち。
      this.post.image = file
      const reader = new FileReader()
      reader.readAsDataURL(file)
      reader.onload = (e) => {
        this.imagePreview = e.target.result
      }
    },
    async onClickCreate() {
      const req = new FormData()
      req.append('name', this.post.name)
      req.append('sub_name', this.post.subName)
      req.append('is_special', this.post.isSpecial)
      req.append('video', this.post.video)
      req.append('image', this.post.image)
      console.log(req)
      try {
        const response = await this.$axios.post('/posts', req, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        this.$router.push(`/posts/${response.data.id}`)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
