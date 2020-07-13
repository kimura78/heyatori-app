<template>
  <div>
    <v-btn class="mx-2" dark icon color="error" @click.stop="dialog = true" v-if="timetables === 'right'">
      <v-icon dark>mdi-minus</v-icon>
    </v-btn>
    </v-btn>
    <v-dialog v-model="dialog" max-width="290">
      <v-card>
        <v-card-text class="mt-3">このタイムテーブルを削除しますか?</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn　color="red darken-2" outlined @click="deleteTimetable">削除</v-btn>
          <v-btn color="primary" text @click="dialog = false">戻る</v-btn>
          <v-alert type="error" outlined dense class="mt-2"v-for="error in errors" :key="error">
            {{ error }}
          </v-alert>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['timetableId'],
    data: function () {
      return {
        dialog: false,
        timetables: '',
        errors: ''
      }
    },
    mounted () {
      axios
        .get(`/api/v1/timetables/${this.timetableId}.json`)
        .then(response => (this.timetables = response.data))
    },
    methods: {
      deleteTimetable: function() {
        axios
          .delete(`/api/v1/timetables/${this.timetableId}`)
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