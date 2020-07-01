<template>
  <v-app id="app">
    <a href="/users/sign_up">プロフィール変更</a>
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
