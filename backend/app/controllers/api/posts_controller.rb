class Api::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts, status: :ok
  end

  def def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
      # render json: post, serializer: PostSerializer, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:name)
    end

end
