# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
class LikeSerializer < ActiveModel::Serializer
  attributes %i[
    id
    user_id
    post_id
  ]

  belongs_to :post
end
