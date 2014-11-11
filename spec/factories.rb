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

  factory :service do
    name Faker::Company.name
  end

  factory :environment do
    association :service
    name Faker::Lorem.word
  end

  factory :failure do
    association :environment
    message "heck"
    hostname "local"
    error_type "StandardError"
  end
end
