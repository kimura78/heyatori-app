<template>
  <div class="group-index">
    <h2>グループ一覧</h2>
    <div v-for="group in groups" :key="group.id">
      {{ group.name }}
    
    </div>
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