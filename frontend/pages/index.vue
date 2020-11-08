<template>
  <div>
    pages/index.vue
    <app-user-detail :name="name" :resetFn="resetName()"></app-user-detail>
  </div>
</template>

<script>
    export default {
      data: function(){
        console.log("1111111111111111");
            return {
                name: "Kei12"
            }
        },
        methods: {
            resetName() {
                this.name = "4343";
            }
        } 
    }
</script>