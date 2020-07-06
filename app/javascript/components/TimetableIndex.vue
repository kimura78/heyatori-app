<template>
  <v-expansion-panels>
    <v-expansion-panel v-for="timetable in timetables" :key="timetable.id">
      <v-expansion-panel-header>
        {{ timetable.start_time }} ~ {{ timetable.end_time }}
      </v-expansion-panel-header>

      <v-expansion-panel-content>
        <vote-index :timetableId="timetable.id"></vote-index>
        <vote-form :timetableId="timetable.id"></vote-form>
      </v-expansion-panel-content>

    </v-expansion-panel>
  </v-expansion-panels>

</template>

<script>
  import axios from 'axios'
  import VoteForm from '../components/VoteForm.vue'
  import VoteIndex from '../components/VoteIndex.vue'

  export default {
    props: ['roomId'],
    components: {
      VoteForm,
      VoteIndex
    },
    data: function () {
      return {
        timetables: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/timetables.json`, {
          params: {
            room_id: this.roomId
          }
        })
        .then(response => (this.timetables = response.data))
    }
  }
</script>