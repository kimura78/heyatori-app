<template>
  <div align="center">
    <h4>予約済みの部屋一覧</h4>

    <v-card class="mx-auto" max-width="400"> 
      <v-card-text v-for="vote in votes" :key="vote.id">
        <reserved-timetable :timetableId="vote.timetable_id"/>
        <v-divider></v-divider>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
  import axios from 'axios'
  import ReservedTimetable from '../components/ReservedTimetable.vue'

  export default {
    components: {
      ReservedTimetable
    },
    data: function () {
      return {
        votes: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/votes.json`)
        .then(response => (this.votes = response.data))
    }
  }
</script>