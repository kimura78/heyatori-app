<template>
  <div align="center">
    <v-card max-width="400" class="mx-auto">
      <v-toolbar color="orange lighten-1" dark>
        <v-icon class="mr-4">mdi-account-multiple</v-icon>
        <v-toolbar-title>{{ group.name }}</v-toolbar-title>
      </v-toolbar>

      <invites/>
    </v-card>
    <group-join/>
    <invite-dialog/>

  </div>
</template>

<script>
  import axios from 'axios';
  import Invites from '../components/Invites.vue'
  import GroupJoin from '../components/GroupJoin.vue'
  import InviteDialog from '../components/InviteDialog.vue'
 
  export default {
    components: {
      Invites,
      GroupJoin,
      InviteDialog
    },
    data: function () {
      return {
        dialog: false,
        group: [],
        decode_name: decodeURI(this.$route.params.name)
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