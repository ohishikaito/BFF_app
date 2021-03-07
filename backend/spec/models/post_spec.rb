require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'scope' do
    before do
      @post2 = create(:post)
    end
    it "正しいものが含まれて、関係ないのが含まれない" do
      post1 = create(:post, is_special: true)
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

  describe 'trait' do
    context 'test_attribute' do
      it 'sub_post には test_attribute があること' do
        expect(build(:post, :sub_post).test_attribute).to eq 'test_attribute'
      end

      it 'post には test_attribute が存在しない' do
        expect(build(:post).test_attribute).to be_falsey
      end
    end

    context 'with_likes' do
      it 'createのコールバックでwith_likesブロックが実行されること' do
        post = create(:post, :with_likes)
        expect(post.likes.length).to eq 5
      end
  end
  end
end
