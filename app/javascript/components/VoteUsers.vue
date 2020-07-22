<template>
  <div class="user-index">
    <div v-for="user in users" :key="user.id">
      {{ user.name }}
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  props: ['voteId'],
  data: function () {
    return {
      users: []
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users.json`, {
        params: {
          id: this.voteId
        }
      })
      .then(response => (this.users = response.data))
  }
}
</script>

<style scoped>
</style>