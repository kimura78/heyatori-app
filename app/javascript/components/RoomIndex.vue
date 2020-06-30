

<template>
  <div class="room-index">
    <v-row>
      <v-col
        v-for="room in rooms" :key="room.id"
        cols="6"
        sm="9"
        md="9"
        lg="3">
        <v-card>
          <v-card-title class="subheading font-weight-bold">{{ room.name }}</v-card-title>

          <v-divider></v-divider>

          <v-list dense>
            <v-list-item>
              <v-list-item-content>
                <timetable-index :roomId="room.id"/>
                <timetable-form :roomId="room.id"/>
              </v-list-item-content>
            </v-list-item>

          </v-list>
        </v-card>
      </v-col>
    </v-row>
    <div v-for="room in rooms" :key="room.id">
      {{ room.name }}
      <timetable-form :roomId="room.id"/>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import TimetableForm from '../components/TimetableForm.vue'
  import TimetableIndex from '../components/TimetableIndex.vue'

  export default {
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
        .get(`/api/v1/rooms.json`)
        .then(response => (this.rooms = response.data))
    }
  }
</script>

<style scoped>
</style>