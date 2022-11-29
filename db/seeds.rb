# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

somelinks = ["https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1287781423&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1299224062&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://www.youtube.com/embed/iXAbte4QXKs",
            "https://www.youtube.com/embed/Njk2YAgNMnE"]

puts 'Cleaning up database...'
Post.delete_all
Radioset.delete_all
Resident.delete_all
Message.delete_all

puts 'Creating seeds...'

20.times do
  Resident.create(name: Faker::Games::WarhammerFantasy.hero, bio: Faker::Games::WarhammerFantasy.quote, links: "#{Faker::Internet.url}", photo: Faker::Avatar.image)
end

20.times do
  Post.create(title: Faker::Books::CultureSeries.culture_ship, content: Faker::Lorem.paragraph(sentence_count: 100), date_published: Faker::Date.backward, author: Faker::Ancient.god, user: User.all.sample)
end

somelinks.each do |link|
  Radioset.create(audio_link: link, resident_id: Resident.all.sample.id)
end
