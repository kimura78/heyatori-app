<template>
  <v-app id="app">
    <Header/>
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="12" sm="12" md="12" lg="12">
            <router-view/>
          </v-col>  
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
  import Header from './components/Header.vue'

  export default {
    components: {
      Header
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
