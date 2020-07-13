<template>
  <div>
    <v-btn class="mx-2" dark icon color="error" @click.stop="dialog = true" v-if="votes === 'voter'">
      <v-icon dark>mdi-minus</v-icon>
    </v-btn>
    </v-btn>
    <v-dialog v-model="dialog" max-width="290">
      <v-card>
        <v-card-text class="mt-3">この投票を削除しますか?</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn　color="red darken-2" outlined @click="deleteVote">削除</v-btn>
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
    props: ['voteId'],
    data: function () {
      return {
        dialog: false,
        votes: '',
        errors: ''
      }
    },
    mounted () {
      axios
        .get(`/api/v1/votes/${this.voteId}.json`)
        .then(response => (this.votes = response.data))
    },
    methods: {
      deleteVote: function() {
        axios
          .delete(`/api/v1/votes/${this.voteId}`)
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