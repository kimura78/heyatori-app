<template>
  <div>
  

    <form @submit.prevent='joinGroup'>

      <div v-for="error in errors" :key="error">
        <p class="text-danger">{{ error }}</p>
      </div>


      <v-btn x-large color="success" dark type="submit">参加する</v-btn>

    </form>
  </div>

</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      invite: {
        group_id: this.$route.params.id
      },
      errors: ''
    }
  },
  methods: {
    joinGroup: function() {
      axios
        .post('/api/v1/invites', this.invite)
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

<style scoped>
</style> 