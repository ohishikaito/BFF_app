Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  namespace :api do
    resources :posts
    resources :users
  end
end
