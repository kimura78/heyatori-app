<template>
  <v-row
    justify="space-around"
    align="center"
  >
    <v-col cols="12" sm="6" class="my-2 px-1">
      <v-date-picker
      v-model="picker"
      color="green lighten-1"
      header-color="blue-grey darken-1"
      year-icon="mdi-calendar-blank"
      elevation="15"
      full-width
      ></v-date-picker>
    </v-col>
  </v-row>
</template>

<script>
  export default {
    data () {
      return {
        picker: new Date().toISOString().substr(0, 10),
      }
    },
  }
</script>

<style>
</style>