# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning models...'
  Upvote.destroy_all
  Creator.destroy_all
  User.destroy_all
  Batch.destroy_all
puts 'Done!'


puts "Creating Users..."
max = User.create!(username: "Max", email: "max@email.com", password: "123456", remote_avatar_url: "http://bit.ly/2EF3rJz", level: 0)
hugo = User.create!(username: "Hugo", email: "hugo@email.com", password: "123456", remote_avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/izq9au9wdqhux41ukrps.jpg", level: 2)
benoit= User.create!(username: "Benoit", email: "benoit@email.com", password: "123456", remote_avatar_url: "https://avatars3.githubusercontent.com/u/29869077?v=4", level: 1)
pip = User.create!(username: "Pip'", email: "pip@email.com", password: "123456", remote_avatar_url: "https://avatars2.githubusercontent.com/u/25395242?v=4", level: 3)
puts "Done!"

puts "Creating Batches..."
batch_8 = Batch.create!(status: "inactive", number: 201808)
batch_9 = Batch.create!(status: "active", number: 201809)
batch_10 = Batch.create!(status: "pending", number: 201810)
puts "Done!"

puts "Creating Creators..."
casey = Creator.create!(channel_url: "https://www.youtube.com/user/caseyneistat", youtube_name: "Casey Neistat", description: "THE inventor of vlogging", video_url: "https://www.youtube.com/watch?v=jG7dSXcfVqE", nb_followers: 130000, is_showcased: true, country: "United-States", language: "english", batch_id: batch_8.id, user_id: hugo.id, remote_avatar_photo_url: "https://yt3.ggpht.com/-x2NNN2y49G0/AAAAAAAAAAI/AAAAAAAAAAA/RhwVaxMvqW8/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: ["#Awesome" "#Vlog" "#World"])

benjamin_verrecchia = Creator.create!(channel_url: "https://www.youtube.com/channel/UCuKa7_pustUzOj3IBcgYNPg", youtube_name: "Benjamin Verrecchia", description: "His laugh is just too funny", video_url: "https://www.youtube.com/watch?v=PmWNOwD11YY", nb_followers: 87654, is_showcased: false, country: "france", language: "french", batch_id: batch_9.id, user_id: max.id,remote_avatar_photo_url: "https://yt3.ggpht.com/-iKLVj42_j2Y/AAAAAAAAAAI/AAAAAAAAAAA/TAcJtuq40Wk/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: "Funny Comic")
squeezie = Creator.create!(channel_url: "https://www.youtube.com/channel/UCWeg2Pkate69NFdBeuRFTAw", youtube_name: "squeezie", description: "So funny! Great indie videogaming", video_url: "https://www.youtube.com/watch?v=vUO1RDgkVgE", nb_followers: 117463, is_showcased: false, country: "france", language: "french", batch_id: batch_9.id, user_id: benoit.id, remote_avatar_photo_url: "https://yt3.ggpht.com/-PZerjsxPjTQ/AAAAAAAAAAI/AAAAAAAAAAA/209pUVEYY80/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: "Funny Gaming")
puts "Done"

puts "Creating upvotes... "
upvote1 = Upvote.create!(user_id: max.id, creator_id: casey.id)
upvote3 = Upvote.create!(user_id: benoit.id, creator_id: casey.id)
upvote2 = Upvote.create!(user_id: hugo.id, creator_id: benjamin_verrecchia.id)
upvote4 = Upvote.create!(user_id: benoit.id, creator_id: squeezie.id)
upvote4 = Upvote.create!(user_id: max.id, creator_id: squeezie.id)
puts "Done!"
# user1 = User.create!(username: "Maximilien", avatar:"http://bit.ly/2EF3rJz", email: "maximilien@email.com", password: "123456", is_artist: true, location: "New York", bio: "An artwork can be accommodated in an interior wall, in the living room, bedroom, kitchen or in a studio and showroom. The service of indoor artwork extends to both private clients, companies and public organizations.")



# puts "Creating 2 Users"
#   user1 = User.create!(username: "Maximilien", avatar:"http://bit.ly/2EF3rJz", email: "maximilien@email.com", password: "123456", channel_url: "channel-url1.com", nb_following: 12)
#   user2 = User.create!(username: "Tanguy", avatar:"http://bit.ly/2Hx6P7l", email: "tanguy@email.com", password: "123456", channel_url: "channel-url2.com", nb_following: 11)

# puts "Done!"

# puts "Creating 1 batch"
#   batch1 = Batch.create!(status: "In progress")
#   batch2 = Batch.create!(status: "Next week")
# puts "Done!"


# puts "Creating 2 Creators..."
#   creator1 = Creator.create!(youtube_name: "Lost in the swell", channel_url: "http://bit.ly/2ya6KnU", video_url: "https://youtu.be/fUpxoItNkZE?list=PLgNiukTEXKaLoSX_7BivTvSwjDpH0MTR3", description: "Lost in the swell is the surf adventures for Ewen, Aurel & Ronan!",nb_followers: 14000, is_showcased: false, country: "France",language: "french", user: user1, batch: batch1)
#   creator2 = Creator.create!(youtube_name: "Port d'Attache", channel_url: "http://bit.ly/2EYM2rD", video_url: "https://youtu.be/cbhO4bJLHdM", description: " L’équipage qui vous présente la Bretagne sous ses aspects les plus inédits ! Sa culture, sa gastronomie, ses initiatives et ses lieux insolites vont vous inspirer.", nb_followers: 107 , is_showcased: false, country: "France", language: "french", user: user2, batch: batch1)

# puts "Done!"
