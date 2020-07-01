<template>
  <div>
    <v-btn
      outlined
      color="light-green darken-4"
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
        vote: {
          timetable_id: this.timetableId
        },
        errors: ''
      }
    },
    methods: {
      createVote: function() {
        axios
          .post('/api/v1/votes', this.vote)
          .then(response => {
            this.$router.go({path: this.$router.currentRoute.path, force: true})
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