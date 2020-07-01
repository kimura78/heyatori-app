<template>

  <div>
    <p v-for="vote in votes" :key="vote.id">

      <vote-users :voteId="vote.user_id"/>

    </p>
  </div>
    
</template>

<script>
import axios from 'axios';
import VoteUsers from '../components/VoteUsers.vue'
export default {
  components: {
    VoteUsers
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