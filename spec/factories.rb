FactoryGirl.define do
  factory :video do
    title Faker::Lorem.word
    description Faker::Lorem.words(50).join(' ')
    uri Faker::Internet.uri('https')
    user
  end

  factory :user do
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
  end

  factory :session do
    user
  end
end
