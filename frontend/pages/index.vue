<template>
  <v-layout>
    <v-flex v-if="$auth.loggedIn">
      <v-row>
        <v-col cols="12">
          You are currently signed into <a href="/admin">Admin</a>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12">
          <v-btn
            color="error"
            @click="logout"
          >Sign Out Administrator</v-btn>
        </v-col>
      </v-row>
    </v-flex>

    <v-flex v-else>
      Main Page
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: 'IndexPage',
  methods: {
    logout() {
      this.$auth.logout().catch(e => {})
    }
  }
}
</script>
