<template>
  <div class="room-index">
    <div v-for="room in rooms" :key="room.id">
      {{ room.name }}
      {{ room.group_id }}

    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        rooms: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/rooms.json`)
        .then(response => (this.rooms = response.data))
    }
  }
</script>

<style scoped>
</style>