<template>
  <div id="inspire">
    <v-navigation-drawer
      v-model="drawer"
      color="orange lighten-1"
      dark
      app
    >
      <v-list dense>
        <v-list-item link v-for="menu in menus" :key="menu.title" :to="menu.url">
          <v-list-item-icon>
            <v-icon>{{ menu.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ menu.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link :to="user_menu.url">
          <v-list-item-icon>
            <v-icon>{{ user_menu.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ user.name }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

      </v-list>
    </v-navigation-drawer>

    <v-app-bar
      app
      color="orange lighten-1"
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>
        部屋取りアプリ
      </v-toolbar-title>
    </v-app-bar>
  </div>
</template>

<script>
  import axios from 'axios';
  import GroupIndex from '../components/GroupIndex.vue'
  
  export default {
    props: {
      source: String,
    },
    components: {
      GroupIndex
    },
    data: () => ({
      drawer: null,
      user: [],
      menus: [
        { title: 'Home', icon: 'mdi-home', url: '/' },
        { title: 'グループ作成', icon: 'mdi-account-multiple', url: '/groups/new' },
      ],
      user_menu:  {
        icon: 'mdi-account', url: '/profile'
      }

    }),
    mounted () {
      axios
        .get(`/api/v1/users/0.json`)
        .then(response => (this.user = response.data))
    }
  }
</script>