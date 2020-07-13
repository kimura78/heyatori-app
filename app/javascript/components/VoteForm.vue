<template>
  <div>
    <v-btn
      v-if="votes === 'yet'"
      outlined
      color="light-green darken-4"
      class="ml-3"
      @click="createVote"
    >投票
    </v-btn>

    <v-alert type="error" outlined dense class="mt-2"v-for="error in errors" :key="error">
      {{ error }}
    </v-alert>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['timetableId'],
    data: function () {
      return {
        votes: [],
        vote: {
          timetable_id: this.timetableId
        },
        errors: ''
      }
    },
    mounted () {
      axios
        .get(`/api/v1/votes/0.json`, {
          params: {
            timetable_id: this.timetableId
          }
        })
        .then(response => (this.votes = response.data))
    },
    methods: {
      createVote: function() {
        axios
          .post('/api/v1/votes', this.vote)
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