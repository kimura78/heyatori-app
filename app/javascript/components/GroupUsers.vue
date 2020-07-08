<template>
  <div>
    <v-list-item v-for="user in users" :key="user.id">

      <v-list-item-avatar>
        <v-icon>
          mdi-account
        </v-icon>
      </v-list-item-avatar>

      <v-list-item-content>
        <v-list-item-title v-text="user.name"></v-list-item-title>
      </v-list-item-content>
    
    </v-list-item>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['inviteId'],
    data: function () {
      return {
        users: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/users.json`, {
          params: {
            id: this.inviteId
          }
        })
        .then(response => (this.users = response.data))
    }
  }
</script>

<style scoped>
</style>