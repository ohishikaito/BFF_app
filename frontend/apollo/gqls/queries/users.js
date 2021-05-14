import gql from 'graphql-tag'

export function allUsers() {
  return {
    query: gql`
      query allUsers {
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
