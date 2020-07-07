<template>
  <v-list subheader>
    <v-subheader>参加者</v-subheader>  
    <v-list-item　v-for="invite in invites" :key="invite.id">
      <group-users :inviteId="invite.user_id"/>
    </v-list-item>
  </v-list>


</template>

<script>
  import axios from 'axios'
  import GroupUsers from '../components/GroupUsers.vue'

  export default {
    components: {
      GroupUsers
    },
    data: function () {
      return {
        invites: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/invites.json`, {
          params: {
            id: this.$route.params.id
          }
        })
        .then(response => (this.invites = response.data))
    }
  }
</script>

<style scoped>
</style>