# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  is_special :boolean          default(FALSE)
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
class Post < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: :true
  validates :is_special, inclusion: { in: [true, false] }

  mount_uploader :video, VideoUploader

  belongs_to :user
end
