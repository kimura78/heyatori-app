<template>
  <div>
    <p v-for="timetable in timetables" :key="timetable.id">
      {{ timetable.start_time }}     ~      {{ timetable.end_time }}

      <vote-form :timetableId="timetable.id"></vote-form>
      <vote-index :timetableId="timetable.id"></vote-index>

    </p>
  </div>
</template>

<script>
  import axios from 'axios';
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