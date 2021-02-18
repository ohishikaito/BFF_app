<template>
  <div>
    <h1>投稿ページ</h1>
    <div>name: <input type="text" v-model="post.name" /></div>
    <div>subName: <input type="text" v-model="post.subName" /></div>
    <div>isSpecial: <input type="checkbox" v-model="post.isSpecial" /></div>
    <!-- <div>
      video:
      <input
        ref="image0"
        type="file"
        name="image0"
        accept="image0/*"
        @change="setImage0"
      />
      <video controls ref="image0VideoUploader" :src="imgSrc"></video>
    </div> -->
    <button @click="onClickCreate">登録する</button>
  </div>
</template>

<script>
export default {
  middleware: 'authenticated',
  data() {
    return {
      imgSrc: '',
      post: {
        name: '',
        subName: '',
        isSpecial: false,
        image0: '',
      },
    }
  },
  methods: {
    toBlob(base64) {
      // console.log(base64, 'base64')
      var bin = atob(base64.replace(/^.*,/, ''))
      // console.log(bin, 'bin')
      var buffer = new Uint8Array(bin.length)
      for (var i = 0; i < bin.length; i++) {
        buffer[i] = bin.charCodeAt(i)
      }
      // Blobを作成
      try {
        var blob = new Blob([buffer.buffer], {
          type: 'video/mp4',
        })
      } catch (e) {
        return false
      }
      return blob
    },
    setImage0(e) {
      if (e.target.files[0] === undefined) {
        return
      }
      const reader = new FileReader()
      reader.onload = (e) => {
        this.imgSrc = e.target.result
        if (this.$refs.image0VideoUploader !== undefined) {
          // this.$refs.image0VideoUploader.src = this.imgSrc
        }
        // console.log(this.imgSrc, 'reader.onload = this.imgSrc')
        // this.post.image0 = this.toBlob(this.imgSrc)
        // this.post.image0 = new File(
        //   [this.$refs.image0VideoUploader.src],
        //   'image0.mp4',
        //   { type: 'video/mp4' }
        // )
      }
      const file = e.target.files[0]
      this.$refs.image0VideoUploader.src = file
      // console.log(file, 'file')
      this.post.image0 = file
      reader.readAsDataURL(file)
      // this.post.image0 = new File([this.imgSrc], 'image0.mp4', {type: 'video/mp4'})
      // this.post.image0 = new Blob([this.imgSrc], {type: 'video/mp4'})
      // this.post.image0 = this.imgSrc
    },
    async onClickCreate() {
      const req = new FormData()
      req.append('name', this.post.name)
      req.append('sub_name', this.post.subName)
      req.append('is_special', this.post.isSpecial)
      req.append('video', this.post.image0)
      try {
        const response = await this.$axios.post('/posts', req, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        this.$router.push(`/`)
      } catch (error) {
        console.error(error.response)
      }
    },
  },
}
</script>
