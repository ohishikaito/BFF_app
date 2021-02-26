# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  is_special  :boolean          default(FALSE)
#  likes_count :integer          default(0), not null
#  name        :string(255)
#  sub_name    :string(255)
#  video       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  # ユーザーのフルネームを文字列として返すこと
  it "scope" do
    post1 = Post.create!(
      likes_count:  0,
      user_id:  1,
      is_special:   true,
    )
    post2 = Post.create!(
      likes_count:  0,
      user_id:  1,
      is_special:   false,
    )
    expect(Post.is_special).to include(post1)
    expect(Post.is_special).to_not include(post2)
    expect(Post.not_is_special).to include(post2)
    expect(Post.not_is_special).to_not include(post1)
  end
end
