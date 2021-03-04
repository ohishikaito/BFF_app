class Api::PostsController < ApplicationController
  respond_to :posts

  before_action :authenticate_api_user!, only: %i[create show update]
  before_action :set_post, only: %i[show update destroy]

  def index
    # posts = cache_posts_index # NOTE: redisのキャッシュ。でも使うの微妙
    # posts = Post.includes(likes: :user).id_desc
    posts = Post.includes(likes: :user).page(params[:page]).id_desc
    pagination = resources_with_pagination(posts)

    # respond_with posts, meta: {
    #   current_page: posts.current_page,
    #   next_page: posts.next_page,
    #   prev_page: posts.prev_page,
    #   total_pages: posts.total_pages,
    #   total_count: posts.total_count
    # }
    # respond_with posts, serializer: PaginationSerializer
    # render json: { posts: posts, pagination: pagination }, status: :ok
    # render json: { posts: posts, pagination: pagination }, include: [likes: :user], status: :ok

    # TypeError (no implicit conversion of Symbol into Integer):
    # render json: { posts: posts, pagination: pagination }, include: [likes: :user], each_serializer: PaginationSerializer, status: :ok
    # render json: { posts: posts, pagination: pagination }, each_serializer: PaginationSerializer, status: :ok
    # render json: posts, include: [likes: :user], serializer: PaginationSerializer, status: :ok
    # render json: posts, include: [likes: :user], status: :ok
    # render json: posts, include: [likes: :user], status: :ok

    # serializerが反応しない
    # render json: posts, include: [likes: :user], meta: resources_with_pagination(posts), status: :ok
    # render json: posts, meta: resources_with_pagination(posts), status: :ok

    # adapter: :jsonつけると何故かうまくいく。理由はよく分からん。includeでネストするやつも明示できる！
    render json: posts, meta: resources_with_pagination(posts), include: [likes: :user], status: :ok, adapter: :json
    # rootで指定するとpostsの名前が指定したhogehogeになる
    # render json: posts, root: "hogehoge", meta: resources_with_pagination(posts), include: [likes: :user], status: :ok, adapter: :json

    # metaをpaginationとかに名前変えるとレスポンスに含まれなくなる。うーんmeta必須なのかなあ
    # render json: posts, pagination: resources_with_pagination(posts), include: [likes: :user], status: :ok, adapter: :json
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
    render json: @post, include: :user, status: :ok
  end

  def update
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: @post, status: :ok
  end

  private
    # NOTE: 30分以内はキャッシュで同じ一覧しか返さなくなるので、あまりredisを使わないほうが良いかも
    def cache_posts_index
      Rails.cache.fetch("posts#index", expires_in: 30.minutes) do
        Post.includes(likes: :user).id_desc.to_a
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(
        :id,
        :name,
        :sub_name,
        :is_special,
        :video,
        :image,
      ).merge(user_id: current_api_user.id)
    end
end
