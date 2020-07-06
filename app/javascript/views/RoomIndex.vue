<template>
  <div align="center">
    <h2>{{ this.$route.params.day }}</h2>

    <v-card v-for="room in rooms" :key="room.id" class="mx-auto mt-4" max-width="300" tile>
      <v-subheader>{{ room.name }}</v-subheader>

      <v-list>
        <timetable-index :roomId="room.id"/>
      </v-list>

      <timetable-form :roomId="room.id"/>
    </v-card>

    <room-form :day="this.$route.params.day" :groupId="this.$route.params.id"/>
  </div>
</template>

<script>
  import axios from 'axios';
  import RoomForm from '../components/RoomForm.vue'
  import TimetableForm from '../components/TimetableForm.vue'
  import TimetableIndex from '../components/TimetableIndex.vue'

  export default {
    props: {
      day: '',
      groupId: ''
    },
    components: {
      RoomForm,
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
            id: this.$route.params.id,
            day: this.$route.params.day
          }
        })
        .then(response => (this.rooms = response.data))
    }
  }
</script>

<style scoped>
</style>