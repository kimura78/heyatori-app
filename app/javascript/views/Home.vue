<template>
  <v-app id="app">
    <h1>HOME</h1>
    <group-index/>
  </v-app>

</template>

<script>
  import GroupIndex from '../components/GroupIndex.vue'

  export default {
    components: {
      GroupIndex
    }
  }
</script>

<style scoped>
</style>
