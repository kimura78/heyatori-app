<template>
  <v-col cols="12" sm="8" md="8" lg="4" class="text-center pt-5">
    <v-form @submit.prevent="createRoom">
      <v-alert type="error" outlined dense class="mt-2"v-for="error in errors" :key="error">
        {{ error }}
      </v-alert>
      
      <v-text-field
        v-model="room.name"
        :counter="10"
        label="部屋名">
        </v-text-field>

      <v-btn type="submit" color="primary" outlined>部屋を作成する</v-btn>
    </v-form>
  </v-col>
</template>

<script>
  import axios from 'axios';

  export default {
    props: {
      day: '',
      groupId: ''
    },
    data: function () {
      return {
        room: {
          name: '',
          day: this.day,
          group_id: this.groupId
        },
        errors: ''
      }
    },
    methods: {
      createRoom: function() {
        axios
          .post('/api/v1/rooms', this.room)
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

<style>
</style>