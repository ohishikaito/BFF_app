<template>
  <v-app>
    pages/index
  </v-app>
</template>

<script>
export default {
  async asyncData(ctx) {
    try {
      const response = await ctx.$axios.get(`/products/${ctx.route.params.id}`);
      const product = response.data;
      return {
        product,
      };
    } catch (error) {
      console.error(error);
    }
  },
};
</script>
