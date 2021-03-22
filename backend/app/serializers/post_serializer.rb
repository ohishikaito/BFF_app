# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  image       :string(255)
#  is_special  :boolean          default(FALSE)
#  likes_count :integer          default(0), not null
#  name        :string(255)
#  sub_name    :string(255)
#  video       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
class PostSerializer < ActiveModel::Serializer
  attributes_keys = Post.column_names.map(&:to_sym)
  attributes_keys.push(
    :liked_users
  )
  attributes(attributes_keys)

  # attributes %i[
  #   id
  #   name
  #   sub_name
  #   is_special
  #   video
  #   image
  #   likes_count
  #   created_at
  #   liked_users
  # ]

  belongs_to :user
  has_many :likes
end
