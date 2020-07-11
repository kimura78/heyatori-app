<template>
  <div align="center" class="mt-5">
    <h4>グループ名を入力してください</h4>

    <v-col cols="12" sm="8" md="8" lg="4" class="text-center pt-5">
      <v-form ref="form" @submit.prevent="createGroup">
        <v-alert type="error" outlined dense class="mt-2"v-for="error in errors" :key="error">
          {{ error }}
        </v-alert>

        <v-text-field
          v-model="group.name"
          :counter="20"
          label="Name"
        ></v-text-field>

        <v-btn type="submit" color="orange lighten-1" outlined>グループを作成する
        </v-btn>
      </v-form>
    </v-col>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        group: {
          name: ''
        },
        errors: ''
      }
    },
    methods: {
      createGroup: function() {
        axios
          .post('/api/v1/groups', this.group)
          .then(response => {
            let group = response.data;
            this.$router.push({ name: 'Home' });
          })
          .catch(error => {
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          });
      }
    }
  }
</script>

<style scoped>
</style>