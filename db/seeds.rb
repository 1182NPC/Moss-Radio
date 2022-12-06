# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

somelinks = ["https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1287781423&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1299224062&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://www.youtube.com/embed/iXAbte4QXKs",
            "https://www.youtube.com/embed/Njk2YAgNMnE",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/223078149&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/175250309&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/34486647&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://www.youtube.com/embed/7sFPYfm67yA",
            "https://www.youtube.com/embed/p5JM5r2J8r0",
            "https://www.youtube.com/embed/KGwDl_0mAys",
            "https://www.youtube.com/watch?v=JK8ilaPZbKE&list=PLZUqUj66LOrF-KP4mhdmXszkKKvETyQap&index=3W"]

puts 'Cleaning up database...'
Post.destroy_all
Radioset.destroy_all
Resident.destroy_all
Message.destroy_all
Chatroom.destroy_all

puts 'Creating seeds...'

User.create(email: "test@test.org", password: "123456", nickname: "nick", admin: true)

100.times do
  User.create(email: Faker::Internet.email, password: "123456", nickname: Faker::Internet.username, admin: false)
end

Chatroom.create(name: "Live Chat")



20.times do
  Resident.create(name: Faker::Games::WarhammerFantasy.hero, bio: Faker::Games::WarhammerFantasy.quote, links: "#{Faker::Internet.url}", photo: Faker::Avatar.image)
end

20.times do
  Post.create(title: Faker::Books::CultureSeries.culture_ship, rich_body: Faker::Lorem.paragraph(sentence_count: 100), date_published: Faker::Date.backward, author: Faker::Ancient.god, user: User.all.sample, published: true)
end


somelinks.each do |link|
  Radioset.create(audio_link: link, resident_id: Resident.all.sample.id, date: Faker::Date.backward, title: "#{Faker::Games::WarhammerFantasy.hero} #{Faker::Music.genre}" )
end

200.times do
  Postlike.create(post_id: Post.all.sample.id, user_id: User.all.sample.id)
end


# https://api.unsplash.com/photos/random/?client_id=mNgjWTimcrM2nhflhnZn5GT-Wc_i-JmfjXewz33l_-4
