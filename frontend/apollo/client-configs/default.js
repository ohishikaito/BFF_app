export default (ctx) => {
  return {
    httpEndpoint: `${process.env.BACKEND_ENDPOINT}/graphql`
  }
}