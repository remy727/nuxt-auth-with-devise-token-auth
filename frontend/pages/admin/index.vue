<template>
  <v-layout align-center justify-center>
    <v-flex
      v-if="$auth.loggedIn"
      xs12 sm12 md8
    >
      <v-alert type="error" :value="!!error">{{error}}</v-alert>

      <v-btn
        class="mb-5"
        color="error"
        @click="logout"
      >Sign Out Administrator</v-btn>

      <products-list></products-list>
    </v-flex>

    <sign-in-form v-else></sign-in-form>
  </v-layout>
</template>

<script>
import SignInForm from '~/components/SignInForm'
import ProductsList from '~/components/ProductsList'

export default {
  name: 'AdminPage',
  components: {
    SignInForm,
    ProductsList,
  },
  middleware: ['auth'],
  data () {
    return {
      error: null,
    }
  },
  methods: {
    logout() {
      this.$auth.logout().catch(e => { this.error = e + '' })
    }
  }
}
</script>
