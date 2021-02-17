class Api::PostsController < ApplicationController
  before_action :authenticate_api_user!, only: %i[create show update]

  def index
    # posts = Post.includes(:user)
    posts = cache_posts
    # p posts.
    render json: posts, status: :ok
  end

  def create
    post = Post.new(post_params)
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
    def cache_posts
      # binding.pry
      Rails.cache.fetch('cache_posts', expires_in: 60.minutes) do
        Post.includes(:user).to_a
      end
    end

    def post_params
      params.permit(
        :id,
        :name,
        :sub_name,
        :video,
      ).merge(user_id: current_api_user.id)
    end

end
