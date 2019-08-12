require 'rails_helper'

describe Question do
  describe '#create' do
    it "is valid with a id, title, user_id, genre_id, created_at, updated_at" do
      user = create(:user)
      genre = create(:genre)
      question = build(:question, user_id: user.id, genre_id: genre.id)
      expect(question).to be_valid
    end

    it "is invalid without a title" do
      question = build(:question, title: "")
      question.valid?
      expect(question.errors[:title]).to include("を入力してください")
    end
  end
end
