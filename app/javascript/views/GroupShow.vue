<template>
  <p>{{ group.name }}</p>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        group: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/groups/${this.$route.params.id}.json`)
        .then(response => (this.group = response.data))
    }
  }
</script>

<style scoped>
</style>