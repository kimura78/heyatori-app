<template>
  <div>
    {{ user.name }}
  </div>

</template>

<script>
  import axios from 'axios';
  export default {
    data: function () {
      return {
        user: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/users/0.json`)
        .then(response => (this.user = response.data))
    }
  }
</script>