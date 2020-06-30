<template>
  <div>
    <p v-for="timetable in timetables" :key="timetable.id">
      {{ timetable.start_time }}     ~      {{ timetable.end_time }}

    </p>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['roomId'],
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