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

max = User.create!(username: "Max", email: "max@email.com", password: "123456")
hugo = User.create!(username: "Hugo", email: "hugo@email.com", password: "123456")
benoit= User.create!(username: "Benoit", email: "benoit@email.com", password: "123456")
pip = User.create!(username: "Pip'", email: "pip@email.com", password: "123456")

batch_9 = Batch.create!(status: "active", number: 201809)
batch_8 = Batch.create!(status: "inactive", number: 201808)

casey = Creator.create!(channel_url: "http://bit.ly/1sEbnIU", youtube_name: "Casey Neistat", description: "THE inventor of vlogging", video_url: "http://bit.ly/2mSafKI", nb_followers: 130000, is_showcased: true, country: "United-States", language: "english", batch_id: batch_8.id, user_id: hugo.id)
benjamin_verrecchia = Creator.create!(channel_url: "http://bit.ly/2Cn0qfp", youtube_name: "Benjamin Verrecchia", description: "His laugh is just too funny", video_url: "http://bit.ly/2BRhRnr", nb_followers: 87654, is_showcased: false, country: "france", language: "french", batch_id: batch_9.id, user_id: max.id)
squeezie = Creator.create!(channel_url: "http://bit.ly/1QGbnGm", youtube_name: "squeezie", description: "So funny! Great indie videogaming", video_url: "http://bit.ly/2BRhRnr", nb_followers: 117463, is_showcased: false, country: "france", language: "french", batch_id: batch_9.id, user_id: benoit.id)

upvote1 = Upvote.create!(user_id: max.id, creator_id: casey.id)
upvote3 = Upvote.create!(user_id: benoit.id, creator_id: casey.id)
upvote2 = Upvote.create!(user_id: hugo.id, creator_id: benjamin_verrecchia.id)
upvote4 = Upvote.create!(user_id: benoit.id, creator_id: squeezie.id)
upvote4 = Upvote.create!(user_id: max.id, creator_id: squeezie.id)

# user1 = User.create!(username: "Maximilien", avatar:"http://bit.ly/2EF3rJz", email: "maximilien@email.com", password: "123456", is_artist: true, location: "New York", bio: "An artwork can be accommodated in an interior wall, in the living room, bedroom, kitchen or in a studio and showroom. The service of indoor artwork extends to both private clients, companies and public organizations.")
