require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'scope' do
    before do
      @post2 = FactoryBot.create(:post)
    end
    it "正しいものが含まれて、関係ないのが含まれない" do
      post1 = FactoryBot.create(:post, is_special: true)
      expect(Post.is_special).to include(post1)
      expect(Post.is_special).to_not include(@post2)
      expect(Post.not_is_special).to include(@post2)
      expect(Post.not_is_special).to_not include(post1)
    end

    # scopeなのに何も返さないっておかしくねー
    it '何も返さない' do
      expect(Post.is_special).to be_empty
    end
  end

  describe 'test_attribute' do
    it 'sub_post には test_attribute があること' do
      expect(FactoryBot.build(:post, :sub_post).test_attribute).to eq 'test_attribute'
    end

    it 'post には test_attribute が存在しない' do
      expect(FactoryBot.build(:post).test_attribute).to be_falsey
    end
  end
end
