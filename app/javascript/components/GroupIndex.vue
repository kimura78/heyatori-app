<template>
  <v-tabs
    fixed-tabs
    background-color="indigo"
    dark
  >
    <v-tab v-for="group in groups" :key="group.id">
      {{ group.name }}
    </v-tab>

    <v-tab-item v-for="group in groups" :key="group.id">
      <v-container fluid>
        <day-select :groupId="group.id"/>
      </v-container>
    </v-tab-item>
  </v-tabs>

  

</template>

<script>
  import axios from 'axios';
  import DaySelect from '../components/DaySelect.vue'

  export default {
    components: {
      DaySelect
    },
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