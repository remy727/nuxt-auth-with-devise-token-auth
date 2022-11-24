<template>
  <div>
    <v-skeleton-loader
      v-if="loading"
      type="card"
    >
    </v-skeleton-loader>

    <v-card v-else>
      <v-toolbar
        color="light-blue"
        dark
      >
        <v-toolbar-title>Collections</v-toolbar-title>
      </v-toolbar>

      <v-simple-table dense>
        <template #default>
          <thead>
            <tr>
              <th class="text-left">Title</th>
              <th class="text-left">Price</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="product in products"
              :key="product.id"
            >
              <td>{{ product.title }}</td>
              <td>{{ product.price }}</td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-card>
  </div>
</template>

<script>
export default {
  name: 'ProductsList',
  middleware: ['auth'],
  data() {
    return {
      loading: true,
      products: [],
    }
  },
  mounted() {
    this.$api.product.retrieve_all()
      .then(res => {
        this.products = res.data
        this.loading = false
      })
  },
  methods: {
  },
}
</script>