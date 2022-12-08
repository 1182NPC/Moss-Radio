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
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1359565429&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://www.youtube.com/embed/Njk2YAgNMnE", #this one is a good one
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/944872972&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/301170935&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/34486647&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1384467310&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1251208174&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/815315500&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/570114879&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1397223793&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1378960729&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1397168932&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"]



sometitles = ["The Pace of Sonic Spatial Construction", "Notes on: Unsound festival", "Guest Editied by Re-record", "Perspectives: Grassroots organizers and industry professionals",
              "Cue Point: DJ Heartstring", "Moss Radio in Residence: The December Sessions", "Under the Covers - Planned obsolescence", "Production techniques for the mix", "Is radio still relevant?",
              "Source Material - House as a Funk revival", "Critical Infrastructure: Celebrating Grassroots Music Journalism"]

puts 'Cleaning up database...'
Post.destroy_all
Radioset.destroy_all
Resident.destroy_all
Message.destroy_all
Chatroom.destroy_all

puts 'Creating seeds...'

User.create(email: "test@test.org", password: "123456", nickname: "nick", admin: true)

50.times do
  User.create(email: Faker::Internet.email, password: "123456", nickname: Faker::Internet.username, admin: false)
end

Chatroom.create(name: "Live Chat")

seed_post = Post.create(title: "Music as a social experience in the digital age",
                        rich_body: "<div class='trix-content'>
                        <div>
                        <strong>Music and mood<br><br></strong>Though music tends to travel via the collective experience,
                        it remains an immensely personal aspect of our lives that has, for many of us, become inextricable from our memories,
                        aspirations and identities. It forms a crucial part of the individual, acting as a window into how a person views themselves and their position in the world,
                        through expression in music performance and through reflection in music listening. <br><br>Music and mood have a long-established and multifaceted relationship where mood can impact music listening decisions and music can express or induce emotional states:
                        ideas which have been harnessed in some <a href='https://81e0ff5d-f7d2-4d6f-b039-16dad765f9ef.filesusr.com/ugd/5109df_5727b0d24fe342f8aaa594157317895d.pdf'>successful music therapies</a>. Musical elements like tempo,
                        rhythm, timbre and harmony may be used to either reflect or counteract one's mood; for example, you may choose slower, more harmonic music to relax when feeling anxious, or choose faster,
                        more upbeat music to maintain a positive mood. These kinds of <a href='https://81e0ff5d-f7d2-4d6f-b039-16dad765f9ef.filesusr.com/ugd/5109df_b49282768d2140de9d0ec6d5a2b978a8.pdf'>
                        associations are cross-cultural</a> with a fairly universal understanding of cues like vocal intensity as an indication of anger.
                        There are of course some more culturally specified representations of emotion in music, with minor keys and dissonance being more affiliated with sadness in Western music.
                        <br><br><strong>Music in social spaces </strong><br><br><br>It's Friday night, and you're heading round to a gaff with your pals from art school. It's not your usual skeezy piss-up,
                        it's one of those parties where all the boys have tiny beanies and all the girls have new wave mullets. It is, for all intents and purposes,
                        a Cool Party. It's good fun, until you notice that the aux is working its way towards you. Christ. What will you put on? The fate of your interactions for the rest of your night rests upon this. <br><br>
                        </div><div>
                        <br>You pause, and then decide to take the risk. Fergie's <a href='https://open.spotify.com/track/5Nu1cp2yi4TlZF4KTmElFD'><em>Fergalicious</em></a> begins to play out the speaker and agonisingly,
                        you wait for everyone to register what's been put on. A few excruciating seconds pass… and the party goes wild. Party-goers,
                        regardless of their stylistic sub-genre – e-girls, skaters, punks, softbois, club kids and hip hop rats – start cutting shapes to Fergie. The queue is then quickly loaded with pop classics,
                        <em>Sound of the Underground</em> by Girls Aloud, <em>Sweet Escape</em> by Gwen Stefani, <em>Can't Get You Out Of My Head</em> by Kylie Minogue… <br><br><br><em>This example blog was taken from </em><a href='https://texturemag.net/'><em>texturemag</em></a><em>.</em>
                        </div><div>
                        <br>
                        </div>
                        </div>", date_published: Faker::Date.backward, author: "Sandra Smith", user: User.all.sample, published: true)

multi_path = File.join(Rails.root, 'app/assets/images/multi_image_seed')
seed_post.photos.attach(io: File.open("#{multi_path}/multi_seed1.jpg"), filename: 'multi_seed1.jpg',
                        content_type: 'image/jpg')

Resident.create(name: "DJ KEV & PERRY", bio: "Just a couple of tune-lovers from the UK living in Berlin! Having grown up up with a blend of inspirations ranging from King Gizzard and the Wizard Lizards,
                John Hopkins, Four Tet and Floating Points, our performances comine an eclectic mix of musical styles, exhibiting experimental yet 'in its own way still coherent' sound design ideas moulded with narrative and cinematic structures.",
                links: "#{Faker::Internet.url}", photo: Faker::Avatar.image)

19.times do
  Resident.create(name: Faker::Games::WarhammerFantasy.hero, bio: Faker::Games::WarhammerFantasy.quote, links: "#{Faker::Internet.url}", photo: Faker::Avatar.image)
end


10.times do
  Post.create(title: sometitles.sample, rich_body: Faker::Lorem.paragraph(sentence_count: 100), date_published: Faker::Date.backward, author: Faker::Ancient.god, user: User.all.sample, published: true)
end

somelinks.each do |link|
  Radioset.create(audio_link: link, resident_id: Resident.all.sample.id, date: Faker::Date.backward, title: "#{Faker::Games::WarhammerFantasy.hero} #{Faker::Music.genre}" )
end

100.times do
  Postlike.create(post_id: Post.all.sample.id, user_id: User.all.sample.id)
end


# https://api.unsplash.com/photos/random/?client_id=mNgjWTimcrM2nhflhnZn5GT-Wc_i-JmfjXewz33l_-4


# USE COMPRESSED IMAGE FOR PRESENTATION
