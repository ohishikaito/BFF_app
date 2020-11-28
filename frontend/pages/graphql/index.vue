<template>
  <p>{{ testField }}</p>
</template>

<script>
import testField from '~/apollo/gqls/queries/testField';
export default {
  data() {
    return {
      testField: {}
    }
  },
  apollo: {
    testField: {
      query: testField
    }
  }
}
</script>