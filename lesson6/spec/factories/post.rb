FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text  { Faker::Lorem.paragraph }

    user

    trait :invalid do
      title nil
      text  nil
    end
  end
end