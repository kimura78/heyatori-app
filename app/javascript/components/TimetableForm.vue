<template>
  <form @submit.prevent="createTimetable">
    <v-row justify="space-around" align="center">
      <v-col>
        <v-subheader>タイムテーブルを追加</v-subheader>
        <input v-model="timetable.start_time" type="time">
        <input v-model="timetable.end_time" type="time">
        <v-btn small outlined color="indigo" type="submit">作成</v-btn>
      </v-col>
    </v-row>

    <v-alert type="error" outlined dense class="mt-2"v-for="error in errors" :key="error">
      {{ error }}
    </v-alert>
  </form>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['roomId'],
    data: function () {
      return {
        timetable: {
          start_time: '',
          end_time: '',
          room_id: this.roomId
        },
        errors: ''
      }
    },
    methods: {
      createTimetable: function() {
        axios
          .post('/api/v1/timetables', this.timetable)
          .then(response => {
            window.location.reload()
          })
          .catch(error => {
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          });
      }
    }
  }
</script>

<style scoped>
</style>