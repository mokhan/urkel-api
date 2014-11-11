namespace :db do
  task populate: :environment do
    Video.destroy_all
    user = User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
    puts user.email

    20.times do
      user.videos.create(
        title: Faker::Name.name,
        description: Faker::Lorem.words(50).join(' '),
        uri: Faker::Internet.uri('https')
      )
    end
  end
end
