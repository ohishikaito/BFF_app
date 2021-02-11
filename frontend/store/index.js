export const state = () => ({
  user: null,
  auth: null,
  authenticated: false,
})

export const getters = {
  getUser: (state) => state.user,
  getAuth: (state) => state.auth,
  getAuthenticated: (state) => state.authenticated,
}

export const mutations = {
  setAuth(state, headers) {
    const auth = {
      'access-token': headers['access-token'],
      client: headers['client'],
      uid: headers['uid'],
    }
    this.$cookies.set('auth', auth)
    state.auth = auth
  },
  enableAuthenticated(state) {
    this.$cookies.set('authenticated', true)
    state.authenticated = true
  },
  setUser(state, user) {
    this.$cookies.set('user', user)
    state.user = user
  },
}

export const actions = {
  signIn({ commit }, payload) {
    commit('setAuth', payload)
    commit('enableAuthenticated')
  },
  setUser({ commit }, payload) {
    commit('setUser', payload)
  },
}
