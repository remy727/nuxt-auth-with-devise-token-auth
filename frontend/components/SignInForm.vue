<template>
  <v-flex xs12 sm8 md6>
    <v-card>
      <v-alert type="error" :value="!!error">{{error}}</v-alert>
      <v-toolbar dark color="primary">
          <v-toolbar-title>SIGN IN</v-toolbar-title>
       </v-toolbar>
      <v-card-text>
        <v-form ref="form">
          <v-text-field
            v-model="user.email"
            prepend-icon="mdi-email"
            name="login"
            label="Email Address"
            type="text"
            :rules="[rules.required, rules.email]"
          ></v-text-field>
          <v-text-field
            v-model="user.password"
            prepend-icon="mdi-lock"
            name="password"
            label="Password"
            type="password"
            :rules="[rules.required]"
          ></v-text-field>
        </v-form>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn
          color="primary"
          class="mr-4"
          x-large
          @click="login"
        >
          Sign In
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-flex>
</template>

<script>
export default {
  name: 'SignInForm',
  data () {
    return {
    	user: {
	      email: '',
	      password: '',
	    },
      error: null,
      rules: {
        required: value => !!value || 'Required.',
        email: (v) => {
          const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
          return pattern.test(v) || 'Invalid e-mail.'
        },
      }
    }
  },
  methods: {
    async login() {
    	if (!this.$refs.form.validate()) return

      try {
        await this.$auth.loginWith('local', { data: this.user })
      } catch (err) {
      	this.error = "There was an issue to login"
        console.log(err)
      }
    },
  }
}
</script>
