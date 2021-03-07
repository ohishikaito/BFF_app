require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    # 姓、名、メール、パスワードがあれば有効な状態であること
    it "is valid with a first name, last name, email, and password" do
      expect(build(:user)).to be_valid
    end

    # 名がなければ無効な状態であること
    it "is invalid without a first name" do
      expect(build(:user, first_name: nil)).to be_invalid
    end

    # 姓がなければ無効な状態であること
    it "is invalid without a last name" do
      expect(build(:user, last_name: nil)).to be_invalid
    end

    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address" do
      expect(build(:user, email: nil)).to be_invalid
    end

    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      user = create(:user, email: "ohishikaito@gmail.com")
      user2 = build(:user, email: "ohishikaito@gmail.com")
      expect(user2).to be_invalid
    end
  end

  describe 'methods' do
    # ユーザーのフルネームを文字列として返すこと
    it "returns a user's full name as a string" do
      user = build(:user, first_name: '海渡', last_name: '大石')
      expect(user.full_name).to eq '大石海渡'
    end
  end
end
