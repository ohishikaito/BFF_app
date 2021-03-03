<template>
  <div>
    <h1>投稿フォーム</h1>
    <div>name: <input type="text" v-model="post.name" /></div>
    <div>subName: <input type="text" v-model="post.subName" /></div>
    <div>isSpecial: <input type="checkbox" v-model="post.isSpecial" /></div>
    <div>
      image:
      <img :src="imagePreview" />
      <!-- <input type="file" @change="setImage" /> -->
      <v-file-input @change="setImage" label="画像" />
    </div>
  </div>
</template>

<script>
export default {
  props: ['post'],
  data() {
    return {
      imagePreview: '',
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
  }
}
</script>
