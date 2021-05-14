module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :sub_name, String, null: true
    field :user_id, ID, null: true
    field :is_special, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end