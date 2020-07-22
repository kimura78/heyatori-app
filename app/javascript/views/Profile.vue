<template>
  <div align="center">
    <v-card class="mx-auto" max-width="400">
      <v-card-title>
        <v-icon large>mdi-account</v-icon>
        <span class="title ml-4 font-weight-light">{{ user.name }}</span>
      </v-card-title> 
      <v-card-text>
        <a class="mr-3" href="/users/edit">ユーザー編集</a>
        |
        <a class="ml-3" href="/users/sign_out" data-method="delete">ログアウト</a>
      </v-card-text>
    </v-card>

  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        user: []
      }
    },
    mounted () {
      axios
        .get(`/api/v1/users/0.json`)
        .then(response => (this.user = response.data))
    }
  }
</script>