Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  namespace :api, defaults: { format: :json } do
    resources :posts do
      resources :likes, only: %i[create destroy]
    end
    resources :users
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations',
      confirmations: 'api/auth/confirmations'
    }
    # mount_devise_token_auth_for 'AdminUser', at: 'auth'
    # mount_devise_token_auth_for 'AdminUser', at: 'omniauth', controllers: {
    #   omniauth_callbacks: "api/omniauth/omniauth_callbacks"
    # }
    devise_for :admin_users, controllers: {
      omniauth_callbacks: "api/omniauth/omniauth_callbacks"
    }
  end
end
