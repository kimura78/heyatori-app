<template>
  <v-app id="app">
    <group-tabs/>
    <room-index/>
  </v-app>

</template>

<script>
  import GroupTabs from '../components/GroupTabs.vue'
  import RoomIndex from '../components/RoomIndex.vue'

  export default {
    components: {
      GroupTabs,
      RoomIndex
    }
  }
</script>

<style scoped>
</style>
