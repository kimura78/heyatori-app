<template>
  <div align="center">
    {{ this.day }}
    {{ this.groupId }}
    <v-col cols="4">
      <v-form @submit.prevent="createRoom">
        
        <v-text-field
          v-model="room.name"
          :counter="10"
          label="部屋名"
        ></v-text-field>

        <v-alert type="error" outlined dense class="mt-2"v-for="error in errors" :key="error">
          {{ error }}
        </v-alert>

        <v-btn
          type="submit"
          color="success"
          >部屋を作成する
        </v-btn>
      </v-form>
    </v-col>
  </div>
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
          day: this.day
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