<template>
  <v-app id="app">
    <h1>HOME</h1>
    <day-select/>
    <group-index/>
  </v-app>

</template>

<script>
  import GroupIndex from '../components/GroupIndex.vue'
  import DaySelect from '../components/DaySelect.vue'

  export default {
    components: {
      GroupIndex,
      DaySelect

    }
  }
</script>

<style scoped>
</style>
