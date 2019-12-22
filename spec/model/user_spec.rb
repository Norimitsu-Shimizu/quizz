require 'rails_helper'

describe User do
  describe '#create' do
    it "名前、email、パスワード、確認用パスワード、正答数、レベルが正しく入力されていること" do
      level = create(:level)
      user = build(:user, level_id: level.id)
      expect(user).to be_valid
    end

    it "名前が入力されてない場合無効" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailが入力されてない場合無効" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードが入力されてない場合無効" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "確認用パスワードが入力されてない場合無効" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "emailアドレスが重複していたら無効" do
      level = create(:level)
      user = create(:user, level_id: level.id)
      another_user = build(:user, email: user.email, level_id: level.id)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "レベルが入力されていない場合無効" do
      level = create(:level)
      user = build(:user, level_id: "")
      user.valid?
      expect(user).to be_invalid
    end

    it "パスワードが5文字以下だったら無効 " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end
  end

end
