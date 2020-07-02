<template>
  <v-container>
    <v-expansion-panels>
      <v-expansion-panel v-for="group in groups" :key="group.id">
        <v-expansion-panel-header>{{ group.name }}</v-expansion-panel-header>
        <v-expansion-panel-content>
          <day-select :groupId="group.id"/>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </v-container>

</template>
<script>
  import axios from 'axios'
  import DaySelect from '../components/DaySelect.vue'

  export default {
    props: ['inviteId'],
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
        .get('/api/v1/groups.json', {
          params: {
            id: this.inviteId
          }
        })
        .then(response => (this.groups = response.data))
    }
  }
</script>

<style scoped>
</style>