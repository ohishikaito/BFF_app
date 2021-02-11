export default function (ctx) {
  if (!ctx.store.getters['authenticated']) {
    ctx.redirect('/auth/sign-in')
  }
}
