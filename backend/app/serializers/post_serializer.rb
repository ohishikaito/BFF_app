# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  name       :string(255)
#  sub_name   :string(255)
#  video      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class PostSerializer < ActiveModel::Serializer
  attributes %i[
    id
    name
    sub_name
    video
    created_at
  ]

  belongs_to :user
end
