<template>
  <div align="center">
    <v-card max-width="400" class="mx-auto">
      <v-toolbar>
        <v-toolbar-title>{{ group.name }}</v-toolbar-title>
      </v-toolbar>

      <invites/>
    </v-card>
     
    <group-join/>

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