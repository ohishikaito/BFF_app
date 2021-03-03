<template>
  <v-container>
    <v-card-title>投稿フォーム</v-card-title>
    <v-card width="1000">
      <v-text-field label="post.name" v-model="post.name"></v-text-field>
      <v-text-field label="post.subName" v-model="post.subName"></v-text-field>
      <v-checkbox label="post.isSpecial" v-model="post.isSpecial"></v-checkbox>
      <v-img
        :src="imagePreview"
        width="300"
        heigth="300"
        @click="$refs.image.click()"
      />
      <input
        type="file"
        @change="setImage"
        ref="image"
      />
    </v-card>
  </v-container>
</template>

<script>
export default {
  props: ['post'],
  data() {
    return {
      imagePreview: this.post.image ? this.post.image.url : require('~/assets/images/no-img.jpg')
    }
  },
  methods: {
    setImage(e) {
      const file = e.target.files[0]
      this.post.image = file

      // NOTE: FileReaderクラスを継承した定数readerを宣言
      const reader = new FileReader()
      // NOTE: readAsDataURLで定数readerにfileを読ませる（v-file-inputでアップした画像）
      reader.readAsDataURL(file)
      // NOTE: readAsDataURLで読まれたらonloadが即時関数として走る
      reader.onload = (e) => {
        this.imagePreview = e.target.result
      }
    },
  }
}
</script>
