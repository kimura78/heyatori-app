<template>
  <v-app id="app" class="mt-5" align="center">
    <div v-for="invite in invites" :key="invite.id">
      <group-index :inviteId="invite.group_id"/>
    </div>

    <div v-if="invites === 'yet'">
      <h1>Hello World!!</h1>
      <p>まずはグループを作成しましょう</p>
      <router-link :to="{ name: 'GroupNew'}">グループ作成</router-link>
    </div>
  </v-app>
</template>

<script>
  import axios from 'axios'
  import GroupIndex from '../components/GroupIndex.vue'

  export default {
    components: {
      GroupIndex,
    },
    data: function () {
      return {
        invites: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/invites/0.json`)
        .then(response => (this.invites = response.data))
    }
  }
</script>

<style scoped>
</style>
