const BASE_URL = '/api/products'
export default ($axios) => ({
  retrieve_all() {
    return new Promise((resolve, reject) => {
      $axios.get(BASE_URL)
        .then((res) => { resolve(res) })
        .catch((err) => { reject(err) })
    })
  },
})