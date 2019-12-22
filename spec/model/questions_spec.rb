require 'rails_helper'

describe Question do
  describe '#create' do
    it "タイトルとユーザーidとジャンルidがあれば保存される" do
      level = create(:level)
      user = create(:user, level_id: level.id)
      genre = create(:genre)
      question = build(:question, user_id: user.id, genre_id: genre.id)
      expect(question).to be_valid
    end

    it "タイトルがなかったら無効" do
      question = build(:question, title: "")
      question.valid?
      expect(question.errors[:title]).to include("を入力してください")
    end

    it "ユーザーidがなかったら無効" do
      level = create(:level)
      user = create(:user, level_id: level.id)
      question = build(:question, user_id: "")
      expect(question).to be_invalid
    end

    it "ジャンルidがなかったら無効" do
      user = create(:genre)
      question = build(:question, genre_id: "")
      expect(question).to be_invalid
    end
  end
end
