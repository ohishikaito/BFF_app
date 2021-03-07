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
class Post < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: :true
  validates :is_special, inclusion: { in: [true, false] }

  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  belongs_to :user

  scope :is_special, -> { where(is_special: true) }
  scope :not_is_special, -> { where(is_special: false) }
  counter_culture :user,
                  column_name: proc { |model| model.is_special == true ? 'sp_post_count' : nil },
                  column_names: {
                      Post.is_special => :sp_post_count,
                      Post.not_is_special => nil
                  }

  scope :id_desc, -> { order(id: 'DESC') }

  attribute :test_attribute # NOTE: RSpecの勉強＆テスト用に追加した属性
end
