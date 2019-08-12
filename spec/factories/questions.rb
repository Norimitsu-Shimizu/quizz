FactoryBot.define do

  factory :question do
    id          {"1"}
    title       {"スカイツリーは何区にある"}
    created_at  {"2019-08-8 10:30:00"}
    updated_at  {"2019-08-8 10:30:00"}

    trait :with_answers do
      after(:create) do |question|
        create_list(:answer, 3, question: question)
      end
    end
  end

end