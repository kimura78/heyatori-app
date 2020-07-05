<template>
  <div>
    <v-row
      justify="space-around"
      align="center"
    >
      <v-col cols="12" sm="6" class="my-2 px-1">
        <v-date-picker
        v-model="picker"
        :events="this.roomdays"
        color="green lighten-1"
        header-color="blue-grey darken-1"
        year-icon="mdi-calendar-blank"
        elevation="15"
        full-width
        ></v-date-picker>
      </v-col>


      <router-link :to="{ name: 'RoomIndex', params: { day: picker, group_id: this.groupId } }">この日付にする</router-link>
    </v-row>

    

  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    props: ["groupId"],
    data: function () {
      return {
        rooms: [],
        roomdays: [],
        picker: new Date().toISOString().substr(0, 10),
      }
    },
    mounted () {
      axios
        .get(`/api/v1/rooms.json`, {
          params: {
            id: this.groupId
          }
        })
        .then(response => {
          (this.rooms = response.data);
          this.roomdays = this.rooms.map(item => item.day);
          })
    }
  }
</script>

<style>
</style>