<template>
  <div class="room-index">
    <h2>ROOMINDEX</h2>
    {{ this.day }}
    {{ this.group_id }}
  </div>
</template>

<script>
  import axios from 'axios';
  import TimetableForm from '../components/TimetableForm.vue'
  import TimetableIndex from '../components/TimetableIndex.vue'

  export default {
    props: {
      day: '',
      group_id: ''
    },
    components: {
      TimetableForm,
      TimetableIndex
    },
    data: function () {
      return {
        rooms: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/rooms.json`, {
          params: {
            id: this.groupId,
            day: this.day
          }
        })
        .then(response => (this.rooms = response.data))
    }
  }
</script>

<style scoped>
</style>