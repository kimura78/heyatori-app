<template>
  <div align="center">
    <v-col cols="12" sm="6" class="my-2 px-1">
      <v-date-picker
      class="my-2 px-1"
      v-model="picker"
      :events="this.roomdays"
      color="green lighten-1"
      header-color="orange lighten-1"
      year-icon="mdi-calendar-blank"
      elevation="15"
      full-width
      ></v-date-picker>
    </v-col>

    <v-btn 
    class="ma-2" 
    outlined 
    color="orange lighten-1" 
    :to="{ name: 'RoomIndex', params: { id: this.groupId, day: picker } }">
      この日付にする
    </v-btn>

    <v-btn
    class="ma-2" 
    outlined 
    color="orange lighten-1" 
    :to="{ name: 'GroupShow', params: { id: this.groupId, name: encode_name } }">
      グループ詳細
    </v-btn>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    props: {
      groupId: '',
      groupName: ''
    },
    data: function () {
      return {
        rooms: [],
        roomdays: [],
        picker: new Date().toISOString().substr(0, 10),
        encode_name: encodeURI(this.groupName),
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