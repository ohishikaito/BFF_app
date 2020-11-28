module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :user_id, ID, null: true
    # field :id, ID, null: false, resolve: -> (post, _args, _context) { post.id }
    # field :name, String, null: false, resolve: -> (post, _args, _context) { post.name }
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end