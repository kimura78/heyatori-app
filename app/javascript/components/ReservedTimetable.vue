<template>
  <div>
    <p v-for="timetable in timetables" :key="timetable.id">
      <reserved-room :roomId="timetable.room_id"/>
      {{ timetable.start_time }} ~ {{ timetable.end_time }}
    </p>
  </div>

</template>

<script>
  import axios from 'axios'
  import ReservedRoom from '../components/ReservedRoom.vue'

  export default {
    props: ['timetableId'],
    components: {
      ReservedRoom
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
            timetable_id: this.timetableId
          }
        })
        .then(response => (this.timetables = response.data))
    }
  }
</script>