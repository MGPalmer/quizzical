FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password(min_length: 10) }
  end

  factory :confirmed_user, parent: :user do
    confirmed_at { Time.now }
  end
end
