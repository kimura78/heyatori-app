<template>
  <div>
    <v-subheader v-for="vote in votes" :key="vote.id">
      投票者：
      <vote-users :voteId="vote.user_id"/>
      <vote-delete-modal :voteId="vote.id"/>
    </v-subheader>
  </div>
</template>

<script>
  import axios from 'axios';
  import VoteUsers from '../components/VoteUsers.vue';
  import VoteDeleteModal from '../components/VoteDeleteModal.vue';

  export default {
    components: {
      VoteUsers,
      VoteDeleteModal
    },
    props: ['timetableId'],
    data: function () {
      return {
        votes: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/votes.json`, {
          params: {
            id: this.timetableId
          }
        })
        .then(response => (this.votes = response.data))
    }
  }
</script>