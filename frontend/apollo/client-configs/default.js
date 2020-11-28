import { HttpLink } from "apollo-link-http";

export default () => {
  const httpLink = new HttpLink({ uri: "http://localhost:3004/graphql" });
  return {
    link: httpLink
  };
};
