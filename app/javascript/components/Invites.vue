<template>
  <div class="invite-index">

    {{ this.day }}
  
    <div v-for="invite in invites" :key="invite.id">
      <group-users :inviteId="invite.user_id"/> 
    </div>

  </div>

</template>

<script>
  import axios from 'axios';
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