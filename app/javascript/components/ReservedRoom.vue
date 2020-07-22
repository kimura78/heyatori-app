<template>
  <div>
    <p v-for="room in rooms" :key="room.id">
       <reserved-group :groupId="room.group_id"/>
      {{ room.day }}
      {{ room.name }}
    </p>
  </div>

</template>

<script>
  import axios from 'axios'
  import ReservedGroup from '../components/ReservedGroup.vue'

  export default {
    props: ['roomId'],
    components: {
      ReservedGroup
    },
    data: function () {
      return {
        rooms: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/rooms/${this.roomId}.json`)
        .then(response => (this.rooms = response.data))
    }
  }
</script>