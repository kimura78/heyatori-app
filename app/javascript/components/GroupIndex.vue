<template>
  <div class="group-index">
    <h2>グループ一覧</h2>
    <p v-for="group in groups" :key="group.id">
      <router-link :to="{ name: 'GroupShow', params: { id: group.id } }">{{ group.name }}</router-link>
    
    </p>
  </div>

</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        groups: []
      }
    },
    mounted () {
      axios
        .get('/api/v1/groups.json')
        .then(response => (this.groups = response.data))
    }
  }
</script>

<style scoped>
</style>