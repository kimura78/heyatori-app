<template>
  <div id="inspire">
    <v-navigation-drawer
      v-model="drawer"
      app
    >
      <v-list dense>
        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-face</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              <current-user/>
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-home</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              <router-link :to="{ name: 'Home'}">Home</router-link>
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-email</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>
              <router-link :to="{ name: 'GroupNew'}">グループ作成</router-link>
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar
      app
      color="red lighten-1"
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Application</v-toolbar-title>
      <v-spacer></v-spacer>
    </v-app-bar>
  </div>
</template>

<script>
  import CurrentUser from '../components/CurrentUser.vue'
  import GroupIndex from '../components/GroupIndex.vue'
  
  export default {
    props: {
      source: String,
    },
    components: {
      CurrentUser,
      GroupIndex
    },
    data: () => ({
      drawer: null,
    }),
  }
</script>