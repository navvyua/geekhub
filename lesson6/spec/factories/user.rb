FactoryGirl.define do
  factory :user do
    email                 Faker::Internet.email
    password              '123456s'
    password_confirmation '123456s'

    trait :invalid do
      email    nil
      password nil
    end

    trait :admin do
      admin true
    end
  end
end