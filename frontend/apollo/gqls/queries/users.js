import gql from 'graphql-tag'

export function queryAllUsers() {
  return {
    query: gql`
      query queryAllUsers {
        allUsers {
          id
          email
          lastName
          firstName
          createdAt
          updatedAt
        }
      }
    `
  }
}
