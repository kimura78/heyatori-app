<template>
  <div align="center">
    <p>{{ group.name }}</p>

    <group-join/>
    <invites/>
  </div>
</template>

<script>
  import axios from 'axios';
  import Invites from '../components/Invites.vue'
  import GroupJoin from '../components/GroupJoin.vue'

  export default {
    components: {
      Invites,
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