require 'yaml'

puts 'Destroying Tags...'
ActsAsTaggableOn::Tag.destroy_all
puts 'Destroying upvotes...'
Upvote.destroy_all
puts 'Destroying creators...'
Creator.destroy_all
puts 'Destroying users...'
User.destroy_all
puts 'Destroying batches...'
Batch.destroy_all


file = Rails.root.join('db', 'seeds', 'seed.yml')
sample = YAML.load(open(file).read)

puts 'Creating Tags'
sample["tags"].each do |tag|
  ActsAsTaggableOn::Tag.create! tag
end

puts 'Creating users...'
users = {}
sample["users"].each do |user|
  users[user["username"]] = User.create! user.slice("username", "email", "password", "remote_avatar_url", "level")
end

# TODO : Faire en sorte que les gens de la seed aient leur e mail confirmé de maniere plus propre
User.all.each do |user|
  user.update(confirmed_at: DateTime.now)
end

puts 'Creating batches...'
batches = {}
sample["batches"].each do |batch|
  batches[batch["number"]] = Batch.create! batch.slice("number", "status")
end

puts 'Creating creators...'
creators = {}
sample["creators"].each do |creator|
  user = users[creator["user"]]
  batch = batches[creator["batch"]]
  creators[creator["youtube_name"]] = Creator.create! creator.slice("youtube_name",
    "channel_url", "video_url", "channel_id", "nb_followers", "description",
    "is_showcased", "remote_avatar_photo_url",
    "language","nb_videos", "tag_list", "country").merge(user: user).merge(batch: batch)
end

puts 'Finished!'

