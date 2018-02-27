# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'

puts 'Cleaning models...'
  User.destroy_all
  Creator.destroy_all
  Batch.destroy_all
puts 'Done!'

puts "Creating 2 Users"
  user1 = User.create!(username: "Maximilien", avatar:"http://bit.ly/2EF3rJz", email: "maximilien@email.com", password: "123456", channel_url: "channel-url1.com", nb_following: "12")
  user2 = User.create!(username: "Tanguy", avatar:"http://bit.ly/2Hx6P7l", email: "tanguy@email.com", password: "123456", channel_url: "channel-url2.com", nb_following: "11")

puts "Done!"

puts "Creating 1 batch"
  batch1 = Batch.create!(status: "In progress")
  batch2 = Batch.create!(status: "Next week")
puts "Done!"


puts "Creating 2 Creators..."
  creator1 = Creator.create!(youtube_name: "Lost in the swell", channel_url: "http://bit.ly/2ya6KnU", video_url: "https://youtu.be/fUpxoItNkZE?list=PLgNiukTEXKaLoSX_7BivTvSwjDpH0MTR3", description: "Lost in the swell is the surf adventures for Ewen, Aurel & Ronan!",nb_followers: "14,549 subscribers", is_showcased: false, country: "France",language: "french", user: user1, batch: batch1)
  creator2 = Creator.create!(youtube_name: "Port d'Attache", channel_url: "http://bit.ly/2EYM2rD", video_url: "https://youtu.be/cbhO4bJLHdM", description: " L’équipage qui vous présente la Bretagne sous ses aspects les plus inédits ! Sa culture, sa gastronomie, ses initiatives et ses lieux insolites vont vous inspirer.", nb_followers: "107 subscribers", is_showcased: false, country: "France", language: "french", user: user2, batch: batch1)

puts "Done!"
