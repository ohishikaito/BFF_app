class Api::LikesController < ApplicationController
  before_action :authenticate_api_user!, only: %i[create destroy]

  def create
    like = Like.new(like_params)
    if like.save
      # NOTE: counter_cultureで更新した値を反映させるためreloadする
      like.reload
      render json: like, include: :post, status: :created
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    head :no_content
  end

  private

    def like_params
      params.require(:like).permit(
        :id,
        :post_id,
      ).merge(user_id: current_api_user.id)
    end
end
