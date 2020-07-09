<template>
  <v-dialog　v-model="dialog"　width="500" v-if="invites !== 'yet'">
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        class="mt-4"
        outlined
        color="orange lighten-1"
        v-bind="attrs"
        v-on="on"
      >ユーザーを招待するには
      </v-btn>
    </template>

    <v-card>
      <v-toolbar color="orange lighten-1" dark>
        <v-toolbar-title>ユーザーを招待するには</v-toolbar-title>
      </v-toolbar>

      <v-card-text class="mt-3">
        現在のページのurlを共有することで招待が可能です
      </v-card-text>

      <v-divider></v-divider>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" text @click="dialog = false">戻る</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        invites: [],
      }
    },
    mounted () {
      axios
        .get(`/api/v1/invites/${this.$route.params.id}.json`)
        .then(response => (this.invites = response.data))
    }
  }
</script>