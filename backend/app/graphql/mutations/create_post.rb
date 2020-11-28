module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :name, String, required: false

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(name:)
      post = Post.new(name: name)

      if post.save
        {
          post: post,
          errors: []
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end