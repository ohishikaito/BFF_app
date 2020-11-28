class Api::PostsController < ApplicationController

  def index
    # posts = Post.all
    # render json: posts, status: :ok
    posts = Post.all
    render json: {
      data: posts.map do |post|
        {
          id: post.id,
          name: post.name
        }
      end,
    }
  end

  def create
    post = Post.new(post_params)
    # binding.pry
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find(params[:id])
    render json: post, status: :ok
  end

  def update
    post = Post.find(params[:id])
    # binding.pry
    post.update(post_params)
    render json: post, status: :ok
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: post, status: :ok
  end


  private
    def post_params
      # params.require(:post).permit(:name)
      # params.permit(:name, :id)
      params.require(:post).permit(:name, :id)
    end

end
