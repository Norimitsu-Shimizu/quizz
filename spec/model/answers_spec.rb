require 'rails_helper'

describe Answer do
  describe '#create' do
    it "is valid with an answer" do
      answer = build(:answer)
      expect(answer).to be_valid
    end

    it "is invalid without an answer" do
      answer = build(:answer, answer: "")
      answer.valid?
      expect(answer.errors[:answer]).to include("を入力してください")
    end
  end
end