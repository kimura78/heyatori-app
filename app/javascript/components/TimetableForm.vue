<template>
  <v-dialog　v-model="dialog"　width="700">
    <template v-slot:activator="{ on, attrs }">
      <v-btn text color="primary" v-bind="attrs" v-on="on">タイムテーブルを追加</v-btn>
    </template>

    <v-card>
      <v-toolbar color="orange lighten-1" dark>
        <v-toolbar-title>時間を選択してください</v-toolbar-title>
      </v-toolbar>

      <form @submit.prevent="createTimetable">
        <v-card-text class="mt-3">
          <v-row justify="space-around" align="center">
            <v-col style="width: 320px; flex: 0 1 auto;">
              <p>開始時間:</p>
              <v-time-picker color="orange lighten-1" v-model="timetable.start_time" elevation="15"></v-time-picker>
            </v-col>
            <v-col style="width: 320px; flex: 0 1 auto;">
              <p>終了時間:</p>
              <v-time-picker color="orange lighten-1" v-model="timetable.end_time" elevation="15"></v-time-picker>
            </v-col>
          </v-row>
          <v-alert type="error" outlined dense class="mt-2"v-for="error in errors" :key="error">
            {{ error }}
          </v-alert>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn small outlined color="primary" type="submit">作成</v-btn>
          <v-btn text color="light-green darken-3" @click="dialog = false">戻る</v-btn>
        </v-card-actions>
      </form>
    </v-card>
  </v-dialog>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['roomId'],
    data: function () {
      return {
        dialog: false,
        invites: '',
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