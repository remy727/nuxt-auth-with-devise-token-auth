<template>
  <v-app>
    <AppHeader/>
    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>
    <AppFooter/>
  </v-app>
</template>

<script>
export default {
  name: "DefaultLayout",
  data() {
    return {
    }
  }
}
</script>
