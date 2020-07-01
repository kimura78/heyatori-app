<template>
  <div>
    <div v-for="group in groups" :key="group.id">
      <v-list-item link>
        <v-list-item-action>
          <v-icon>mdi-home</v-icon>
        </v-list-item-action>
        <v-list-item-content>
          <v-list-item-title>
            <router-link :to="{ name: 'GroupShow', params: { id: group.id } }">{{ group.name }}</router-link>
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item> 
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