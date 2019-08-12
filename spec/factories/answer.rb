FactoryBot.define do

  factory :answer do
    answer {"新宿区"}
    correct {"正解"}

    trait :with_parent_question do
      question
    end
  end

end