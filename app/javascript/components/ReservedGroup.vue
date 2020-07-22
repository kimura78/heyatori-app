<template>
  <div>
    <p>
      <v-icon class="mr-4">mdi-account-multiple</v-icon>
      {{ group.name }}
    </p>
  </div>

</template>

<script>
  import axios from 'axios'

  export default {
    props: ['groupId'],
    data: function () {
      return {
        group: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/groups/${this.groupId}.json`)
        .then(response => (this.group = response.data))
    }
  }
</script>