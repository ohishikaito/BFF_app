module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    # NOTE: e.g.
    # query {
    #   posts {
    #     id
    #     name
    #     createdAt
    #   }
    # }

    field :posts, [Types::PostType], null: false
    def posts
      Post.includes(:user)
    end

    # field :post, Types::PostType, null: false do
    #   description 'ユーザ情報を1件取得する'
    #   argument :id, ID, required: true, description: 'ユーザID'
    # end
    # def post(id:)
    #   Post.find(id)
    # end

    # NOTE: e.g.
    # query {
    #   post(id: 1) {
    #     id
    #     name
    #     createdAt
    #   }
    # }

    field :post, Types::PostType, null: false do
      argument :id, ID, required: false
    end
    def post(id:)
      Post.find(id)
    end

    # NOTE: e.g.
    # query {
    #   allUsers {
    #     id
    #     email
    #     lastName
    #     firstName
    #     createdAt
    #     updatedAt
    #   }
    # }
    field :all_users, [Types::UserType], null: false
    def all_users
      User.includes(likes: :post)
    end
  end
end
