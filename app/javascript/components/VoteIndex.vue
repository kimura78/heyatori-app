<template>
  <div>
    <v-subheader v-for="vote in votes" :key="vote.id" v-if="votes !== 'yet'">
      投票者：
      <vote-users :voteId="vote.user_id"/>
      <vote-delete-dialog :voteId="vote.id"/>
    </v-subheader>
  </div>
</template>

<script>
  import axios from 'axios';
  import VoteUsers from '../components/VoteUsers.vue';
  import VoteDeleteDialog from '../components/VoteDeleteDialog.vue';

  export default {
    components: {
      VoteUsers,
      VoteDeleteDialog
    },
    props: ['timetableId'],
    data: function () {
      return {
        votes: []
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
    }
  }
</script>