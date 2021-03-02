<template>
  <div>
    <h1>投稿ページ</h1>
    <div>name: <input type="text" v-model="post.name" /></div>
    <div>subName: <input type="text" v-model="post.subName" /></div>
    <div>isSpecial: <input type="checkbox" v-model="post.isSpecial" /></div>
    <!-- <div>
      video:
      <input
        ref="video"
        type="file"
        name="video"
        accept="video/*"
        @change="set"
      />
      <video controls ref="videoUploader" :src="imgSrc"></video>
    </div> -->
    <div>
      image:
      <input
        type="file"
        @change="setImage"
      />
      <img ref="image1Uploader" :src="imgSrc">
    </div>
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
        video: '',
        image1: '',
      },
    }
  },
  methods: {
    toBlob(base64) {
      var bin = atob(base64.replace(/^.*,/, ''))
      var buffer = new Uint8Array(bin.length)
      for (var i = 0; i < bin.length; i++) {
        buffer[i] = bin.charCodeAt(i)
      }
      try {
        var blob = new Blob([buffer.buffer], {
          type: 'video/mp4',
        })
      } catch (e) {
        return false
      }
      return blob
    },
    setVideo(e) {
      if (e.target.files[0] === undefined) {
        return
      }
      const reader = new FileReader()
      reader.onload = (e) => {
        this.imgSrc = e.target.result
        // this.post.video = this.toBlob(this.imgSrc)
        // this.post.video = new File(
        //   [this.$refs.videoUploader.src],
        //   'video.mp4',
        //   { type: 'video/mp4' }
        // )
      }
      const file = e.target.files[0]
      this.$refs.videoUploader.src = file
      this.post.video = file
      reader.readAsDataURL(file)
      // this.post.video = new File([this.imgSrc], 'video.mp4', {type: 'video/mp4'})
      // this.post.video = new Blob([this.imgSrc], {type: 'video/mp4'})
      // this.post.video = this.imgSrc
    },

    setImage(e) {
      if (e.target.files[0] === undefined) {
        return
      }
      this.post.image = e
    },
    async onClickCreate() {
      const req = new FormData()
      req.append('name', this.post.name)
      req.append('sub_name', this.post.subName)
      req.append('is_special', this.post.isSpecial)
      req.append('video', this.post.video)
      const blob = new Blob([this.post.image], {type: 'image/png'})
      req.append('post[image]', blob)
      req.append('image', this.post.image)
      console.log(req)
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
