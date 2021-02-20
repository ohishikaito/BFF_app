class Api::LikesController < ApplicationController
  before_action :authenticate_api_user!, only: %i[create destroy]
  # likeしたらpostをいいね済みか判別するメソッドを作成
  # 一覧で取得した時に、個別のツイートがいいね済みか判別できるように！
  # likesテーブルにcurrent_userのidとpost_idが一致するならtrueを返す。post_idでパーティション導入を想定
  # ページネーションを想定して、posts#indexの処理にいいね済みかどうかを判別するのを設ける
  def create
    like = Like.new(like_params)
    if like.save
      like.reload # NOTE: counter_cultureで更新した値を反映させるためreloadする
      render json: like, include: :post, status: :created
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

    def like_params
      params.require(:like).permit(
        :id,
        :post_id,
      ).merge(user_id: current_api_user.id)
    end
end
