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
casey = Creator.create!(channel_url: "https://www.youtube.com/user/caseyneistat", youtube_name: "Casey Neistat", description: "THE inventor of vlogging", video_url: "https://www.youtube.com/watch?v=jG7dSXcfVqE", nb_followers: 130000, is_showcased: true, country: "United-States", language: "english", batch_id: batch_8.id, user_id: hugo.id, remote_avatar_photo_url: "https://yt3.ggpht.com/-x2NNN2y49G0/AAAAAAAAAAI/AAAAAAAAAAA/RhwVaxMvqW8/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: ["#Awesome", "#Vlog", "#World"])
benjamin_verrecchia = Creator.create!(channel_url: "https://www.youtube.com/channel/UCuKa7_pustUzOj3IBcgYNPg", youtube_name: "Benjamin Verrecchia", description: "His laugh is just too funny", video_url: "https://www.youtube.com/watch?v=PmWNOwD11YY", nb_followers: 87654, is_showcased: false, country: "france", language: "french", batch_id: batch_9.id, user_id: max.id,remote_avatar_photo_url: "https://yt3.ggpht.com/-iKLVj42_j2Y/AAAAAAAAAAI/AAAAAAAAAAA/TAcJtuq40Wk/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: ["Funny", "Comic"])
squeezie = Creator.create!(channel_url: "https://www.youtube.com/channel/UCWeg2Pkate69NFdBeuRFTAw", youtube_name: "Squeezie", description: "So funny! Great indie videogaming", video_url: "https://www.youtube.com/watch?v=vUO1RDgkVgE", nb_followers: 117463, is_showcased: false, country: "france", language: "french", batch_id: batch_9.id, user_id: benoit.id, remote_avatar_photo_url: "https://yt3.ggpht.com/-PZerjsxPjTQ/AAAAAAAAAAI/AAAAAAAAAAA/209pUVEYY80/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: ["Funny", "Gaming"])
mahdi_ba = Creator.create!(channel_url: "https://www.youtube.com/channel/UC6Uole8KsZP63g8qYgFAmkQ", youtube_name: "Mahdi Ba", description: "So funny! Humor from Quebec", video_url: "https://www.youtube.com/watch?v=vUO1RDgkVgE", nb_followers: 17463, is_showcased: false, country: "canada", language: "french", batch_id: batch_8.id, user_id: pip.id, remote_avatar_photo_url: "https://yt3.ggpht.com/-PZerjsxPjTQ/AAAAAAAAAAI/AAAAAAAAAAA/209pUVEYY80/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: ["Funny", "Gaming"])
steven = Creator.create!(channel_url: "https://www.youtube.com/channel/UC-pdFydi9ooxEfATh3KoiIw", youtube_name: "Steven", description: "His tech reviews are really good! And the quality of the video is great.", video_url: "https://www.youtube.com/watch?v=vUO1RDgkVgE", nb_followers: 11743, is_showcased: false, country: "france", language: "french", batch_id: batch_8.id, user_id: hugo.id, remote_avatar_photo_url: "https://yt3.ggpht.com/-PZerjsxPjTQ/AAAAAAAAAAI/AAAAAAAAAAA/209pUVEYY80/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg", tag_list: ["Funny", "Gaming"])
puts "Done"

puts "Creating upvotes... "
upvote1 = Upvote.create!(user_id: max.id, creator_id: casey.id)
upvote3 = Upvote.create!(user_id: benoit.id, creator_id: casey.id)
upvote2 = Upvote.create!(user_id: hugo.id, creator_id: benjamin_verrecchia.id)
upvote4 = Upvote.create!(user_id: benoit.id, creator_id: squeezie.id)
upvote4 = Upvote.create!(user_id: max.id, creator_id: squeezie.id)
puts "Done!"


###################################
# require 'yaml'

# file = Rails.root.join('db', 'seeds', 'seed.yml')
# sample = YAML.load(open(file).read)

# puts 'Creating creators...'
# creators = {}
# sample["creators"].each do |creator|
#   creators[creator["youtube_name"]] = Creator.create! creator.slice("youtube_name", "channel_url")
# end

# puts 'Finished!'








