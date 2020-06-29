<template>
  <div>
    <p>{{ group.name }}</p>

    <group-join/>
  </div>
</template>

<script>
  import axios from 'axios';
  import GroupJoin from '../components/GroupJoin.vue'

  export default {
    components: {
      GroupJoin
    },
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