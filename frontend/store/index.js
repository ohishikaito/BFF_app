export const state = () => ({
  user: null,
  auth: null,
  authenticated: false,
})

export const getters = {
  getUser: (state) => state.user,
  getAuth: (state) => state.auth,
  authenticated: (state) => state.authenticated,
}

export const mutations = {
  setUser(state, user) {
    this.$cookies.set('user', user)
    state.user = user
  },
  setAuth(state, headers) {
    const auth = {
      'access-token': headers['access-token'],
      client: headers['client'],
      uid: headers['uid'],
      expiry: headers['expiry'],
    }
    this.$cookies.set('auth', auth)
    state.auth = auth
  },
  enableAuthenticated(state) {
    this.$cookies.set('authenticated', true)
    state.authenticated = true
  },
  removeUser(state) {
    this.$cookies.remove('user')
    state.user = null
  },
  removeAuth(state) {
    this.$cookies.remove('auth')
    state.auth = null
  },
  disableAuthenticated(state) {
    this.$cookies.remove('authenticated')
    state.authenticated = false
  },
}

export const actions = {
  async nuxtClientInit({ commit }) {
    const user = this.$cookies.get('user')
    const auth = this.$cookies.get('auth')
    const authenticated = this.$cookies.get('authenticated')
    if (user) {
      commit('setUser', user)
    }
    if (auth) {
      commit('setAuth', auth)
    }
    if (authenticated) {
      commit('enableAuthenticated')
    }
  },
  setUser({ commit }, payload) {
    commit('setUser', payload)
  },
  signIn({ commit }, payload) {
    commit('setAuth', payload)
    commit('enableAuthenticated')
  },
  signOut({ commit }) {
    commit('removeUser')
    commit('removeAuth')
    commit('disableAuthenticated')
  },
  unAuthorized({ commit }) {
    commit('removeUser')
    commit('disableAuthenticated')
  },
}
