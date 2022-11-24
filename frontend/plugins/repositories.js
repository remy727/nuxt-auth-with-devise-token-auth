import createRepository from '~/repositories/Repository'

export default (ctx, inject) => {
  inject('api', createRepository(ctx.$axios))
}