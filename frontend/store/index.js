export const state = () => ({
  user: null,
  bff_app_auth: null,
  authenticated: false,
})

export const getters = {
  getUser: (state) => state.user,
  getAuth: (state) => state.bff_app_auth,
  authenticated: (state) => state.authenticated,
}

export const mutations = {
  setUser(state, user) {
    this.$cookies.set('user', user)
    state.user = user
  },
  setAuth(state, headers) {
    const bff_app_auth = {
      'access-token': headers['access-token'],
      client: headers['client'],
      uid: headers['uid'],
      expiry: headers['expiry'],
    }
    this.$cookies.set('bff_app_auth', bff_app_auth)
    state.bff_app_auth = bff_app_auth
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
    this.$cookies.remove('bff_app_auth')
    state.bff_app_auth = null
  },
  disableAuthenticated(state) {
    this.$cookies.remove('authenticated')
    state.authenticated = false
  },
}

export const actions = {
  async nuxtClientInit({ commit }) {
    const user = this.$cookies.get('user')
    const bff_app_auth = this.$cookies.get('bff_app_auth')
    const authenticated = this.$cookies.get('authenticated')
    if (user) {
      commit('setUser', user)
    }
    if (bff_app_auth) {
      commit('setAuth', bff_app_auth)
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
