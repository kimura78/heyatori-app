<template>

  <form @submit.prevent="createRoom">

    <div v-for="error in errors" :key="error">
      <p class="text-danger">{{ error }}</p>
    </div>

    <div>
      <label>部屋名</label>
      <input v-model="room.name" type="text">
      <button type="submit" class="btn btn-outline-success btn-sm">作成</button>
    </div>

  </form>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      room: {
        name: '',
        day_id: this.$route.params.id
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