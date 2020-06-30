<template>
  <v-app id="app">
    <group-index/>
    <room-index/>
  </v-app>

</template>

<script>
  import GroupIndex from '../components/GroupIndex.vue'
  import RoomIndex from '../components/RoomIndex.vue'

  export default {
    components: {
      GroupIndex,
      RoomIndex
    }
  }
</script>

<style scoped>
</style>
