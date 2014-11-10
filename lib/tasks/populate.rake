namespace :db do
  task populate: :environment do
    user = User.last
    Video.destroy_all

    20.times do
      user.videos.create(
        title: Faker::Name.name,
        description: Faker::Lorem.words(50).join(' '),
        uri: Faker::Internet.uri('https')
      )
    end

  end
end
